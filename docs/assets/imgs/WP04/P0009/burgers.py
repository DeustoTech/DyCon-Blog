import dolfin

import scipy.linalg as spla
import matplotlib.pyplot as plt
import numpy as np

from scipy.integrate import solve_ivp
from spacetime_galerkin_pod.ldfnp_ext_cholmod import SparseFactorMassmat

dolfin.parameters['linear_algebra_backend'] = 'Eigen'

nu = 1e-4  # the viscosity

N = 80
poddim = 25

t0, tE, Nts = 0., 1., 101  # the time grid for the snapshots
timegrid = np.linspace(t0, tE, Nts)

plt.style.use('bmh')
vmax = 2.5  # uniform scaling for the plot colors
nplts = 4  # number of plots
pltgrid = [x*np.int(np.floor(Nts/(nplts-1))) for x in range(nplts)]

# The mesh
pone = dolfin.Point(-1, -1)
ptwo = dolfin.Point(1, 1)
mesh = dolfin.RectangleMesh(pone, ptwo, N, N)

V = dolfin.VectorFunctionSpace(mesh, 'CG', 2)

# ## The FENICS FEM Discretization
v = dolfin.TestFunction(V)
u = dolfin.TrialFunction(V)

# ## the mass matrix
mform = dolfin.inner(v, u)*dolfin.dx
massm = dolfin.assemble(mform)
mmat = dolfin.as_backend_type(massm).sparray()
mmat.eliminate_zeros()
# factorize it for later
mfac = SparseFactorMassmat(mmat)


# norm induced by the mass matrix == discrete L2-norm
def mnorm(uvec):
    return np.sqrt(np.inner(uvec, mmat.dot(uvec)))


# ## the stiffness matrix
# as a form in FEniCS
aform = nu*dolfin.inner(dolfin.grad(v), dolfin.grad(u))*dolfin.dx
aassm = dolfin.assemble(aform)
# as a sparse matrix
amat = dolfin.as_backend_type(aassm).sparray()
amat.eliminate_zeros()


# ## the convective term
# as a function in FEniCS
def burgers_nonl_func(ufun):
    cform = dolfin.inner(dolfin.grad(ufun)*ufun, v)*dolfin.dx
    cass = dolfin.assemble(cform)
    return cass


# as a vector to vector map
def burgers_nonl_vec(uvec):
    ufun = dolfin.Function(V)
    ufun.vector().set_local(uvec)
    bnlform = burgers_nonl_func(ufun)
    bnlvec = bnlform.get_local()
    return bnlvec


# burgers rhs
def brhs(time, uvec):
    # print(time, uvec.size, np.linalg.norm(uvec))
    convvec = burgers_nonl_vec(uvec)
    diffvec = amat.dot(uvec)
    return mfac.solve_M(-diffvec-convvec)


def plotabs(uvec, fignum=None, vmax=None, xlabel='',
            sprws=1, spcls=1, spidx=1, colormap='plasma'):
    ufun = dolfin.Function(V)
    ufun.vector().set_local(uvec)
    plt.figure(fignum)
    plt.subplot(sprws, spcls, spidx)
    cplt = dolfin.plot(dolfin.inner(ufun, ufun))
    cplt.set_cmap(colormap)
    plt.xlabel(xlabel)
    if vmax is not None:
        cplt.set_clim(vmin=0, vmax=vmax)
    plt.colorbar(cplt)


# define the initial value
inivstrg = '1.0*exp(-3.*(x[0]*x[0]+x[1]*x[1]))'
inivexpr = dolfin.Expression((inivstrg, inivstrg), degree=2)
inivfunc = dolfin.interpolate(inivexpr, V)
inivvec = inivfunc.vector().get_local()

burgsol = solve_ivp(brhs, (t0, tE), inivvec, t_eval=timegrid, method='RK23')
# burgsol = solve_ivp(brhs, (t0, tE), inivvec, t_eval=timegrid, method='BDF')
# burgsol = solve_ivp(brhs, (t0, tE), inivvec, t_eval=timegrid, method='Radau')
# burgsol = solve_ivp(brhs, (t0, tE), inivvec, t_eval=timegrid, method='LSODA')
# burgsol = solve_ivp(brhs, (t0, tE), inivvec, t_eval=timegrid)

if not burgsol.status == 0:
    print(burgsol.message)  # for some parameters there might be shocks
fullsol = burgsol.y

for k, cidx in enumerate(pltgrid):
    csol = fullsol[:, cidx]
    xlab = '$t={0}$'.format(timegrid[cidx])
    plotabs(csol, fignum=5, vmax=vmax, spcls=nplts, spidx=k+1, xlabel=xlab)

# L = np.linalg.cholesky(mmat.toarray())
snapshotmat = mfac.Ft.dot(burgsol.y)
podmodes, svals, _ = spla.svd(snapshotmat, full_matrices=False)
plt.figure(303)
plt.semilogy(svals, 'o')

podvecs = mfac.solve_Ft(podmodes[:, :poddim])

print(np.allclose(np.eye(poddim), podvecs.T.dot(mmat.dot(podvecs))))
prjinivvec = podvecs.T.dot(mmat.dot(inivvec))
iniprjerr = mnorm(inivvec - podvecs.dot(prjinivvec))
print('projection error for inival: {0:.3e}'.format(iniprjerr))

redamat = podvecs.T.dot(amat.dot(podvecs))


def redbrhs(time, redvec):
    inflatedv = podvecs.dot(redvec)
    redconv = podvecs.T.dot(burgers_nonl_vec(inflatedv))
    return -redamat.dot(redvec) - redconv.flatten()


redburgsol = solve_ivp(redbrhs, (t0, tE), prjinivvec,
                       t_eval=timegrid, method='RK23')
podredsol = redburgsol.y

for k, cidx in enumerate(pltgrid):
    csol = podvecs.dot(podredsol[:, cidx])
    xlab = '$t={0}$'.format(timegrid[cidx])
    plotabs(csol, fignum=6, vmax=vmax, spcls=nplts, spidx=k+1, xlabel=xlab)
    fsol = fullsol[:, cidx]

tlist, errlist = [], []
for k, cidx in enumerate(pltgrid):
    plt.figure(7)
    fsol = fullsol[:, cidx]
    csol = podvecs.dot(podredsol[:, cidx])
    diff = csol-fsol
    sqrtlogdiff = np.sqrt(np.abs(.5*np.log((csol-fsol)**2)))
    sqrtlogdiffun = dolfin.Function(V)
    sqrtlogdiffun.vector().set_local(sqrtlogdiff)
    plt.subplot(1, nplts, k+1)
    cplt = dolfin.plot(-dolfin.inner(sqrtlogdiffun, sqrtlogdiffun))
    cplt.set_cmap('cividis')
    cplt.set_clim(vmin=-14, vmax=-3)
    xlab = '$t={0}$'.format(timegrid[cidx])
    plt.xlabel(xlab)
    plt.colorbar(cplt)
    errlist.append(mnorm(diff))
    tlist.append(timegrid[cidx])

plt.figure(103)
plt.plot(tlist, errlist, 'o', label='POD')
plt.show(block=False)

# ## DMD

# ### dmd using truncated svd inverse
fburgsol = burgsol.y
Xmat = fburgsol[:, :-1]
Xdsh = fburgsol[:, 1:]
ux, sx, vxh = spla.svd(Xmat, full_matrices=False)  # lapack_driver='gesvd')
uxr, sxr, vxhr = ux[:, :poddim], sx[:poddim], vxh[:poddim, :]
dmdaone = Xdsh.dot(vxhr.T)
dmdatwo = np.linalg.solve(np.diag(sxr), uxr.T)


dmdxo = inivvec
dmdsol = [dmdxo]
for k in np.arange(Nts):
    dmdsol.append(dmdaone.dot(dmdatwo.dot(dmdsol[-1])))

dmdsol = np.array(dmdsol).T

for k, cidx in enumerate(pltgrid):
    csol = dmdsol[:, cidx]
    fsol = fullsol[:, cidx]
    xlab = '$t={0}$'.format(timegrid[cidx])
    plotabs(csol, fignum=8, vmax=vmax, spcls=nplts, spidx=k+1, xlabel=xlab)

tlist, errlist = [], []
for k, cidx in enumerate(pltgrid):
    if k == 0:  # at t=0 the error is 0
        cidx = cidx+1
    plt.figure(9)
    fsol = fullsol[:, cidx]
    csol = dmdsol[:, cidx]
    diff = csol-fsol
    sqrtlogdiff = np.sqrt(np.abs(.5*np.log((csol-fsol)**2)))
    sqrtlogdiffun = dolfin.Function(V)
    sqrtlogdiffun.vector().set_local(sqrtlogdiff)
    plt.subplot(1, nplts, k+1)
    cplt = dolfin.plot(-dolfin.inner(sqrtlogdiffun, sqrtlogdiffun))
    cplt.set_cmap('cividis')
    cplt.set_clim(vmin=-14, vmax=-3)
    xlab = '$t={0}$'.format(timegrid[cidx])
    plt.xlabel(xlab)
    plt.colorbar(cplt)
    errlist.append(mnorm(diff))
    tlist.append(timegrid[cidx])

plt.figure(103)
plt.plot(tlist, errlist, 'o', label='DMD')
plt.legend()
plt.show(block=False)

__author__ = "Borjan Geshkovski"

#-----------------------------------------------------#
# Optimal control solver for the parabolic obstacle
# problem by use of a penalization method for the
# underlying variational inequality.
#-----------------------------------------------------#

from fenics import *
from fenics_adjoint import *
from collections import OrderedDict
from obstacles import dome

def smoothmax(r, eps=1e-4):
	""" Smooth approximation of max(x, 0). """
	return conditional(gt(r, eps), r-eps/2, conditional(lt(r, 0), 0, r**2/(2*eps)))

nu = Constant(1e-2)																	# Diffusion coefficent

# Meshing and generating function space
mesh = RectangleMesh(Point(-2,-2), Point(2,2), 64, 64)
V = FunctionSpace(mesh, "CG", 2)					# Function space

data = Expression("1-(-0.3*t+0.85)*(x[0]*x[0]+x[1]*x[1])", t = 0, degree = 4)

# Time parameters
dt = Constant(0.1)
T = 2

# Set up the control function (it will depend on time)
ctrls = OrderedDict()
t = float(dt)
while t <= T:
	ctrls[t] = Function(V)
	t += float(dt)

def solve_parabolic(ctrls, epsilon):
	""" The forward problem. """

	u = Function(V, name="solution")
	v = TestFunction(V)
	f = Function(V, name="source")
	d = Function(V, name="data")
	psi = interpolate(dome(degree=2),V)

	u_n = Expression("1-0.85*(x[0]*x[0]+x[1]*x[1])", degree=3)
	u_n = interpolate(u_n, V)

	F = u*v*dx + nu*dt*dot(grad(u), grad(v))*dx - dt/epsilon*dot(smoothmax(-u+psi), v)*dx - (u_n + dt*(f+0.01))*v*dx
	bc = DirichletBC(V, 0.0, "on_boundary")	

	t = float(dt)
	j = 0.5*float(dt)*assemble((u - d)**2*dx)

	vtk_sol = File("output/parabolic/state.pvd")
	vtk_ctr = File("output/parabolic/control.pvd")
	vtk_data = File("output/parabolic/data.pvd")
	vtk_psi = File("output/parabolic/obstacle.pvd")
	vtk_psi << psi

	while t <= T:
		f.assign(ctrls[t])
		data.t = t
		d.assign(interpolate(data, V))
		solve(F==0, u, bcs=bc)

		if t > T - float(dt):
			weight = 0.5
		else:
			weight = 1
		j += weight*float(dt)*assemble((u - d)**2*dx)

		vtk_sol << (u, t)
		vtk_data << (d, t)
        # vtk_ctr << (ctrls[t], t)
        # Update time
		t += float(dt)
	return u, d, j

epsilon = Constant(1e-4)						# Smoothing parameter
y, yd, j = solve_parabolic(ctrls, epsilon)
alpha = Constant(1e-2)

regularisation = alpha/2*sum([1/dt*(fb-fa)**2*dx for fb, fa in
     zip(list(ctrls.values())[1:], list(ctrls.values())[:-1])])
J = j + assemble(regularisation)
m = [Control(c) for c in ctrls.values()]

rf = ReducedFunctional(J, m)
opt_ctrls = minimize(rf, options={"maxiter": 10})

dico = OrderedDict()
s = float(dt)
i = 0
while s <= T:
    dico[s] = opt_ctrls[i]
    i+= 1
    s += float(dt)
new_u, new_d, new_j = solve_parabolic(dico, epsilon)
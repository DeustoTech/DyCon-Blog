__author__ = "Borjan Geshkovski"

#-----------------------------------------------------#
# Optimal control solver for the classical obstacle
# problem by use of a penalization method for the
# underlying variational inequality.
#-----------------------------------------------------#

from fenics import *
from fenics_adjoint import *
from obstacles import dome, parabola, stairs, gaussian

set_log_level(ERROR)	# This will only show the relevant errors and disables the "Solving problem.." quote.

def smoothmax(r, eps=1e-4):
	""" Smooth approximation of x |--> max(x, 0) """
	return conditional(gt(r, eps), r-eps/2, conditional(lt(r, 0), 0, r**2/(2*eps)))

# Square: \Omega = [-2,2]^2.
mesh = RectangleMesh(Point(-2,-2), Point(2,2), 128, 128)

# The function space for the solution and control functions
V = FunctionSpace(mesh, "CG", 1)

# The functions
y = Function(V, name="State")
u = Function(V, name="Control")
w = TestFunction(V)
psi = interpolate(dome(degree=4), V)		# The obstacle

# The regularization parameters
alpha, eps = 1e-4, 1e-6

# The boundary conditions
bc = DirichletBC(V, 0.0, "on_boundary")

yd = interpolate(Expression("0.5*(cos(x[0])+cos(x[1]))", degree=2), V)

# Another possible target could simply be a solution to the uncontrolled obstacle problem.
# Useful for comparison (algorithm should produce control which is more or less like 1.1)
# f0 = Constant(-1)
# F0 = inner(grad(yd), grad(w))*dx - 1/(1e-3)*inner(smoothmax(-yd+psi, eps), w)*dx - inner(f0, w)*dx
# solve(F0 == 0, yd, bcs=bc)					

# The source term
f = Constant(0.1)

# Solving the penalized problem for the state
F = inner(grad(y), grad(w))*dx - 1/alpha*inner(smoothmax(-y+psi, eps), w)*dx - inner(f+u, w)*dx
solve(F == 0, y, bcs=bc)

# Minimizing the objective functional to find the control
delta = Constant(1e-2)
J = assemble(0.5*inner(y-yd, y-yd)*dx + delta/2*inner(u, u)*dx)		# The objective functional
m = Control(u)

Jhat = ReducedFunctional(J, m)										# Only depnds on the control
u_opt = minimize(Jhat, options={"maxiter": 15, "gtol": 1e-6, "ftol": 1e-100})

# Update the optimal state
y_opt = y.block_variable.saved_output
Control(y).update(y_opt)

# Save the results for postprocessing in ParaView
psipvd = File("elliptic/psi.pvd")
ypvd = File("elliptic/y_opt.pvd")
upvd = File("elliptic/u_opt.pvd")
ydpvd = File("elliptic/yd.pvd")
	
ypvd << y_opt
upvd << u_opt
ydpvd << yd
psipvd << psi

# Computing the violation of the constraint u >= psi
feasibility = sqrt(assemble(inner((Max(Constant(0.0), -y_opt+psi)), (Max(Constant(0.0), -y_opt+psi)))*dx))
error = sqrt(assemble(inner(y_opt - yd, y_opt - yd)*dx))

# print("Norm of y_opt: %f" % sqrt(assemble(inner(y_opt, y_opt)*dx)))
# print("Norm of u_opt: %f" % sqrt(assemble(inner(u_opt, u_opt)*dx)))
# print("Constraint violation: %f" % feasibility)

# Postprocessing

# parameters = [pow(10, -i) for i in range(1, 6)]
# plt_feas_4 = []
# plt_feas_2 = []
# plt_feas_0 = []
# plt_error_4 = []
# plt_error_2 = []
# plt_error_0 = []

# # Plotting the results
# import numpy as np
# import matplotlib.pyplot as plt

# for i, alpha in enumerate(parameters):
# 	print("----------------------------------------------------------------------")
# 	feasibility, error = optimal_control(i, alpha, 1e-4)
# 	print("Penalty parameter (alpha): %f" % pow(10, -i))
# 	print("Constraint violation: %f" % feasibility)
# 	plt_feas_4.append(feasibility)
# 	plt_error_4.append(error)
# print("----------------------------------------------------------------------")

# for j, beta in enumerate(parameters):
# 	print("----------------------------------------------------------------------")
# 	_feasibility, _error = optimal_control(j, beta, 1e-0)
# 	print("Penalty parameter (alpha): %f" % pow(10, -j))
# 	print("Constraint violation: %f" % _feasibility)
# 	# 	plt_feas_0.append(_feasibility)
# 	plt_error_0.append(_error)
# print("----------------------------------------------------------------------")

# for k, gamma in enumerate(parameters):
# 	print("----------------------------------------------------------------------")
# 	__feasibility, __error = optimal_control(k, gamma, 1e-2)
# 	print("Penalty parameter (alpha): %f" % pow(10, -j))
# 	# 	print("Constraint violation: %f" % __feasibility)
# 	plt_feas_2.append(__feasibility)
# 	plt_error_2.append(__error)
# print("----------------------------------------------------------------------")

# # Just to illustrate the constraint violation
# axis = np.array(parameters)
# plt_feas_4 = np.array(plt_feas_4)
# plt_feas_0 = np.array(plt_feas_0)
# plt_feas_2 = np.array(plt_feas_2)
# 	# plt.figure(1)
# plt.xlabel(r'Powers $k$ with $\alpha = 10^{-k}$')
# plt.ylabel(r'$\|\max(0, -y+\psi)\|_{L^2(\Omega)}$')
# plt.title('Constraint violation')
# plt.plot(plt_feas_4, 'b', label = r'$\varepsilon=10^{-4}$', linewidth = 2.0)
# plt.plot(plt_feas_0, 'g', label = r'$\varepsilon=10^{-0}$', linewidth = 2.0)	
# # plt.plot(plt_feas_2, 'm', label = r'$\varepsilon=10^{-2}$', linewidth = 2.0)
# plt.legend(loc='upper right')
# plt.show()

# # Plotting the error between the optimal state and the desired target for different parameters
# plt_error_4 = np.array(plt_error_4)
# plt_error_0 = np.array(plt_error_0)
# plt_error_2 = np.array(plt_error_2)
# plt.figure(2)
# plt.xlabel(r'Powers $k$ with $\alpha = 10^{-k}$')
# plt.ylabel(r'$\|y-y_d\|_{L^2(\Omega)}$')
# plt.title('Minimal error (Conjugate Gradient)')
# plt.plot(plt_error_4, 'b', label = r'$\varepsilon=10^{-4}$', linewidth = 2.0)
# plt.plot(plt_error_0, 'g', label = r'$\varepsilon=10^{-0}$', linewidth = 2.0)
# plt.plot(plt_error_2, 'm', label = r'$\varepsilon=10^{-2}$', linewidth = 2.0)
# plt.legend(loc='upper right')
# plt.show()

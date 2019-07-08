__author__ = "Borjan Geshkovski"

from fenics import *

class dome(Expression):
	""" Dome obstacle in [-2,2]x[-2,2] """
	def eval(self, value, x):
		if x[0]*x[0] + x[1]*x[1] < 1:
			value[0] = sqrt(1-x[0]*x[0] - x[1]*x[1])
		else:
			value[0] = 0

class stairs(Expression):
	""" Staircase obstacle in [-1,1]x[-1,1] """
	def eval(self, value, x):
		if -0.5 < x[0] <= -1:
			value[0] = -0.2
		elif -0.5 <= x[0] < 0:
			value[0] = -0.4
		elif 0 <= x[0] < 0.5:
			value[0] = -0.6
		elif 0.5 <= x[0] <= 1:
			value[0] = -0.8

class parabola(Expression):
	def eval(self, value, x):
		value[0] = -pow(x[0], 2)

class gaussian(Expression):
	""" Gaussian obstacle in [-2,2]x[-2,2] """
	def eval(self, value, x):
		a = 3
		value[0] = exp(-a*pow(x[0], 2) - a*pow(x[1], 2))

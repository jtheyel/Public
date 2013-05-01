from pylab import *
from numpy import *
from scipy import *
from scipy import optimize


path = "" 
x,y  = loadtxt(path,unpack=True, usecols=[0,1])

plt = matplotlib.pyplot.figure()
ax = axes()

ax.plot(x,y, label="")

# ------------------------------------------------------------------------
#                             Curve fitting
# ------------------------------------------------------------------------


# fitfunc = lambda p, x: p[0] + p[1] * x
# errfunc = lambda p, x, y: fitfunc(p, x) - y
# p0 = [.04,-1]
# p1, success = optimize.leastsq(errfunc, p0, args=(x,y))
# X = linspace(min(x), max(x), 100)
# ax.plot(X, fitfunc(p1, X), 'b-',label='Fit')

title = ""
xaxis = ""
yaxis = "" 

ax.set_title(title)
ax.set_xlabel(xaxis)
ax.set_ylabel(yaxis)
ax.legend(loc='upper center', bbox_to_anchor=(0.89, .9),
          ncol=1, fancybox=True, shadow=True)    


plt.set_facecolor('white')

# plt.savefig(path+".png', bbox_inches=0)

show()
 



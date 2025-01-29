import numpy as np
from matplotlib import pyplot as plt

x = np.linspace(-2.5, 2.5, 500)
y = np.linspace(-2.5, 2.5, 500)
X, Y = np.meshgrid(x, y)
p = (0, 1)
r = np.sqrt(X ** 2 + Y ** 2)

V = (p[0] * X + p[1] * Y) / r ** 3
inside = r < 1
V = np.where(inside, Y, V)
E = np.gradient(-V)

fig, ax = plt.subplots()
#ax.pcolormesh(x, y, V)
ax.contourf(x, y, V, cmap='coolwarm')
circle = plt.Circle((0, 0), 1, edgecolor='k', facecolor='none')


ax.streamplot(x, y, E[1], E[0], density=0.5, broken_streamlines=False, linewidth=0.3, arrowstyle='->')
ax.add_patch(circle)

ax.set_aspect('equal')
ax.axis('off')
fig.savefig('sphere_polarized.pdf', bbox_inches='tight')

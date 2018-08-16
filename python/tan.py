import matplotlib.pyplot as plt
import numpy as np

xs = np.arange(-20, 20, 0.01)
ys = np.sin(xs)

#plt.plot(xs, ys, 'black', lw=2)

plt.plot(xs, ys, 'r', lw=2)
for x0 in xs:
    plt.plot(xs, np.cos(x0) * (xs - x0) + np.sin(x0), 'black', lw=0.02)

plt.axis([-15, 15, -10, 10])
plt.axis('off')
plt.show()

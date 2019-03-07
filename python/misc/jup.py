%matplotlib inline
%matplotlib notebook

import numpy as np
import matplotlib.pyplot as plt

xs = np.arange(-20, 20, 0.01)
ys = xs * xs

for x, y in zip(xs, ys):
    plt.plot(x, y, 'black', lw=2)

plt.axis('off')
plt.show()

import sys
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

img = mpimg.imread(sys.argv[1])
imgplot = plt.imshow(img)
coords = plt.ginput(-1, -1)

for x, y in coords:
    print int(x), int(y)
plt.show()

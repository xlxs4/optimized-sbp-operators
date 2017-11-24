# Optimized SBP operators
This repository contains MATLAB code for diagonal-norm summation-by-parts operators with non-uniform grids near boundaries. The operator coefficients and the grid point locations have been determined by optimizing for accuracy. This often leads to orders-of magnitudes smaller errors compared to traditional operators defined on entirely equidistant grids.

There are two kinds of optimized operators: **Accurate** and **Minimal**. The Minimal operators have as few boundary points as possible before the interior central difference stencil starts. The Accurate operators were constructed to have the best possible accuracy properties. 

For reference we also include **Traditional** operators defined on completely equidistant grids.

All sets of operators have interior accuracy of order 2p and boundary accuracy of order p. The following orders are available:
* Traditional: 2p = 2, 4, 6, 8, 10, 12.
* Accurate: 2p = 4, 6, 8, 10, 12.
* Minimal: 2p = 4, 6, 8, 10, 12.

# How do I use the operators?
* Clone the repository or simply download the files
* Start MATLAB and navigate into one of the directories, e.g. *Accurate*.
* The call `[D1, H, x, h] = D1_accurate(N, L, order)` requests an SBP operator of interior order of accuracy `order` with `N` grid points on an interval of length `L`. The function returns the differentiation matrix `D1`, the inner product (or *norm*) matrix `H`, the grid `x`, and the interior grid spacing `h`.
* The other kinds of operators are created analogously.
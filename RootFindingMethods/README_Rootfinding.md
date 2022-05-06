# Rootfinding Methods
This folder contains many root finding methods shown in class

## Bisect

 Bisect takes in inputs (`func`, `xl`, `xu`, `es`, `maxiter`)

  * `func` - the anonymous function to find the root of

  * `xl` - lower bound to search

  * `xu` - upper bound to search

  * `es` - error stopping condition

  * `maxiter` - cap of iterations of the function

   This closed method finds the midpoint between `xl` and `xu` and evaluates that using the function. If the value found is negative it will set the lower bound to the midpoint and reiterate. If it is positive it will set the upper bound to the midpoint and reiterate.

## False position

 FalsePos takes in inputs (`func`, `xl`, `xu`, `es`, `maxit`)

  * `func` - the anonymous function to find the root of

  * `xl` - lower bound to search

  * `xu` - upper bound to search

  * `es` - error stopping condition

  * `mixit` - cap of iterations of the function

   This closed method is similar to the bisect method but uses a different equation to calculate the point to be evaluated

## Fixed Point

 FixedPoint takes in inputs (`func` `xi` `es` `maxiter`)

  * `func` - the anonymous function to find the root of

  * `xi` - initial guess of where the root is

  * `es` - error stopping condition

  * `maxiter` - cap of iterations of the function

   This open method evaluates the function at `xi` and sets it as the new `xi` and iterates

## Secant

 Secant takes in inputs (`func`, `x0`, `x1`, `es`, `maxiter`)

  * `func` - the anonymous function to find the root of

  * `x0` - first point

  * `x1` - second point

  * `es` - error stopping condition

  * `maxiter` - cap of iterations of the function

   This method draws a secant line between the points and changes the next point to be where the line crosses the function `Modsecant` is a derivative of this function

## Newton Raphson

 NewtonRaphson takes in inputs (`func`, `xi`, `es`, `maxiter`)

  * `func` - the anonymous function to find the root of

  * `xi` - initial guess

  * `es` - error stopping condition

  * `maxiter` - cap of iterations of the function

   This method uses the derivative of the function to find the next point to be evauluated very fast


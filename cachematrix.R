## The 'makeCacheMatrix()' function takes in a matrix as an argument and has functions to get
## and set the values of the matrix, to get and set the inverse of the matrix. It returns a List containing 
## all the above functions.
## The 'cacheSolve()' function checks if a cached copy of the inverse is available. If it is, 
## the inverse is returned, else, the inverse is computed in the function using 
## the solve() function, set in the cache using setinv() and then returned.

## Takes in a matrix as an argument and returns a list of functions. 

makeCacheMatrix <- function(x = matrix()) 
{
      i <- NULL
      set <- function(y) 
      {
             x <<- y
             i <<- NULL
      }
      get <- function() x
      setinv <- function(inv) i <<- inv
      getinv <- function() i
      list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## This function firstly checks if the inverse is already calculated. If so, it is obtained from the cache.
## Else, the inverse of the matrix is calculated using the solve() function and set in the cache using
## the setinv() function.

cacheSolve <- function(x, ...) 
{
      i <- x$getinv()
      if(!is.null(i)) 
      {
            message("getting cached data")
            return(i)
      }
      data <- x$get()
      i <- solve(data, ...)
      x$setinv(i)
      i
}

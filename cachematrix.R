## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function: This function creates a special “matrix” object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
  x <<- y
  i <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}
cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

## Write a short comment describing this function: 
This function calculates the mean of the special “vector” created with the above function. It first checks to see if the mean has already been calculated. 
If so, it gets the mean from the cache and skips the computation. If not, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  if(!is.null(i)){
  message("getting cached data")
  return(i)
  }
  mat <- x$get()
  i <- solve(mat,...)
  x$setInverse(j)
  i
}
## This function computes the inverse of the special “matrix” returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), 
then the cachesolve should retrieve the inverse from the cache. 

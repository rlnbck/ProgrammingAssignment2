## This is a function written for Coursera R Programming Course.
## It is used to illustrate lexical scoping and introduces the <<- operator

## Same functiion provided in the example except that it operates
## on a matrix, not a vector and I've replaced the mean function with
## the solve() function which calculates the inverse of a matrix.

## creates a list variable of functions
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## receives a list variable and finds the inverse of the matrix
## contained in the list
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}

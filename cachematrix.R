## Below two functions 'makeCacheMatrix' and 'CacheSolve' functions are designed to reduce the 
## computations time while caculating the inverse of matrix over and over.

##Following function create the special "matrix" object, that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){                    ##assigns value of matrix in parent environment
    x <<- y
    inv <<- NULL
  }
  get <- function() x                     ##return value of special 'matrix' object
  setInv <- function(inv) inv <<- inv     ##assigns value of matrix inverse in parent environment
  getInv <- function() inv                ##return the value of matrix inverse
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


## Following function calculate the inverse of special "matrix" object created using above 'makeCacheMatrix' function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if(!is.null(inv)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInv(data)
  inv
}

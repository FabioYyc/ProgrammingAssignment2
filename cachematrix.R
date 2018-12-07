## Functions set a matrix in the parent environment then invert the matrix

## Build a set of funtions and returns the matrix into parent environment

makeCacheMatrix <- function(x = matrix()) {inv = NULL

set <- function(y){
  x <<- y
  inv  = NULL}
get <- function()x
setinverse <-function(solve)inv <<-solve
getinverse <- function()inv

list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## retrive the matrix that was setted in makeCacheMatrix function
##and return the inverted matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <-x$getinverse
  if(!is.null(inv)){return(inv)}
  
  matrix <- x$get

  inv <- solve(matrix, ...)
  x$setinverse(inv)
  inv
  }

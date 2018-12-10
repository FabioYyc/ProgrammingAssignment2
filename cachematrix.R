## Functions set a matrix in the parent environment then invert the matrix

## Build a set of funtions and returns the matrix into parent environment


##initialisation of the arguments in the function
makeCacheMatrix <- function(x = matrix()) {
  inv = NULL
##set the input matrix into parent environment
set <- function(y){
  x <<- y
  inv  = NULL}
##get the matrix from the parent environment via lexical scoping method
get <- function()x

##set the argument of inv to the parent environment
##then retrive the meaning of inv symbol 
setinverse <-function(solve)inv <<-solve
getinverse <- function()inv

#naming the list so we can use $ symbol to acess the functions above
list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)

}


## retrive the matrix that was setted in makeCacheMatrix function
##and return the inverted matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
##checked if the value is null, if there is a valid input,
##system retrive a valid inverse to the environment
  inv <-x$getinverse
  if(!is.null(inv)){return(inv)}
  
##get the matrix and calculate its inverse then return to the environment
  matrix <- x$get

  inv <- solve(matrix, ...)
  x$setinverse(inv)
  inv
  }

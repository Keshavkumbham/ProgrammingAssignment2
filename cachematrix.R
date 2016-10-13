## The following functions are able to create a 
## matrix that allows its inverse to be cached, so that it
## doesn't need to be calculate everytime repeatedly,but use cached data.

## The function makeCacheMatrix() creates a 
## matrix, which is actually list containing a function to
## a) set the value of the matrix
## b) get the value of the matrix
## c) set the value of the inverse
## d) get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  i= NULL
  set = function(y){
    x <<- y
    i<<- NULL
  }
  get= function() x 
  setinverse= function(solve) i <<- solve
  getinverse = function() i
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  i = x$getinverse
  if(!is.null(i)){
    print("getting cached inverse")
    return(i)
  }
  data=x$get()
  i = solve(data)
  i
  

  }

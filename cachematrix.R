## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## Two functions to cache the inverse of a matrix
  
  makeCacheMatrix <- function(x = matrix()) {
    
      	## Initialization
          i <- NULL
      
            ## Method to set the matrix
            set <- function( y ) {
                  x <<- y
                  i <<- NULL
            }
        
            ## Method the get the matrix
            get <- function() {
            ## Return the matrix
                	x
            }
          
            ## Method to set the inverse of the matrix
            setInverse <- function(inverse) {
                  i <<- inverse
            }
            
            ## Method to get the inverse of the matrix
            getInverse <- function() {
            ## Return the inverse property
                  i
            }
              
            ## Return a list of the methods
            list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
            }
  
    
    ## Below function computes the inverse of the matrix returned by "makeCacheMatrix". If the inverse has already been calculated (and the matrix has not
    ## changed), then the "cachesolve" function will retrieve the inverse from the cache.
    cacheSolve <- function(x, ...) {
      
            ## Return a matrix that is the inverse of 'x'
            i <- x$getInverse()
        
            ## Just return the inverse if its already cached and print "getting cached data" for clarification
            if( !is.null(i) ) {
                  message("getting cached data")
                  return(i)
            }
        
            ## Get the matrix from our object
            data <- x$get()
          
            ## Calculate the inverse 
            i <- solve(data)
            
            ## Set the inverse using lexical scoping so that it can be used for verifying cached matrix next time
            x$setInverse(i)
            
            ## Return the inverse matrix
            i
    }

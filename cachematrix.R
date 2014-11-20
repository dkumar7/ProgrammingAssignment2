## Put comments here that give an overall description of what your
## functions do

## 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        
        set <- function( matrix ) {
                x <<- matrix
                inv <<- NULL
        }
        
        get <- function() {
                ## Return the matrix
                x
        }
        
        setInverse <- function(inverse) {
                inv <<- inverse
        }
        
        getInverse <- function() {
                ## Return the inverse property
                inv
        }
        
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
        
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getInverse()
        if( !is.null(m) ) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setInverse(m)
        m
}


## Sample Run result as follows.
##> source("cachematrix.R")
##> a<-makeCacheMatrix(matrix(c(1,2,11,12),2,2))
##> summary(a)
##Length Class  Mode    
##set        1      -none- function
##get        1      -none- function
##setInverse 1      -none- function
##getInverse 1      -none- function
##> cacheSolve(a)
##[,1] [,2]
##[1,] -1.2  1.1
##[2,]  0.2 -0.1
##> cacheSolve(a)
##getting cached data
##[,1] [,2]
##[1,] -1.2  1.1
##[2,]  0.2 -0.1
##> 
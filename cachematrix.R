##----------------------------makeCacheMatrix---------------------------------------------

## makeCacheMatrix is a function that creates a special "matrix" object that can cache its inverse

## A matrix with functions to get/set value & get/set inverse
makeCacheMatrix <- function( m = matrix() ) {

##cached inverse of matrix
    i <- NULL

## Method to set the matrix
    set <- function( matrix ) {
      m <<- matrix
      i <<- NULL
    }

## Method the get the matrix
    get <- function() {m
    }

## Method to set the inverse of the matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }

## Method to get the inverse of the matrix
    getInverse <- function() { i
    }

## Return a list of the methods
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
    }

##-------------------------------chacheSolve---------------------------------------------

## cacheSolve function Computes the inverse of a matrix. If the inverse has already been
## calculated before, the cached inverse is returned. 

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()

## Just return the inverse if its already set
    if( !is.null(m) ) {
            message("getting cached data")
            return(m)
    }

## compute inverse of matrix 
    data <- x$get()
     inv <- solve(data, ...)

## Set the inverse to the object
    x$setInverse(m)

## Return the matrix
    m

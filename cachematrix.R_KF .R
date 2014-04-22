## This function will calculate the inverse (using get )
##of a matrix and cache it for later use (using set)

makeCacheMatrix <- function(x = matrix()) { #calls a defualt matrix that can be passed in
        i <- NULL #inverse set to null
        set <- function(y) { #uses anonymous function to store/cache the inverse
                x <<- y
                i <<- NULL
        }
        get <- function() x #defines the function gets the inverse
        setinverse <- function(inverse) i <<- inverse #sets inverse for later use
        getinverse <- function() i #gets the inverse
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}






## This function will check to see if there is a cached inverse 
## of the matrix, if not it calculates or solves for it


cacheSolve <- function(x, ...) {
        #this section checks to see if the inverse is already cached
                i2 <- x$getinverse()
                if(!is.null(i2)) { 
                        message("getting cached inverse")
                        return(i2)
                }
                calc <- x$get() #gets the data
                i2 <- solve(calc, ...) #calculates the inverse
                x$setinverse(i2) #sets the inverse to be returned and cached
                i2
        }
        
     



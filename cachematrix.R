## Put comments here that give an overall description of what your
## functions do
## Date : Oct 11, 2018 1:23 AM IST
## Language : R
## Co-auther : Saharsh Bawankar gi_id : saharsh28
## Course : Course 2/6 R programming Week 3 assignment

## This function is storing a matrix and its incerse into cache
## function makeCacheMatrix has 4 function init : setMatrix, getMatrix,
## setInveMatrix, and getInvMatrix; and 1 variable : invetedMatrix
## initially NULL
## Default class for argument 'x' is matrix
## 

makeCacheMatrix <- function(x = matrix()) {
invertedMatrix<- NULL

## setting the matrix 
setMatrix <- function(y){
x <<- y
invertedMatrix <<- NULL
}

## getting the matrix
getMatrix <- function() {
x
}

## setting inverted matrix
setInvMatrix <- function(inverse){
invertedMatrix <- inverse
}

## getting Inverted matrix 
getInvMatrix <- function() {
invertedMatrix
}

## list of all funcitons in function makeCacheMatrix
list(setMatrix = setMatrix, getMatrix = getMatrix, 
setInvMatrix= setInvMatrix, getInvMatrix= getInvMatrix)
}


## Write a short comment describing this function
## This function cacheSolve if invertedMatrix is NULL then
## inverts the matrix and  then stores it in invertedMatrix
## if inverted is NOT NULL then return it directly.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
invertedMatrix <- x$getInvMatrix()   ## getting invertedMatrix from makeCacheMatrix

if(!is.null(invertedMatrix)){        ## checking if invertedMatrix is NULL
message("Cashed Invertable Matrix is there")
return(invertedMatrix)
}
						## code if invertedMatrix is NULL
data <- x$getMatrix()
invertedMatrix <- solve(data,...)		## creating Inverted matrix by solve()
x$setInvMatrix(invertedMatrix)		## setting new invertedMatrix for x
return(invertedMatrix)
}

------------------------ Test solution ---------------------------------------

> TestMatrix <- matrix(1:4,2,2)
> TestMatrix
     [,1] [,2]
[1,]    1    3
[2,]    2    4

> CacheMatrix <- makeCacheMatrix(TestMatrix)
> CacheMatrix$getMatrix()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> cacheSolve(CacheMatrix)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

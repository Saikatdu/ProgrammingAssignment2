## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse
## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the ## inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse ## from the cache

##This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix<-function(x){
    mat<<-x
    invMat<<-solve(x)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve<-function(y){
    if(!exists(c('mat','invMat'),envir=.GlobalEnv)){
        # assign('mat',NULL,envir = .GlobalEnv)
        mat<<-NULL
        invMat<<-NULL
        # assign('invMat',NULL,envir = .GlobalEnv)
    }
    if(mat==y && !is.null(invMat)){
        message("getting cached data")
        return(invMat)
    }
    makeCacheMatrix(y)
    invMat
}
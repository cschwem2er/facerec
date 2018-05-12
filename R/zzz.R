.onAttach <- function(libname, pkgname){
  .facerec <- new.env(parent = emptyenv())
}

.onLoad <- function(libname, pkgname){
  .facerec <- new.env(parent = emptyenv())
}

.onAttach <- function(libname, pkgname){
  .facerec <- new.env(parent = emptyenv())
}

## quiets concerns of R CMD check for non standard evaluation
utils::globalVariables(c( ".facerec", "is",  "." ))

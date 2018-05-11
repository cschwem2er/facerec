# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


facerec_init <- function() {
  kairos_id <- Sys.getenv('kairos_id')
  kairos_key <- Sys.getenv('kairos_key')

  if (kairos_id == '' | kairos_key == '') {
    stop('facerec: could not load authorization credentials from Sys env.')
  }
  header <- c('app_id' = kairos_id, 'app_key' = kairos_key,
              'Content-type' = 'application/json')
  assign("init", header, envir = .facerec)
}

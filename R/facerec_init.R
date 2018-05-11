#'
#'
#'
#'
#'
#'
#'


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

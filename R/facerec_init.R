
#' Title
#' @name facerec_init
#' @description
#' Initializes the authorization credentials for the Kairos Face Recognition API.
#' Needs to be called before using any other functions of \code{facerec} and requires \code{kairos_id} and \code{kairos_key} as environment variables.
#' @return nothing.
#' @export
#'
#' @examples
#' \dontrun{
#' Sys.setenv(kairos_id = "Your Kairos API id")
#' Sys.setenv(kairos_key = "Your Kairos API key")
#'
#' facerec_init()
#' }
#'
#'
#'
#'


facerec_init <- function() {

  kairos_id <- Sys.getenv('kairos_id')
  kairos_key <- Sys.getenv('kairos_key')

  #.facerec <- NULL
  #.facerec <<- new.env(parent = emptyenv())

  if (kairos_id == '' | kairos_key == '') {
    stop('facerec: could not load authorization credentials from Sys env.')
  }
  header <- c('app_id' = kairos_id, 'app_key' = kairos_key,
              'Content-type' = 'application/json')
  message('Succesfully initialized authentification credentials.')
  assign("init", header, envir = .facerec)

}

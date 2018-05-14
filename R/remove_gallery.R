
#' @title remove gallery
#' @name remove_gallery
#' @description
#' Removes a gallery and all included subjects.
#' @param gallery The name of the gallery to be removed.
#'
#' @return nothing.
#' @export
#'
#' @examples
#' \donttest{
#'
#'
#' facerec_init()
#'
#' # enroll
#' finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#' finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
#'
#' # remove gallery
#' remove_gallery(gallery = 'starwars')
#' }
#'
#'
remove_gallery <- function(gallery) {

  url <- kairos_api(path = '/gallery/remove')
  params <- list(gallery_name = gallery)
  resp <- POST(url, body = params, encode = 'json',
               add_headers(.headers = .facerec$init ))

  data <- fromJSON(content(resp, 'text'))
  if ('Errors' %in% names(data)) {
    message <- data$Errors[[2]]
    stop(message)
  }

  else {
    print(data$message)
  }

}

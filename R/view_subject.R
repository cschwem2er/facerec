
#' @title view subject
#' @name view_subject
#' @description
#' Returns all face id's for each image enrolled for a given subject in a gallery.
#' @param subject_id The subject id for which to return all face id's.
#' @param gallery The gallery in which the subject is enrolled.
#'
#' @return A dataframe with face id's and enrollment timestamps associated with the input subject.
#' @export
#'
#' @examples
#' \donttest{
#' # enroll
#' finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#' finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
#'
#' # view subject
#' view_subject(subject_id = 'finn', gallery = 'starwars')
#' }
#'
#'
view_subject <- function(subject_id, gallery) {

  url <- kairos_api(path = '/gallery/view_subject')
  params <- list(subject_id = subject_id, gallery_name = gallery)
  resp <- POST(url, body = params, encode = 'json',
               add_headers(.headers = .facerec$init ))
  data <- fromJSON(content(resp, 'text'))

  if ('Errors' %in% names(data)) {
    message <- data$Errors[[2]]
    stop(message)
  }
  else {
    return(data$face_ids)
  }
}


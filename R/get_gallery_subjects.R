
#' Title
#' @name get_gallery_subjects
#' @description
#' Returns all subject id's associated with a gallery.
#' @param gallery The gallery in which the subjects are enrolled.
#'
#' @return A vector of subject id's
#' @export
#'
#' @examples
#' \dontrun{
#' # enroll
#' finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#' finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
#'
#' # view subjects
#' get_gallery_subjects(gallery = 'starwars')
#' }
#'
#'
get_gallery_subjects <- function(gallery) {

  url <- kairos_api(path = '/gallery/view')
  params <- list(gallery_name = gallery)
  resp <- POST(url, body = params, encode = 'json',
               add_headers(.headers = .facerec$init ))
  subject_ids <- fromJSON(content(resp, 'text'))$subject_ids
  return(subject_ids)

}

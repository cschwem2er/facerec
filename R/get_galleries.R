
#' @title list galleries
#' @name get_galleries
#' @description
#' Returns identifiers for all galleries associated with a 'Kairos' application.
#'
#' @return A vector of gallery id's.
#' @export
#'
#' @examples
#' \dontrun{
#' # enroll
#' finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#' first_gallery <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
#' second_gallery <- enroll(image = finn_image, subject_id = 'finn', gallery = 'more_starwars')
#'
#' # get_galleries
#' get_galleries()
#' }
#'
#'
get_galleries <- function() {

  url <- kairos_api(path = '/gallery/list_all')
  resp <- POST(url,  encode = 'json',
               add_headers(.headers = .facerec$init ))
  ids <- fromJSON(content(resp, 'text'))$gallery_ids
  return(ids)

}

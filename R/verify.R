

#' Title
#' @name verify
#' @description
#' Verify whether face in an input image belongs to a subject in a gallery.
#' @param image
#' An image of file type JPG, PNG, or BMP.
#' Can either be an url string or a local image processed with \code{\link[facerec]{prep_image}}.
#' @param subject_id A string containing the id for the person in the gallery to be verified.
#' @param gallery A string containing the name of the gallery in which the subject will be verified.
#'
#' @return A data frame with the verification annotations for the input image. The likelihood of a match is given in column \code{confidence}.
#' @export
#'
#' @examples
#'
#' \dontrun{
#' # enroll
#' padme_image <- 'https://upload.wikimedia.org/wikipedia/en/e/ee/Amidala.png'
#' padme_face <- enroll(image = padme_image, subject_id = 'padme', gallery = 'starwars')
#'
#' # verify
#' amidala_img <- 'https://upload.wikimedia.org/wikipedia/it/5/5e/Padm%C3%A9_Amidala.png'
#' verified <- verify(image = amidala_img, subject_id = 'padme', gallery = 'starwars')
#'
#' }
#'
verify <- function(image, subject_id, gallery)  {

  if (is(image, 'rfaces_image')) {
    name <- image$name
    image <- image$content
  }

  else {
    name <- image
  }

  kairos_data <- post_kairos(path = '/verify',
                             params = list(image = image,
                                           subject_id = subject_id,
                                           gallery_name = gallery))
  kairos_data$image <- name


    faces <- parse_kairos(kairos_data)
    return(faces)


}



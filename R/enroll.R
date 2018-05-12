

#' @title enroll faces
#' @name enroll
#' @description
#' Enroll face in an input image to a gallery and assign a subject id.
#' @param image
#' An image of file type JPG, PNG, or BMP.
#' Can either be an url string or a local image processed with \code{\link[facerec]{prep_image}}.
#' @param subject_id A string containing the id to assign for the person in the enrolled image.
#' @param gallery A string containing the name of the gallery in which the image will be enrolled.
#' @param min_head_scale
#' Set the ratio of the smallest face to look for in the input image. Accepts a value between .015 (1:64 scale) and .5 (1:2 scale).
#'
#' @return
#' A data frame with annotations for the enrolled image.
#' @export
#'
#' @examples
#' \dontrun{
#'
#' finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#' finn_enroll <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
#' }
#'
#'
enroll <- function(image, subject_id, gallery, min_head_scale = 0.015)  {

  if (is(image, 'rfaces_image')) {
    name <- image$name
    image <- image$content
  }

  else {
    name <- image
  }

  kairos_data <- post_kairos(path = '/enroll',
                             params = list(image = image,
                                           subject_id = subject_id,
                                           gallery_name = gallery,
                                           minHeadScale = min_head_scale))
  kairos_data$image <- name


    faces <- parse_kairos(kairos_data)
    return(faces)

}

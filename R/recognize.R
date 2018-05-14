
#' @title recognize face
#' @name recognize
#' @description
#' Recognize faces in an image and return the most likely matches from a gallery.
#' @param image
#' An image of file type JPG, PNG, or BMP.
#' Can either be an url string or a local image processed with \code{\link[facerec]{prep_image}}.
#' @param gallery A string containing the name of the gallery in which the image will be enrolled.
#' @param min_head_scale
#' Set the ratio of the smallest face to look for in the input image. Accepts a value between .015 (1:64 scale) and .5 (1:2 scale).
#' @param threshold Likelihood (between 0 and 1) used to determine a valid facial match. Defaults to 0.6.
#' @param max_num_results The maximum number of potential matches that are returned. Defaults to 10.
#' @param show_candidate_images Whether to return temporary URLs for each potential match. Defaults to TRUE.
#'
#' @return A dataframe with the potential matches for the input image. The likelihood of matches is given in column \code{confidence}.
#' @export
#'
#' @examples
#'  \donttest{
#'
#' facerec_init()
#'
#' # enroll
#' finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#' padme_image <- 'https://upload.wikimedia.org/wikipedia/en/e/ee/Amidala.png'
#' finn_face <- enroll(image = finn_image, subject_id = 'finn', gallery = 'starwars')
#' padme_face <- enroll(image = padme_image, subject_id = 'padme', gallery = 'starwars')
#'
#' # recognize
#' finn_2 <- 'https://upload.wikimedia.org/wikipedia/commons/b/b6/John_Boyega_by_Gage_Skidmore.jpg'
#' finn_rec <- recognize(image = finn_2, gallery = 'starwars')
#'
#' }
recognize <- function(image,  gallery, min_head_scale = 0.015, threshold = 0.6,
                      max_num_results = 10, show_candidate_images = TRUE)  {

  if (is(image, 'rfaces_image')) {
    name <- image$name
    image <- image$content
  }

  else {
    name <- image
  }

  kairos_data <- post_kairos(path = '/recognize',
                             params = list(image = image,

                                           gallery_name = gallery,
                                           minHeadScale = min_head_scale,
                                           threshold = threshold,
                                           max_num_results = max_num_results,
                                           show_candidate_images = show_candidate_images))
  kairos_data$image <- name


    faces <- parse_kairos(kairos_data)
    return(faces)

}




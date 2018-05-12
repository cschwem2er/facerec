
#' @title detect faces
#' @name detect
#' @description
#' Detect faces in an input image and return annotations from the 'Kairos' API.
#' @param image
#' An image of file type 'JPG', 'PNG', or 'BMP'.
#' Can either be an url string or a local image processed with \code{\link[facerec]{prep_image}}.
#' @param min_head_scale
#' Set the ratio of the smallest face to look for in the input image. Accepts a value between .015 (1:64 scale) and .5 (1:2 scale).
#' @return
#' A data frame with annotations for each detected face.
#' @export
#'
#' @examples
#' \dontrun{
#'  # one image
#'  finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#'  faces <- detect(image = finn_image)
#'
#'  # multiple images
#'  sw_image <- 'https://upload.wikimedia.org/wikipedia/en/8/82/Leiadeathstar.jpg'
#'  padme_image <- 'https://upload.wikimedia.org/wikipedia/en/e/ee/Amidala.png'
#'
#'  faces <- c(finn_image, sw_image, padme_image) %>%
#'  purrr::map(detect) %>% dplyr::bind_rows()
#'  }
#'
#'
#'
detect <- function(image,  min_head_scale = 0.015)  {

  if (is(image, 'rfaces_image')) {
    name <- image$name
    image <- image$content
  }

  else {
    name <- image
  }

  kairos_data <- post_kairos(path = '/detect',
                             params = list(image = image,
                                           minHeadScale = min_head_scale))
  kairos_data$image <- name


    faces <- parse_kairos(kairos_data)
    return(faces)

}


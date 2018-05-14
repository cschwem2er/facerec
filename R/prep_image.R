#' @title prepare local image
#' @description
#' Prepares a local image for an upload the 'Kairos' API via \code{\link[facerec]{detect}},
#' \code{\link[facerec]{enroll}}, \code{\link[facerec]{recognize}} and \code{\link[facerec]{verify}}.
#' @param img_file  Path to an image of file type 'JPG', 'PNG', or 'BMP'.
#'
#' @return The prepared image object.
#' @importFrom knitr image_uri
#' @export
#'
#' @examples
#'  \donttest{
#'
#'  facerec_init()
#'
#'  # download example image
#'  finn_image <- 'https://upload.wikimedia.org/wikipedia/en/2/2a/Finn-Force_Awakens_%282015%29.png'
#'  temp_img_path <- tempfile(fileext = '.png')
#'  download.file(finn_image, temp_img_path, mode = 'wb', quiet = TRUE)
#'
#'  # prepare image
#'  finn_local <- prep_image(temp_img_path)
#'
#'  # use prepared image
#'  faces <- detect(image = finn_local)
#'  }
#'
prep_image <- function(img_file) {

  structure( list(
    name = img_file,
    content = image_uri(img_file)
  ),
  class = "rfaces_image" )}

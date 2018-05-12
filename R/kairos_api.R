#' @importFrom dplyr select mutate tibble as_tibble
#' @importFrom httr modify_url GET POST user_agent add_headers http_type content
#' @importFrom jsonlite fromJSON
#' @importFrom stringr str_replace
#' @importFrom rlang set_names
#' @importFrom snakecase to_snake_case
#' @importFrom scales percent
#'
#'
kairos_api <- function(path) {
  # change url according to api endpoint
  modify_url("https://api.kairos.com", path = path)
}



post_kairos <- function(path, params) {
  # post request to kairos api
  url <- kairos_api(path = path)
  response <- POST(url, body = params, encode = 'json',
                   user_agent('http://github.com/methodds/facerec'),
                   add_headers(.headers = .facerec$init))

  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  structure(
    list(content = response),
    class = "kairos_data")

}


parse_kairos <- function(kairos_data) {
  # parse data from the kairos API
  data <- fromJSON(content(kairos_data$content, 'text'), flatten = TRUE)
  if ('Errors' %in% names(data)) {
    code <-  data$Errors[[1]]
    message <- data$Errors[[2]]
    cat(paste0('Error for source "', kairos_data$image,  '": ', message))
    faces <- tibble(img_source = kairos_data$image,
                    error_code = code,
                    error_message = message)
    return(faces)
  }

  else {
    data <- data$images
    if ('faces' %in% names(data)) {
      meta <- select(data, -faces)
      faces <- data$faces[[1]] %>%
        mutate(img_source = kairos_data$image,
               img_file = meta$file, img_height = meta$height,
               img_status = meta$status, img_width = meta$width)
    }

    else if ('candidates' %in% names(data)) {
      faces <- data$candidates[[1]] %>%  mutate(
        comparison_source = kairos_data$image
      )
    }

    else {
      faces <- data %>% mutate(
        img_source = kairos_data$image
      )
    }
    faces <- faces %>% as_tibble() %>%
      set_names(to_snake_case(colnames(faces) %>%
                                           str_replace('^attributes', 'face') %>%
                                           str_replace('^transaction', '')))
    return(faces)
  }
}


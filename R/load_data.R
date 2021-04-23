#' Loads data
#'
#'Loads specified experimental data
#'
#' @param rel_path The experiment and data you want to load (e.g., snitz_2013/behavior.csv)
#' @param remote Load data locally FALSE or remomtely from pyrfume GitHub (TRUE)
#'
#' @return A data frame
#' @export
#'
#' @examples
#' load_data("snitz_2013/behavior.csv")
  load_data <- function(rel_path, remote=FALSE){

    if(remote == TRUE){
      full_path <- url(paste("https://raw.githubusercontent.com/pyrfume/pyrfume-data/master", rel_path, sep = "/"))
      tryCatch(utils::read.csv(full_path),
               warning = function(w){message("No remote file: Check data name")},
               error = function(e){message(e)})

    }
    else {
      full_path <- paste("./data", rel_path, sep = "/")
      tryCatch(utils::read.csv(full_path),
               warning = function(w){message("No local file: Attempting remote file access");load_data(rel_path, remote=TRUE)},
               error = function(e){print(e)})
    }

  }

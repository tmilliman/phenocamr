#' Function to list all site regions-of-interst (ROIs)
#' 
#' The ROI list can be helpful in determining which time series to download
#' using `download_phenocam()`.
#' 
#' @param out_dir output directory (default = tempdir())
#' @param internal TRUE or FALSE (default = TRUE)
#' @return A data frame with ROIs for all available cameras
#' @keywords PhenoCam, meta-data
#' @export
#' @examples
#'
#' \donttest{
#' # download the site meta-data
#' df <- list_rois()
#' }

list_rois <- function(out_dir = tempdir(),
                       internal = TRUE){
  
    ## download the data
    raw_data = readLines("https://canopy.sr.unh.edu/api/roilists/?format=json&limit=1000")
    json_data <- jsonlite::fromJSON(raw_data)
    roi_data <- json_data$results

    ## output according to parameters
    if(internal){
        return(roi_data)
    } else {
        utils::write.table(roi_data,
                           paste0(tempdir(),"/roi_data.csv"),
                           col.names = TRUE,
                           row.names = FALSE,
                           quote = FALSE) 
    }
}

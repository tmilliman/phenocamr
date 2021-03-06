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
  
  # donwload the data
  roi_data <- jsonlite::fromJSON("https://phenocam.sr.unh.edu/webcam/roi/roilistinfo/")
 
  # output according to parameters
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
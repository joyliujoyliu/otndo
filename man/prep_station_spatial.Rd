% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prep_station_spatial.R
\name{prep_station_spatial}
\alias{prep_station_spatial}
\title{Summarize OTN extract data by station and convert to a spatial object}
\usage{
prep_station_spatial(extract, type = c("tag", "receiver"))
}
\arguments{
\item{extract}{OTN extract data}

\item{type}{type of extract data: "tag" or "receiver"}
}
\description{
Summarize OTN extract data by station and convert to a spatial object
}
\examples{
\dontrun{
td <- file.path(tempdir(), "matos_test_files")
dir.create(td)

# Get an extract file
download.file(
  paste0(
    "https://members.oceantrack.org/data/repository/",
    "pbsm/detection-extracts/pbsm_matched_detections_2018.zip/",
    "@download/file"
  ),
  destfile = file.path(td, "pbsm_matched_detections_2018.zip"),
  mode = "wb"
)
unzip(file.path(td, "pbsm_matched_detections_2018.zip"),
  exdir = td
)

matched_dets <- data.table::fread(
  file.path(td, "pbsm_matched_detections_2018.csv")
)

# Convert to spatial
prep_station_spatial(matched_dets, "tag")
}

}

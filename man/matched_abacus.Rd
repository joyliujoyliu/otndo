% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matched_abacus.R
\name{matched_abacus}
\alias{matched_abacus}
\title{Create an abacus plot of matched detections}
\usage{
matched_abacus(temp_dist, release)
}
\arguments{
\item{temp_dist}{Data from the output of \code{\link[=temporal_distribution]{temporal_distribution()}}}

\item{release}{Data frame of release times/locations; a subset of the matched
detections data}
}
\description{
Create an abacus plot of matched detections
}
\examples{
\dontrun{
td <- file.path(tempdir(), "matos_test_files")
dir.create(td)

# Get a detection file
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


# Run temporal_distribution
temporal <- temporal_distribution(matched_dets, "tag")

# Run matched_abacus
matched_abacus(temporal$data, matched_dets[receiver == "release"])
}

}

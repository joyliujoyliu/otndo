% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/project_contacts.R
\name{project_contacts}
\alias{project_contacts}
\title{Extract and combine the contacts for matched projects}
\usage{
project_contacts(extract, type = c("receiver", "tag"))
}
\arguments{
\item{extract}{data.frame of transmitter/receiver detections matched by OTN:
matched detections for tags and qualified detections for receivers}

\item{type}{Type of extract data: "tag" or "receiver"}
}
\value{
a data.table containing project names, principal investigators (PI),
points of contact (POC), and their respective emails. Multiple emails are
separated by commas.
}
\description{
Extract and combine the contacts for matched projects
}
\examples{
\dontrun{
# Set up example data
td <- file.path(tempdir(), "otndo_example")
dir.create(td)

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

matched <- read.csv(file.path(
  td,
  "pbsm_matched_detections_2018.csv"
))

# Actually run the function
project_contacts(matched, type = "tag")

# Clean up
unlink(td, recursive = TRUE)
}

}

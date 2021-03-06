% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-dropNotCensored.R
\name{dropNotCensored,CohortList-method}
\alias{dropNotCensored,CohortList-method}
\title{Remove Censored Patients from Each \code{SurvivalExperiemnt} in a \code{CohortList}}
\usage{
\S4method{dropNotCensored}{CohortList}(object, minDaysSurvived = 365)
}
\arguments{
\item{object}{A \code{CohortList} for which to drop patients who died before
each \code{SurvivalExperiment} item a specified date.}

\item{minDaysSurvived}{An \code{integer} specifying the minimum number of days
a patient needs to have survived to be included in the cohort.}
}
\value{
The \code{CohortList} with censored samples removed.
}
\description{
Remove Censored Patients from Each \code{SurvivalExperiemnt} in a \code{CohortList}
}
\examples{
data(sampleCohortList)
valCohortList <- dropNotCensored(sampleCohortList)

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-dropNotCensored.R
\name{dropNotCensored,SurvivalExperiment-method}
\alias{dropNotCensored,SurvivalExperiment-method}
\title{Remove Censored Patients from A \code{SurvivalExperiment} Object}
\usage{
\S4method{dropNotCensored}{SurvivalExperiment}(object, minDaysSurvived = 365)
}
\arguments{
\item{object}{A \code{SurvivalExperiment} to censor.}

\item{minDaysSurvived}{An \code{integer} specifying the minimum number of days
a patient needs to have survived to be included in the cohort.}
}
\value{
The \code{SurvivalExperiment} with censored samples removed.
}
\description{
Remove Censored Patients from A \code{SurvivalExperiment} Object
}
\details{
Censored means no event before end of measurement. Since we want not
censored, we keep patients who had an event before minDaysSurvived.
Therefore we keep individuals surviving > \code{minDaysSurvived}, or who had an
event (died) before minDaysSurvived.
}
\examples{
data(sampleICGCmicro)
ICGCmicro <- dropNotCensored(sampleICGCmicro)

}

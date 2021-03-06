% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-GeneFuModel.R
\name{GeneFuModel}
\alias{GeneFuModel}
\title{\code{GeneFuModel} Constructor Method}
\usage{
GeneFuModel(
  trainCohorts = SurvivalExperiment(),
  minDaysSurvived = 365,
  ...,
  randomSeed
)
}
\arguments{
\item{trainCohorts}{A \code{CohortList} or \code{SurvivalExperiment} containing
training data for the genefu model. If you don't have training data,
but have a trained model this will default to an empty \code{SurvivalExperiment}.
You can then assign the model using the \code{models} setter method.}

\item{minDaysSurvived}{An \code{integer} specifying the minimum days survived
to be considered in the 'good' survival prognosis group.}

\item{...}{Fall through paramater to \code{SurvivalModel} constructor.}

\item{randomSeed}{An \code{integer} randomSeed that was used to train the model.
Users should specify this when initializing a model to ensure
reproducibilty.}
}
\value{
A \code{GeneFuModel} object, with model parameters in the
}
\description{
\code{GeneFuModel} Constructor Method
}
\examples{
set.seed(1987)
geneFuModel <- GeneFuModel(randomSeed=1987)

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-SurvivalModel.R
\name{models<-}
\alias{models<-}
\title{Generic for Setting the Models Slot for an S4 Object}
\usage{
models(object, ...) <- value
}
\arguments{
\item{object}{An \code{S4} object to set the models slot for}

\item{...}{Allow new parameters to be added.}

\item{value}{A model or list of models to assign to the object}
}
\value{
None, updates the object.
}
\description{
Generic for Setting the Models Slot for an S4 Object
}
\examples{
data(samplePCOSPmodel)
models(samplePCOSPmodel) <- SimpleList(model1=NA)

}

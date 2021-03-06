% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-forestPlot.R
\name{forestPlot}
\alias{forestPlot}
\title{Generate a forest plot from an `S4` object}
\usage{
forestPlot(object, ...)
}
\arguments{
\item{object}{An `S4` object to create a forest plot of.}

\item{...}{Allow new parameters to this generic.}
}
\value{
None, draws a forest plot.
}
\description{
Generate a forest plot from an `S4` object
}
\examples{
data(sampleValPCOSPmodel)

# Plot
dIndexForestPlot <- forestPlot(sampleValPCOSPmodel, stat='log_D_index')

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-runGSEA.R
\name{runGSEA}
\alias{runGSEA}
\title{Run Gene Set Enrichment Analysis}
\usage{
runGSEA(object, geneSet, ...)
}
\arguments{
\item{object}{An \code{S4} object to conduct Gene Set Enrichment Analysis (GSEA)
with.}

\item{geneSet}{An object representing a gene set, such as a \code{data.frame}.}

\item{...}{Allow additional parameters to be defined for this generic.}
}
\value{
A \code{data.frame} containing the significantly enriched gene sets.
}
\description{
Run Gene Set Enrichment Analysis
}

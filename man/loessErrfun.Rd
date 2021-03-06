% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/errorModels.R
\name{loessErrfun}
\alias{loessErrfun}
\title{Use a loess fit to estimate error rates from transition counts.}
\usage{
loessErrfun(trans)
}
\arguments{
\item{trans}{(Required). A matrix of the observed transition counts. Must be 16 rows,
with the rows named "A2A", "A2C", ...}
}
\value{
A numeric matrix with 16 rows and the same number of columns as trans.
 The estimated error rates for each transition (row, eg. "A2C") and quality score
 (column, eg. 31), as determined by \code{\link{loess}} smoothing over the quality
 scores within each transition category.
}
\description{
This function accepts a matrix of observed transitions, with each transition
correponding to a row (eg. row 2 = A->C) and each column to a quality score
(eg. col 31 = Q30). It returns a matrix of estimated error
rates of the same shape. Error rates are estimates by a \code{\link{loess}} fit
of the observed rates of each transition as a function of the quality score.
Self-transitions (i.e. A->A) are taken to be the left-over probability.
}
\examples{
derep1 <- derepFastq(system.file("extdata", "sam1F.fastq.gz", package="dada2"))
dada1 <- dada(derep1, err=tperr1)
err.new <- loessErrfun(dada1$trans)

}


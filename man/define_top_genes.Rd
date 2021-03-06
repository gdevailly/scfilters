% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binning.R
\name{define_top_genes}
\alias{define_top_genes}
\title{Define the reference window using the most highly expressed features.}
\usage{
define_top_genes(dataset, window_size = NULL, mean_expression = NULL,
  min_expression = NULL)
}
\arguments{
\item{dataset}{A data frame, containing features as rows and cells as columns, and where
the mean expression value for each gene has been added as a column. Usually the output of
\code{calculate_cvs}.}

\item{window_size}{Number of features in the defined top window. Recommended to 100 features.}

\item{mean_expression}{A number. Genes with a mean expression across cells higher than the value
will be selected. Ignored if \code{window_size} is defined.}

\item{min_expression}{A number. Genes with a minimum expression across all cells higher than the value
will be selected. Ignored if \code{window_size} or \code{mean_expression} is defined.}
}
\value{
A list with two elements, both data frames: the defined top window, and
the rest of the genes.
}
\description{
Define the group of features in the dataset that will be considered as reference,
the top window, by specifying either a number of features or an expression threshold.
}
\details{
There are three selection methods available:

\itemize{

\item \code{window_size}: features are ranked by mean expression across cells, and the top slice
     of the specified size is selected.

\item \code{mean_expression}: the \code{mean} column is checked, and all features with mean
     expression above the threshold indicated are selected.

\item \code{min_expression}: features where all expression values are above the
     expression threshold indicated are selected.

}

In general, it is advisable to avoid generating top windows larger than 250 features
(100 features is the recommended value),
to prevent excessively long computation time as well as to preserve the quality of the
analysis, as the top window should only include a subset of reliable values.
}
\examples{
library(magrittr)
expMat <- matrix(
    c(1, 1, 1,
      1, 2, 3,
      0, 1, 2,
      0, 0, 2),
    ncol = 3, byrow = TRUE, dimnames = list(paste("gene", 1:4), paste("cell", 1:3))
)

calculate_cvs(expMat) \%>\%
    define_top_genes(window_size = 2)

calculate_cvs(expMat) \%>\%
    define_top_genes(mean_expression = 1.5)

}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/with-roi.R
\name{with_ROI}
\alias{with_ROI}
\title{Configures a solver based on 'ROI'}
\usage{
with_ROI(solver, ...)
}
\arguments{
\item{solver}{the 'ROI' solver name (character vector of length 1)}

\item{...}{optional parameters passed to ROI_solve

Note: it does only support column duals. It currently does not export
row duals.}
}
\value{
a function: Model -> Solution that can be used
together with \code{\link[ompr]{solve_model}}. You can find \code{ROI}'s
original solver \code{message} and \code{status} information in
\code{<return_value>$ROI}. The \code{ompr} status code is \code{"success"}
if \code{ROI} returns \code{code = 0} and is \code{"error"} otherwise.
}
\description{
This function makes all solvers in the R package 'ROI' available to solve
'ompr' models.
}
\examples{
\dontrun{
library(magrittr)
library(ompr)
library(ROI)
library(ROI.plugin.glpk)
add_variable(MIPModel(), x, type = "continuous") \%>\%
 set_objective(x, sense = "max") \%>\%
 add_constraint(x <= 5) \%>\%
 solve_model(with_ROI(solver = "glpk", verbose = TRUE))
}
}
\references{
Kurt Hornik, David Meyer, Florian Schwendinger and Stefan Theussl (2016).
ROI: R Optimization Infrastructure. <https://CRAN.R-project.org/package=ROI>
}

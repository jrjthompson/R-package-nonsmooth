\name{alc}
\alias{alc}
\title{Iterative anisotropic local constant smoothing
}
\description{
This function implements the method in Thompson, J.R.J. (2024) for iterative smoothing of change-point data that utilizes oversmoothed estimates of the underlying data generating process to inform re-smoothing.
}
\usage{
alc(X,Y,bw.fixed.value=NULL,resmooths=1,ckertype="gaussian",bwmethod="cv.ls")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
matrix of \eqn{p} columns containing the input values of the observations, each observation belonging to \eqn{[0,1]^p}.
}
  \item{Y}{
  vector containing the corresponding response variable associated to the input values \eqn{\texttt{x}}.
}
  \item{bw.fixed.value}{
order of the B-spline basis used in the regression model. Default is 3 (quadratic B-splines).
}
  \item{resmooths}{
  number of evenly spaced knots to use in the B-spline basis. Default value is 1.
}
  \item{ckertype}{
list of characters or integers, labels of the variables. Default is \eqn{\texttt{NULL}}.
}
 \item{bwmethod}{
  logical, if TRUE then a parallelized version of the code is used. Default is FALSE.
}
  \item{nbCore}{
 numerical, number of cores used for parallelization, if parallel is set to TRUE.
}
}
\value{
\item{selec.var}{list of vectors of the selected variables, one vector for each penalization parameter.}
\item{aic.var}{vector of variables selected using AIC.}
}

\seealso{
  \code{\link{npreg}}, \code{\link{npregbw}}
}

\examples{
# --- Loading values of x --- #
data('x_obs')
# --- Loading values of the corresponding y --- #
data('y_obs')
x_trunc = x_obs[1:70,,drop=FALSE]
y_trunc = y_obs[1:70]

# --- Variable selection of f1 --- #
absorber(x=x_trunc, y=y_trunc, M = 3)
\donttest{
# --- Parallel computing --- #
absorber(x=x_trunc, y=y_trunc, M = 3, parallel = TRUE, nbCore = 2)
}
}

\name{alc}
\alias{alc}
\title{Iterative anisotropic local constant smoothing
}
\description{
This function implements the method in Thompson, J.R.J. (2024) for iterative smoothing
of change-point data that utilizes oversmoothed estimates of the underlying data
generating process to inform re-smoothing. The function calculates a local constant
estimator \eqn{\tilde{g}(X)} of \eqn{Y=g(X)+\epsilon}, and then utilizes \eqn{\tilde{g}(x)}
in the range kernel of another local constant estimator. This processes is iterated
for a specified number of resmooth iterations.
}
\usage{
alc(X,Y,bw.fixed.value=NULL,resmooths=1,\dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
  matrix of \eqn{p} columns of the observations for continuous explanatory variables}.
}
  \item{Y}{
  vector of the continuous response variable.
}
  \item{bw.fixed.value}{
  vector of fixed bandwidths for domain kernels. Default is \code{NULL}, which allows
  for optimal bandwidth selection via cross-validaton during each re-smooth.
}
  \item{resmooths}{
  number of resmooth iterations. Default is 1 resmooth, which is a suggested starting point
  for iterative smoothing.
}
  \item{\dots}
  additional specifications for optimal bandwidth selection procedure, kernel type,
  regression estimator, and so on. See \code{\link{npreg}} for more details
}
\value{
\item{selec.var}{list of vectors of the selected variables, one vector for each penalization parameter.}
\item{aic.var}{vector of variables selected using AIC.}
}

\seealso{
  \code{\link{npreg}}, \code{\link{npregbw}}
}

\examples{
## 1D Simulated changepoint data
changepoint.data <- changepoint.sim1D(100)

model.alc <- alc(changepoint.data$X,changepoint.data$)

plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",pch=1,col="grey",las=1)
lines(changepoint.data$X,model.llc$mean,col="red",lty=1)

## 2D Simulated changepoint data
absorber(x=x_trunc, y=y_trunc, M = 3)

## 2D Real data
}

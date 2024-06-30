\name{changepoint.sim2D}
\alias{changepoint.sim2D}

\title{
Change-point data simulation for two-dimensions
}

\description{
This function generates circular change-point data.
}

\usage{
changepoint.sim2D(data.dim = c(100,100),sigma = 20,radius=NULL,cbase=80,ctop=130))
}

\arguments{
  \item{data.dim}{
  Vector of two integers for the size of the two-dimensional dataset. The dimensions
  are suggested to be the same. However, for uneven dimensions, the first value must
  be larger.}
  \item{sigma}{
  Numeric value of standard deviation.
  }
  \item{radius}{
  Radius of the inner disk before the change-point. Defaults to one quarter of
  the first dimension of \code{data.dim}.
  }
  \item{cbase}{
  Value for the disk that radiates out from the approximate center of the dataset.
  }
  \item{ctop}{
  Value after the circular change-point, seperating the disk and the outer region.
  }
}


\value{
  This function produces a matrix of integer values.
}

\references{

    Thompson, J.R.J. (2024) \dQuote{Iterative Smoothing for Change-point Regression Function Estimation}, \emph{Journal of Applied Statistics}, 1-25. <https://www.tandfonline.com/doi/abs/10.1080/02664763.2024.2352759>

}

\examples{
library(reshape2)
changepoint.data <- changepoint.sim2D()
image(1:nrow(changepoint.data), 1:ncol(changepoint.data),
      matrix(changepoint.data, nrow=nrow(changepoint.data), byrow=FALSE))
}


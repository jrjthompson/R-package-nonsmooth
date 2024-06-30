\name{changepoint.sim1D}
\alias{changepoint.sim1D}

\title{
Change-point data simulation for one-dimension
}

\description{
This function generates three change-point data types and one smooth data type.
}

\usage{
changepoint.sim1D(n,sigma=1,data.type = "continuousWithJump")
}

\arguments{
  \item{n}{Sample size.}
  \item{sigma}{Numeric value of standard deviation.}
  \item{data.type}{Different data types}
}

\value{This function produces a data.frame, consisting of the simulated data
and the data generating process.

\item{X}{Vector of explanatory data}
\item{Y}{Vector of response data}
\item{oracle}{Vector of the data generating process for \code{Y}}
}



\references{

    Thompson, J.R.J. (2024) \dQuote{Iterative Smoothing for Change-point Regression Function Estimation}, \emph{Journal of Applied Statistics}, 1-25. <https://www.tandfonline.com/doi/abs/10.1080/02664763.2024.2352759>

}

\examples{
changepoint.data <- changepoint.sim1D(100)
plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",pch=1,col="grey",las=1)
lines(changepoint.data$X,changepoint.data$oracle,col="red",lty=1)
}

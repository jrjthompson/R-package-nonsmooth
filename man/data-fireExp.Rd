\name{fireExp}
\docType{data}
\alias{fireExp}
\title{Fire spread experiments conducted in a fume hoood}
\description{

The fire spread data consists of segmented images from 29 fire
smouldering experiments of wax paper. The data were measured using
a digital camera at a birds-eye view above the experiment. The data
is segmented by 1 second between images. There are 16 experiments
where the laying flat, 8 experiments at an angle of 11 degrees, and
5 experiments at an angle of 32 degrees. To access eachvideos, use
\code{flat##}, \code{11slope0#}, and \code{32slope0#}. The uphill
direction in each experiment is to the left in an image.
}
\usage{data("11slope01")}
\format{ A data frame with 10 columns, and 1655 rows.
  \describe{
 \item{food}{ expenditure share on food, of type \code{numeric}}
 \item{catering}{ expenditure share on catering, of type \code{numeric}}
 \item{alcohol}{ expenditure share on alcohol, of type \code{numeric}}
 \item{fuel}{ expenditure share on fuel, of type \code{numeric}}
 \item{motor}{ expenditure share on motor, of type \code{numeric}}
 \item{fares}{ expenditure share on fares, of type \code{numeric}}
 \item{leisure}{ expenditure share on leisure, of type \code{numeric}}
 \item{logexp}{ logarithm of total expenditure, of type \code{numeric}}
 \item{logwages}{ logarithm of total earnings, of type \code{numeric}}
 \item{nkids}{ number of children, of type \code{numeric}}
  }
}
\source{ John R.J. Thompson}
\references{

  Thompson, J.R.J., Wang, X.J., & Braun, W.J. (2020) \dQuote{A mouse model for studying fire spread rates using experimental micro-fires}, *Journal of Environmental Statistics*, 9(1), 1-19. <http://www.jenvstat.org/v09/i06>

    Wang, X.J., Thompson, J.R.J., Braun, W.J., & Woolford, D.G. (2019) \dQuote{Fitting a stochastic fire spread model to data.} \emph{Advances in Statistical Climatology, Meteorology and Oceanography}, 5(1), 57-66. <https://ascmo.copernicus.org/articles/5/57/2019/>

}

\keyword{datasets}

\examples{
\dontrun{
## Example - load and view a fire spread experiment

data(11slope01)

## Sort on logexp (the endogenous regressor) for plotting purposes

Engel95 <- Engel95[order(Engel95$logexp),]

attach(Engel95)

model.iv <- npregiv(y=food,z=logexp,w=logwages,method="Landweber-Fridman")
phihat <- model.iv$phi

## Compute the non-IV regression (i.e. regress y on z)

ghat <- npreg(food~logexp,regtype="ll")

## For the plots, restrict focal attention to the bulk of the data
## (i.e. for the plotting area trim out 1/4 of one percent from each
## tail of y and z)

trim <- 0.0025

plot(logexp,food,
     ylab="Food Budget Share",
     xlab="log(Total Expenditure)",
     xlim=quantile(logexp,c(trim,1-trim)),
     ylim=quantile(food,c(trim,1-trim)),
     main="Nonparametric Instrumental Kernel Regression",
     type="p",
     cex=.5,
     col="lightgrey")

lines(logexp,phihat,col="blue",lwd=2,lty=2)

lines(logexp,fitted(ghat),col="red",lwd=2,lty=4)

legend(quantile(logexp,trim),quantile(food,1-trim),
       c(expression(paste("Nonparametric IV: ",hat(varphi)(logexp))),
         "Nonparametric Regression: E(food | logexp)"),
       lty=c(2,4),
       col=c("blue","red"),
       lwd=c(2,2))
} % enddontrun
}

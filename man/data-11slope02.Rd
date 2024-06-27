\name{fireExp}
\docType{data}
\alias{fireExp}
\title{Fire spread experiments conducted in a fume hoood}
\description{

The fire spread data consists of segmented RGB images from 29 fire
smouldering experiments of wax paper. The data were measured using
a digital camera at a birds-eye view above the experiment. The data
is segmented by 1 second between images. There are 16 experiments
where the laying flat, 8 experiments at an angle of 11 degrees, and
5 experiments at an angle of 32 degrees. The uphill
direction in each experiment is to the left in an image.
}
\usage{data("11slope02")}
\format{
Each fire movie is a data frame with four dimensions called
\code{fireImages}. The first and second dimensions are the rows and
columns of one image. The third dimension is each RGB channel, with
the red channel (1), blue channel (2), and green channel (3). The
fourth dimension is time, starting at igntion (time point 1), and
then each RGB image is seperated by one second. To access each video, use \code{flat##}, \code{11slope0#}, and \code{32slope0#}.
}

\source{John R.J. Thompson}
\references{

  Thompson, J.R.J., Wang, X.J., & Braun, W.J. (2020) \dQuote{A mouse model for studying fire spread rates using experimental micro-fires}, *Journal of Environmental Statistics*, 9(1), 1-19. <http://www.jenvstat.org/v09/i06>

  Wang, X.J., Thompson, J.R.J., Braun, W.J., & Woolford, D.G. (2019) \dQuote{Fitting a stochastic fire spread model to data.} \emph{Advances in Statistical Climatology, Meteorology and Oceanography}, 5(1), 57-66. <https://ascmo.copernicus.org/articles/5/57/2019/>

}

\keyword{datasets}

\examples{
\dontrun{
## Example - loading, viewing, and smoothing a fire spread experiment that contains change-points

data("11slope02")

## Plot the raw data as a 2d image

library(plotly)
plot_ly(z=matrix(fireImages[,,1,1],nrow = nrow(fireImages[,,1,1])), type="surface")

library(np)
library(reshape2)
ckertype <- "gaussian"
bwmethod <- "cv.aic"
regtype <- "lc"

## Smooth a fire image

fire.image <- fireImages[,,,1]
smoothed.fire.image <- array(NA,dim=dim(fire.image))
for (rgb in 1:3){ #red(1),green(2),blue(3)
  data <- melt(id.var=1:nrow(fire.image[,,rgb]), fire.image[,,rgb])
  names(data) <- c("X_1","X_2","Y")

  X<-data[,1:2]
  Z<-data[,3]

  bw.lc <- npregbw(xdat = X,ydat = Z,regtype=regtype,bwmethod=bwmethod,ckertype=ckertype,
                   bandwidth.compute = FALSE,bws=c(0.5*sd(X[,1])/(dim(X)[1]^(1/6)),0.5*sd(X[,1])/(dim(X)[1]^(1/6))))
  model.lc <- npreg(bw.lc) #this can take some time
  model.alc <- model.lc

  bw.alc <- sd(Z-model.lc$mean)/(length(Z)^(1/4))

  X <- data.frame(data[,1:2],gx=model.alc$mean)
  model.alc$bw <- c(model.alc$bw,bw.alc)
  bw.alc <- npregbw(xdat = X,ydat = Z,bws=model.alc$bw, regtype=regtype,bwmethod=bwmethod,ckertype=ckertype,bandwidth.compute = FALSE)
  model.alc<- npreg(bw.alc) #this can take some time

  smoothed.fire.image[,,rgb] <- model.alc$mean
}

## Plot the smoothed fire image

plot_ly(z=matrix(smoothed.fire.image[,,1]*255,nrow = nrow(smoothed.fire.image)), type="surface")
} % enddontrun
}

alc <- function(X,Y,bw.fixed.value=NULL,
                resmooths=1,ckertype="gaussian",bwmethod="cv.ls",regtype="lc"){
  ## Fit data using local constant kernel estimator (LC)
  bw.lc <- npregbw(Y~X,regtype=regtype,bwmethod=bwmethod,ckertype=ckertype)
  model.lc <- npreg(bw.lc)
  model.alc <- model.lc #set this temporarily

  ## Use LC \widehat{g}(x) as pilot g(x) in ALC for the first time,
  ## and then ALC for each repeat
  for (i in 1:resmooths){
    gX <- model.alc$mean
    ## Refit data using the local constant estimator as an input
    bw.llc <- npregbw(Y~X+gX,regtype=regtype,bwmethod=bwmethod,ckertype=ckertype)
    if (!is.null(bw.fixed.value)){
      bw.llc$bw <- c(bw.llc$bw[1:dim(X)[2]],bw.fixed.value)
    }
    model.alc <- npreg(bw.llc)
  }
  model.alc
}


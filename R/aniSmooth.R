simulation.ALC <- function(seed,n,data.type="uniformJump",sigma,bw.fixed.value=NULL,
                            repeats=1,ckertype,bwmethod,regtype){
  set.seed(42+seed)## Generate data
  data <- data.generate(n,data.type = data.type,sigma = sigma)
  
  ## Fit data using local constant kernel estimator (LC) 
  bw.lc <- npregbw(Y~X,data=data,regtype=regtype,bwmethod=bwmethod,ckertype=ckertype)
  model.lc <- npreg(bw.lc)
  model.alc <- model.lc #set this temporarily

  ## Use LC \widehat{g}(x) as pilot g(x) in ALC for the first time,
  ## and then ALC for each repeat
  for (i in 1:repeats){
    data <- data.frame(oracle=data$oracle,X=data$X,Y=data$Y,gX=data$oracle) #replace data$oracle with model.alc$mean if you want ALC smoothing 
    ## Refit data using the local constant estimator as an input
    bw.llc <- npregbw(Y~X+gX,data=data,regtype=regtype,bwmethod=bwmethod,ckertype=ckertype)
    if (!is.null(bw.fixed.value)){
      bw.llc$bw <- c(bw.llc$bw[1],bw.fixed.value)
    }
    model.alc <- npreg(bw.llc)
  }

  ## Check fit with oracle function and retern mean squared error
  model.lc.ESE <- 0 #we already have this so we don't bother
  model.alc.ESE <- mean((model.alc$mean-data$oracle)^2)
  c(model.lc.ESE,model.alc.ESE)
}

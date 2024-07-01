## R CMD check results

0 errors | 0 warnings | 3 notes

checking CRAN incoming feasibility ... NOTE
  Maintainer: 'John R.J. Thompson <john.thompson@ubc.ca>'
  
  New submission

Possibly misspelled words in DESCRIPTION:
    Nonsmooth (2:44)
    anisotropic (8:140)
  
# These words are not mispelled, and are typical in the area of nonparametric smoothing.

Size of tarball: 175314694 bytes

# The tarball is this size, since this package is contains a fire experimentation imagery data, which is a change-point dataset.

checking installed package size ... NOTE
    installed size is 168.3Mb
    sub-directories of 1Mb or more:
      data  168.2Mb
      
# To reiterate, this package contains a large fire experimentation imagery dataset.      

❯ checking examples ... NOTE
  Examples with CPU (user + system) or elapsed time > 5s
        user system elapsed
  alc 228.19   0.02   228.8
  
# Fitting the anisotropic smoothing model to one image takes slight more than 3 minutes.

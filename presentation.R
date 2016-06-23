# require(devtools)
# library(httr)
# set_config(use_proxy(url="10.26.0.16", port=3128))
# install_github("ramnathv/slidify")
# install_github("ramnathv/slidifyLibraries")

library(slidify)

#wd <- "D:/github/statistics101"
wd <- "/home/csafferling/Documents/github/statistics101"
setwd(wd)

author("statistics101")
slidify("index.Rmd")

# The YAML parsing is done by the yaml package which will treat true as TRUE. 
# The easiest thing to make this work on the javascript side is to use 
# page.foo === "TRUE", or even better write a function that will return true 
# when the input is TRUE.
# https://github.com/ramnathv/slidify/issues/455#issuecomment-140250538

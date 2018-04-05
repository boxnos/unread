#!/usr/bin/env Rscript

library(tcltk)
library(tcltk2)

data <- read.csv(commandArgs(trailingOnly=TRUE)[1], header=FALSE)

X11()
plot(data)

ret <- tkmessageBox(message = "Hit enter to close plot")

# vim: ft=r

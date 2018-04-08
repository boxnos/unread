#!/usr/bin/env Rscript

library(tcltk)
library(tcltk2)

data <- read.csv(commandArgs(trailingOnly=TRUE)[1])

data[,1] = as.Date(data[,1])

X11()
plot(data)

ret <- tkmessageBox(message = "Hit enter to close plot")

# vim: ft=r

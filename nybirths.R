source('utils.R')

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
birthsts <- ts(births, frequency = 12, start = c(1946,1))
birthsts
plot.ts(birthsts)
birthstsdecomp <- decompose(birthsts)
birthstsdecomp
plot(birthstsdecomp)
birthstsseasonremoved <- birthsts - birthstsdecomp$seasonal
plot.ts(birthstsseasonremoved)

source('utils.R')

kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip=3)
kingsts <- ts(kings)
kingsts
plot.ts(kingsts)

# Moving Average
kingstssma3 <- SMA(kingsts, 3)
plot.ts(kingstssma3)
kingstssma8 <- SMA(kingsts, 8)
plot.ts(kingstssma8)


kingstsdiff1 <- diff(kingsts, differences = 1)
plot.ts(kingstsdiff1)
acf(kingstsdiff1, lag.max = 20)
acf(kingstsdiff1, lag.max = 20, plot = F)
pacf(kingstsdiff1, lag.max = 20)
pacf(kingstsdiff1, lag.max = 20, plot = F)

# ARIMA
auto.arima(kings)
kingstsarima <- arima(kingsts, order = c(0,1,1))
kingstsarima
kingstsarimaforecast <- forecast.Arima(kingstsarima, h=5)
plot.forecast(kingstsarimaforecast)
acf(kingstsarimaforecast$residuals, lag.max = 20)
Box.test(kingstsarimaforecast$residuals, lag = 20, type='Ljung-Box')
plot.ts(kingstsarimaforecast$residuals)
plotForecastErrors(kingstsarimaforecast$residuals)

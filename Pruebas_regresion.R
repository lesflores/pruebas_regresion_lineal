# Normalidad
plot(density(modelo$residuals))
shapiro.test(resid(modelo))

# Heterocedasticidad
library(lmtest)
bptest(modelo)

# Linealidad
library(lmtest)
resettest(modelo, power = 2:3)

# Independencia de residuos
library(lmtest)
dwtest(modelo)

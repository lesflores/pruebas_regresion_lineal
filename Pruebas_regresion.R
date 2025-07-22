# Pruebas de supuestos para modelos lineales

# Normalidad
plot(density(modelo$residuals))
shapiro.test(resid(modelo))

# Heterocedasticidad
library(lmtest)
bptest(modelo)

# Linealidad
resettest(modelo, power = 2:3)

# Independencia de residuos
dwtest(modelo)

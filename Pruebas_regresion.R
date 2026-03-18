# ============================================
# Pruebas de supuestos para modelos lineales
# Profesora: Lesly Flores
# ============================================

library(lmtest)

# --- 1. NORMALIDAD DE RESIDUOS ---
shapiro.test(resid(modelo))          # Formal (funciona bien con n < 50)
ks.test(resid(modelo), "pnorm")      # Alternativa para muestras grandes
plot(density(modelo$residuals))      # Visual

# --- 2. HOMOCEDASTICIDAD ---
bptest(modelo)                       # Breusch-Pagan
plot(modelo, which = 3)              # Scale-Location plot

# --- 3. LINEALIDAD ---
resettest(modelo, power = 2:3)       # RESET de Ramsey
plot(modelo, which = 1)              # Residuals vs Fitted

# --- 4. INDEPENDENCIA DE RESIDUOS ---
dwtest(modelo)                       # Durbin-Watson (series de tiempo)
bgtest(modelo, order = 2)            # Breusch-Godfrey (más general)

# --- 5. MULTICOLINEALIDAD (BONUS) ---
vif(modelo)                          # VIF > 5 es señal de alerta

# --- DIAGNÓSTICO VISUAL COMPLETO ---
par(mfrow = c(2, 2))
plot(modelo)                         # Los 4 gráficos clásicos de una vez

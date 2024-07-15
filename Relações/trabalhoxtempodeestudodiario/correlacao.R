
colnames(dados)

# Tabela de contingência para Trabalho e Moradia
tabela_contingencia <- table(dados$Trabalho, dados$EstudoDiario)
print(tabela_contingencia)

# Teste qui-quadrado
resultado_teste <- chisq.test(tabela_contingencia)
print(resultado_teste)
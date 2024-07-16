# Criar a tabela de frequências para Sexo x Semestre
tabela_frequencias <- table(dados$Sexo, dados$Semestre)
print(tabela_frequencias)

# Criar um dataframe para o gráfico de barras
df_grafico <- as.data.frame(tabela_frequencias)
colnames(df_grafico) <- c("Sexo", "Semestre", "Frequencia")

# Plotar o gráfico de barras
ggplot(df_grafico, aes(x = Semestre, y = Frequencia, fill = Sexo)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre Sexo e Semestre que está Cursando",
       x = "Semestre",
       y = "Frequência",
       fill = "Sexo") +
  theme_minimal()
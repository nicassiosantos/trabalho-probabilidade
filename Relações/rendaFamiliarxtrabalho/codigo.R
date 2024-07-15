# Criar a tabela de frequências para Renda Familiar x Trabalho
tabela_frequencias <- table(dados$Renda, dados$Trabalho)
print(tabela_frequencias)

# Criar um dataframe para o gráfico de barras
df_grafico <- as.data.frame(tabela_frequencias)
colnames(df_grafico) <- c("RendaFamiliar", "Trabalho", "Frequencia")

# Plotar o gráfico de barras
ggplot(df_grafico, aes(x = RendaFamiliar, y = Frequencia, fill = Trabalho)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre Renda Familiar e Trabalho",
       x = "Renda Familiar",
       y = "Frequência",
       fill = "Trabalha?") +
  theme_minimal()
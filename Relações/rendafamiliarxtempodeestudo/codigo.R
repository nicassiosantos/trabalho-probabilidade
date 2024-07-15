# Criar a tabela de frequências para Renda Familiar x Tempo de Estudo Diário
tabela_frequencias <- table(dados$RendaFamiliar, dados$TempoEstudoDiario)
print(tabela_frequencias)

# Criar um dataframe para o gráfico de barras
df_grafico <- as.data.frame(tabela_frequencias)
colnames(df_grafico) <- c("RendaFamiliar", "TempoEstudoDiario", "Frequencia")

# Plotar o gráfico de barras
ggplot(df_grafico, aes(x = RendaFamiliar, y = Frequencia, fill = TempoEstudoDiario)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre Renda Familiar e Tempo de Estudo Diário",
       x = "Renda Familiar",
       y = "Frequência",
       fill = "Tempo de Estudo Diário") +
  theme_minimal()
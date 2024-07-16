tabela_frequencias <- table(dados$Renda, dados$EstudoDiario)
print(tabela_frequencias)

# Criar um dataframe para o gráfico de barras
df_grafico <- as.data.frame(tabela_frequencias)
colnames(df_grafico) <- c("RendaFamiliar", "TempoEstudoDiario", "Frequencia")

# Plotar o gráfico de barras
ggplot(df_grafico, aes(x = Renda, y = Frequencia, fill = EstudoDiario)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre Renda Familiar e Tempo de Estudo Diário",
       x = "Renda Familiar",
       y = "Frequência",
       fill = "Tempo de Estudo Diário") +
  theme_minimal()
# Criar a tabela de frequências para Estudo Diário x Dedicação Fora de classe
tabela_frequencias <- table(dados$EstudoDiario, dados$DedicaDisciplina)
print(tabela_frequencias)

# Criar um dataframe para o gráfico de barras
df_grafico <- as.data.frame(tabela_frequencias)
colnames(df_grafico) <- c("EstudoDiario", "Dedicacao", "Frequencia")

# Plotar o gráfico de barras
ggplot(df_grafico, aes(x = EstudoDiario, y = Frequencia, fill = Dedicacao)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre estudo Diário x Dedicação Fora de classe",
       x = "Estudo Diário",
       y = "Frequência",
       fill = "Dedica mais de 3 horas fora da classe?") +
  theme_minimal()
# Instalar pacotes se necessário
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

# Carregar pacotes
library(dplyr)
library(ggplot2) 


#Considerando que o banco de dados "dados" já foi organizado como na pasta trabalhoxmoradia

# Selecionar colunas relevantes
dados_selecionados <- dados %>%
  select(Trabalho, EstudoDiario)

# Verificar valores únicos para entender a estrutura
unique(dados_selecionados$Trabalho)
unique(dados_selecionados$EstudoDiario)

# Tabela de frequência para Trabalho e EstudoDiario
tabela_frequencia <- dados_selecionados %>%
  group_by(Trabalho, EstudoDiario) %>%
  summarize(Contagem = n())

# Visualizar tabela de frequência
print(tabela_frequencia)

# Criar gráfico de barras empilhadas para visualizar a relação entre Trabalho e EstudoDiario
ggplot(dados_selecionados, aes(x = Trabalho, fill = EstudoDiario)) +
  geom_bar(position = "dodge") +
  labs(title = "Relação entre Trabalho e Tempo de Estudo Diário",
       x = "Você trabalha?",
       y = "Contagem",
       fill = "Tempo de Estudo Diário") +
  theme_minimal()
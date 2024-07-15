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
  select(ParticipacaoAulas, DedicaDisciplina)

# Verificar valores únicos para entender a estrutura
unique(dados_selecionados$ParticipacaoAulas)
unique(dados_selecionados$DedicaDisciplina)

# Tabela de frequência para ParticipacaoAulas e DedicaDisciplina
tabela_frequencia <- dados_selecionados %>%
  group_by(ParticipacaoAulas, DedicaDisciplina) %>%
  summarize(Contagem = n())

# Visualizar tabela de frequência
print(tabela_frequencia)

# Criar gráfico de barras empilhadas para visualizar a relação entre ParticipacaoAulas e DedicaDisciplina
ggplot(dados_selecionados, aes(x = ParticipacaoAulas, fill = DedicaDisciplina)) +
  geom_bar(position = "dodge") +
  labs(title = "Relação entre Participação nas Aulas e Dedicação às Disciplinas",
       x = "Participação nas Aulas",
       y = "Contagem",
       fill = "Dedicação às Disciplinas") +
  theme_minimal()
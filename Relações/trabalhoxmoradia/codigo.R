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

# Ler os dados do arquivo CSV
dados <- read.csv("QUESTIONÁRIO DE AVALIAÇÃO DA UEFS  (respostas) - Respostas ao formulário 1.csv", stringsAsFactors = FALSE)

# Visualizar os dados
head(dados)


# Renomear colunas para facilitar a manipulação
colnames(dados) <- c("DataHora", "Idade", "Sexo", "Semestre", "Renda", "Periodo", "Trabalho", "Moradia", "EstudoDiario",
                     "InfraSalas", "InfraBibliotecas", "EstruturaGeral", "Internet", "Laboratorio", "QualidadeEnsino",
                     "AtendimentoSecretarias", "RelacaoProfessorAluno", "DedicaDisciplina", "ParticipacaoTrabalhos",
                     "ParticipacaoAulas")

# Selecionar colunas relevantes
dados_selecionados <- dados %>%
  select(Trabalho, Moradia)

# Verificar valores únicos para entender a estrutura
unique(dados_selecionados$Trabalho)
unique(dados_selecionados$Moradia)

# Contar frequências das combinações de trabalho e moradia
tabela_trabalho_moradia <- dados_selecionados %>%
  group_by(Trabalho, Moradia) %>%
  summarise(Frequencia = n()) %>%
  ungroup()

# Visualizar tabela de frequências
print(tabela_trabalho_moradia)

# Criar gráfico de barras
ggplot(tabela_trabalho_moradia, aes(x = Trabalho, y = Frequencia, fill = Moradia)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre Trabalho e Tipo de Moradia",
       x = "Você trabalha?",
       y = "Frequência",
       fill = "Mora com quem?") +
  theme_minimal()
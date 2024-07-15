if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("DescTools", quietly = TRUE)) {
  install.packages("DescTools")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
# Carregar pacotes
library(readxl)
library(dplyr)
library(DescTools) # Pacote para calcular a moda
library(ggplot2)

# Carregar arquivo Excel
file_path <- "DB_probabilidade.xlsx"
dados <- read_excel(file_path)

# Verificar as primeiras linhas do dataframe para entender sua estrutura
head(dados)

# Verificar os nomes das colunas para identificar a coluna de renda familiar
colnames(dados)

# Calcular a frequência da renda familiar
frequencia_renda <- dados %>%
  group_by(Renda.Familiar) %>%
  summarize(Contagem = n())

# Visualizar a tabela de frequência
print(frequencia_renda)

# Calcular a moda da renda familiar
moda_renda <- Mode(dados$Renda.Familiar)
print(paste("Moda da Renda Familiar: ", moda_renda))

grafico <- ggplot(frequencia_renda, aes(x = Renda.Familiar, y = Contagem)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_vline(aes(xintercept = (moda_renda)), color = "red", linetype = "dashed", size = 1) +
  labs(title = "Frequência da Renda Familiar",
       x = "Renda Familiar",
       y = "Contagem") +
  theme_minimal()

# Exibir o gráfico
print(grafico)



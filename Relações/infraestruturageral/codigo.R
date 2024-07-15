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
dados_infraestrutura <- dados %>%
  select(InfraSalas, InfraBibliotecas, EstruturaGeral, Internet, Laboratorio)

# Verificar valores únicos para entender a estrutura
unique(dados_infraestrutura$InfraSalas)
unique(dados_infraestrutura$InfraBibliotecas)
unique(dados_infraestrutura$EstruturaGeral)
unique(dados_infraestrutura$Internet)
unique(dados_infraestrutura$Laboratorio)

# Calcular frequências e proporções
frequencias <- dados_infraestrutura %>%
  summarise(
    InfraSalas_Sim = sum(InfraSalas == "Sim"),
    InfraSalas_Nao = sum(InfraSalas == "Não"),
    InfraBibliotecas_Sim = sum(InfraBibliotecas == "Sim"),
    InfraBibliotecas_Nao = sum(InfraBibliotecas == "Não"),
    EstruturaGeral_Boa = sum(EstruturaGeral == "Boa"),
    EstruturaGeral_Regular = sum(EstruturaGeral == "Regular"),
    EstruturaGeral_Ruim = sum(EstruturaGeral == "Ruim"),
    Internet_Boa = sum(Internet == "Boa"),
    Internet_Regular = sum(Internet == "Regular"),
    Internet_Ruim = sum(Internet == "Ruim"),
    Laboratorio_Boa = sum(Laboratorio == "Boa"),
    Laboratorio_Regular = sum(Laboratorio == "Regular"),
    Laboratorio_Ruim = sum(Laboratorio == "Ruim")
  )

# Visualizar frequências
print(frequencias)

# Criar gráficos para cada aspecto da infraestrutura
ggplot(dados, aes(x = InfraSalas, fill = InfraSalas)) +
  geom_bar() +
  labs(title = "Avaliação da Infraestrutura das Salas de Aula e Estudo é boa?",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()

ggplot(dados, aes(x = InfraBibliotecas, fill = InfraBibliotecas)) +
  geom_bar() +
  labs(title = "Avaliação da Infraestrutura das Bibliotecas é boa?",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()

ggplot(dados, aes(x = EstruturaGeral, fill = EstruturaGeral)) +
  geom_bar() +
  labs(title = "Avaliação da Estrutura Geral da Universidade",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()

ggplot(dados, aes(x = Internet, fill = Internet)) +
  geom_bar() +
  labs(title = "Avaliação da Internet da Universidade",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()

ggplot(dados, aes(x = Laboratorio, fill = Laboratorio)) +
  geom_bar() +
  labs(title = "Avaliação a infraestrutura do Laboratório da Universidade",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()
# Instalar pacotes se necessário
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}

# Carregar pacotes
library(dplyr)
library(ggplot2) 
library(readxl) 

# Ler os dados do arquivo CSV
dados <- read_excel("DB_probabilidade.xlsx")

# Visualizar os dados
head(dados)


# Renomear colunas para facilitar a manipulação
colnames(dados) <- c("DataHora", "Idade", "Sexo", "Semestre", "Renda", "Periodo", "Trabalho", "Moradia", "EstudoDiario",
                     "InfraSalas", "InfraBibliotecas", "EstruturaGeral", "Internet", "Laboratorio", "QualidadeEnsino",
                     "AtendimentoSecretarias", "RelacaoProfessorAluno", "DedicaDisciplina", "ParticipacaoTrabalhos",
                     "ParticipacaoAulas")



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


# Criar a tabela de frequências para Infraestrutura das Salas x Tempo de Estudo Diário
tabela_frequencias <- table(dados$InfraSalas, dados$EstudoDiario)
print(tabela_frequencias)

# Criar um dataframe para o gráfico de barras
df_grafico <- as.data.frame(tabela_frequencias)
colnames(df_grafico) <- c("InfraestruturaSalas", "TempoEstudoDiario", "Frequencia")

# Plotar o gráfico de barras
ggplot(df_grafico, aes(x = InfraestruturaSalas, y = Frequencia, fill = TempoEstudoDiario)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Relação entre Adequação da Infraestrutura das Salas e Tempo de Estudo Diário",
       x = "Infraestrutura das Salas de Aula",
       y = "Frequência",
       fill = "Tempo de Estudo Diário") +
  theme_minimal() 


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


tabela_frequencias <- table(dados$Renda, dados$EstudoDiario)
print(tabela_frequencias)

bela_frequencias <- table(dados$Renda, dados$EstudoDiario)
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
  labs(title = "Infraestrutura das Salas de Aula e Estudo é boa?",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()

ggplot(dados, aes(x = InfraBibliotecas, fill = InfraBibliotecas)) +
  geom_bar() +
  labs(title = "Infraestrutura das Bibliotecas é boa?",
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
  labs(title = "Avaliação da infraestrutura do Laboratório da Universidade",
       x = "Resposta",
       y = "Contagem") +
  theme_minimal()

# Trecho para cálculo dos Qui-Quadrados #
#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Moradia, dados$Trabalho)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)

#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$ParticipacaoAulas, dados$DedicaDisciplina)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)


#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Sexo, dados$Moradia)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)



#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Semestre, dados$EstruturaGeral)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)


#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Sexo, dados$Semestre)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)



#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Sexo, dados$Moradia)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)

#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Semestre, dados$DedicaDisciplina)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)

#====== Criar a tabela de contingência
tabela_contingencia <- table(dados$Semestre, dados$ParticipacaoTrabalhos)
# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)
# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)

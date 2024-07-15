# Renomear colunas para facilitar a manipulação
colnames(dados) <- c("DataHora", "Idade", "Sexo", "Semestre", "RendaFamiliar", "Periodo", "Trabalho", "Moradia", "TempoEstudoDiario", "InfraestruturaSalas", "InfraestruturaBibliotecas", "EstruturaGeral", "Internet", "Laboratorio", "QualidadeEnsino", "AtendimentoSecretarias", "RelacaoProfessorAluno", "DedicacaoDisciplinas", "ParticipacaoTrabalhos", "ParticipacaoAulas")

# Criar a tabela de frequências para Infraestrutura das Salas x Tempo de Estudo Diário
tabela_frequencias <- table(dados$InfraestruturaSalas, dados$TempoEstudoDiario)
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
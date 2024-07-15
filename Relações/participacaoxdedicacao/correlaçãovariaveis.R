# Verificar se as variáveis existem no conjunto de dados
if (!("ParticipacaoAulas" %in% names(dados)) | !("DedicaDisciplina" %in% names(dados))) {
  stop("As variáveis 'ParticipacaoAulas' e/ou 'DedicacaoDisciplinas' não existem no conjunto de dados.")
}

# Verificar o comprimento das variáveis
if (length(dados$ParticipacaoAulas) != length(dados$DedicaDisciplina)) {
  stop("As variáveis 'ParticipacaoAulas' e 'DedicacaoDisciplinas' têm comprimentos diferentes.")
}

# Criar a tabela de contingência
tabela_contingencia <- table(dados$ParticipacaoAulas, dados$DedicaDisciplina)

# Exibir a tabela de contingência
print(tabela_contingencia)

# Calcular o teste qui-quadrado
resultado_chi2 <- chisq.test(tabela_contingencia)

# Exibir o resultado do teste qui-quadrado
print(resultado_chi2)
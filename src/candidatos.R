library(data.table)
library(dplyr)

# Desabilitando característica experimental de 'localização' (locale) do fread
options(datatable.fread.dec.experiment=FALSE)

###################################### 
# GERANDO BASE DE CANDIDATOS DE 2012 #
######################################

cnames <- c('DATA_GERACAO', 'HORA_GERACAO', 'ANO_ELEICAO', 'NUM_TURNO',
            'DESCRICAO_ELEICAO', 'SIGLA_UF', 'SIGLA_UE', 'DESCRICAO_UE',
            'CODIGO_CARGO', 'DESCRICAO_CARGO', 'NOME_CANDIDATO',
            'SEQUENCIAL_CANDIDATO', 'NUMERO_CANDIDATO', 'CPF_CANDIDATO',
            'NOME_URNA_CANDIDATO', 'COD_SITUACAO_CANDIDATURA',
            'DES_SITUACAO_CANDIDATURA', 'NUMERO_PARTIDO', 'SIGLA_PARTIDO',
            'NOME_PARTIDO', 'CODIGO_LEGENDA', 'SIGLA_LEGENDA',
            'COMPOSICAO_LEGENDA', 'NOME_LEGENDA', 'CODIGO_OCUPACAO',
            'DESCRICAO_OCUPACAO', 'DATA_NASCIMENTO',
            'NUM_TITULO_ELEITORAL_CANDIDATO', 'IDADE_DATA_ELEICAO',
            'CODIGO_SEXO', 'DESCRICAO_SEXO', 'COD_GRAU_INSTRUCAO',
            'DESCRICAO_GRAU_INSTRUCAO', 'CODIGO_ESTADO_CIVIL',
            'DESCRICAO_ESTADO_CIVIL', 'CODIGO_NACIONALIDADE',
            'DESCRICAO_NACIONALIDADE', 'SIGLA_UF_NASCIMENTO',
            'CODIGO_MUNICIPIO_NASCIMENTO', 'NOME_MUNICIPIO_NASCIMENTO',
            'DESPESA_MAX_CAMPANHA', 'COD_SIT_TOT_TURNO', 'DESC_SIT_TOT_TURNO',
            'NM_EMAIL')

cclasses <- c(rep('character', 2), rep('integer', 2), rep('character', 4),
              # CODIGO_CARGO
              'integer', rep('character', 2), 'integer64', 'integer',
              # CPF_CANDIDATO
              rep('character', 2), 'integer', 'character', 'integer',
              # SIGLA_PARTIDO
              rep('character', 2), 'integer', rep('character', 3), 'integer',
              # DESCRICAO_OCUPACAO
              rep('character', 3), rep('integer', 2), 'character', 'integer',
              # DESCRICAO_GRAU_INSTRUCAO
              'character', 'integer', 'character', 'integer', 'character',
              # SIGLA_UF_NASCIMENTO
              'character', 'integer', 'character', 'numeric', 'integer',
              # DESC_SIT_TOT_TURNO
              rep('character', 2 ) )

cand_2012 <- fread('../raw_data/candidatos_2012.csv', header = FALSE, sep = ';',
                   stringsAsFactors = FALSE, dec = ',', data.table = F,
                   col.names = cnames, colClasses = cclasses)

cand_2012 <- cand_2012 %>%
  mutate(
    DATA_GERACAO = as.Date(DATA_GERACAO, format='%d/%m/%Y'),
    HORA_GERACAO = as.POSIXct(HORA_GERACAO, format = '%H:%M:%S'),
    DATA_NASCIMENTO = as.Date(DATA_NASCIMENTO, format = '%d/%m/%Y'),
    IDADE_DATA_ELEICAO = ifelse(IDADE_DATA_ELEICAO==-1, NA, IDADE_DATA_ELEICAO),
    CODIGO_MUNICIPIO_NASCIMENTO = ifelse(CODIGO_MUNICIPIO_NASCIMENTO==-1, NA, CODIGO_MUNICIPIO_NASCIMENTO),
    DESPESA_MAX_CAMPANHA = ifelse(DESPESA_MAX_CAMPANHA==-1, NA, DESPESA_MAX_CAMPANHA),
    NM_EMAIL = ifelse(NM_EMAIL=='#NULO#', NA, NM_EMAIL),
    SIGLA_LEGENDA = NA # DADO NÃO DISPONÍVEL NESTE ANO
  )

###################################### 
# GERANDO BASE DE CANDIDATOS DE 2016 #
######################################

cnames <- c('DATA_GERACAO', 'HORA_GERACAO', 'ANO_ELEICAO', 'NUM_TURNO',
            'DESCRICAO_ELEICAO', 'SIGLA_UF', 'SIGLA_UE', 'DESCRICAO_UE',
            'CODIGO_CARGO', 'DESCRICAO_CARGO', 'NOME_CANDIDATO',
            'SEQUENCIAL_CANDIDATO', 'NUMERO_CANDIDATO', 'CPF_CANDIDATO',
            'NOME_URNA_CANDIDATO', 'COD_SITUACAO_CANDIDATURA',
            'DES_SITUACAO_CANDIDATURA', 'NUMERO_PARTIDO', 'SIGLA_PARTIDO',
            'NOME_PARTIDO', 'CODIGO_LEGENDA', 'SIGLA_LEGENDA',
            'COMPOSICAO_LEGENDA', 'NOME_LEGENDA', 'CODIGO_OCUPACAO',
            'DESCRICAO_OCUPACAO', 'DATA_NASCIMENTO',
            'NUM_TITULO_ELEITORAL_CANDIDATO', 'IDADE_DATA_ELEICAO',
            'CODIGO_SEXO', 'DESCRICAO_SEXO', 'COD_GRAU_INSTRUCAO',
            'DESCRICAO_GRAU_INSTRUCAO', 'CODIGO_ESTADO_CIVIL',
            'DESCRICAO_ESTADO_CIVIL', 'CODIGO_COR_RACA', 'DESCRICAO_COR_RACA',
            'CODIGO_NACIONALIDADE', 'DESCRICAO_NACIONALIDADE',
            'SIGLA_UF_NASCIMENTO', 'CODIGO_MUNICIPIO_NASCIMENTO',
            'NOME_MUNICIPIO_NASCIMENTO', 'DESPESA_MAX_CAMPANHA',
            'COD_SIT_TOT_TURNO', 'DESC_SIT_TOT_TURNO', 'NM_EMAIL')

cclasses <- c(rep('character', 2), rep('integer', 2), rep('character', 4),
              # CODIGO_CARGO
              'integer', rep('character', 2), 'integer64', 'integer',
              # CPF_CANDIDATO
              rep('character', 2), 'integer', 'character', 'integer',
              # SIGLA_PARTIDO
              rep('character', 2), 'integer', rep('character', 3), 'integer',
              # DESCRICAO_OCUPACAO
              rep('character', 3), rep('integer', 2), 'character', 'integer',
              # DESCRICAO_GRAU_INSTRUCAO
              'character', 'integer', 'character', 'integer', 'character',
              # CODIGO_NACIONALIDADE
              'integer', 'character', 'character', 'integer', 'character',
              # DESPESA_MAX_CAMPANHA
              'numeric', 'integer', rep('character', 2) )

cand_2016 <- fread('../raw_data/candidatos_2016.csv', header = FALSE, sep = ';',
                   stringsAsFactors = FALSE, dec = ',', data.table = F,
                   col.names = cnames, colClasses = cclasses)

cand_2016 <- cand_2016 %>%
  mutate(
    DATA_GERACAO = as.Date(DATA_GERACAO, format='%d/%m/%Y'),
    HORA_GERACAO = as.POSIXct(HORA_GERACAO, format = '%H:%M:%S'),
    DATA_NASCIMENTO = as.Date(DATA_NASCIMENTO, format = '%d/%m/%Y'),
    IDADE_DATA_ELEICAO = ifelse(IDADE_DATA_ELEICAO==-1, NA, IDADE_DATA_ELEICAO),
    CODIGO_MUNICIPIO_NASCIMENTO = ifelse(CODIGO_MUNICIPIO_NASCIMENTO==-1, NA, CODIGO_MUNICIPIO_NASCIMENTO),
    DESPESA_MAX_CAMPANHA = ifelse(DESPESA_MAX_CAMPANHA==-1, NA, DESPESA_MAX_CAMPANHA),
    NM_EMAIL = ifelse(NM_EMAIL=='#NULO#', NA, NM_EMAIL)
  )

# Adicionando colunas que estão presentes a partir de 2014
cand_2012$CODIGO_COR_RACA <- NA
cand_2012$DESCRICAO_COR_RACA <- NA

# Reordenando colunas para ficar com a mesma ordem de 2014 em diante
cand_2012 <- cand_2012[c(1:35,45,46,36:44)]

# Unificando as duas bases
candidatos = rbind(cand_2012, cand_2016)
rm(cand_2012, cand_2016)

# Convertendo colunas para fatores/categorias
candidatos <- candidatos %>%
  mutate(
    ANO_ELEICAO = as.factor(ANO_ELEICAO),
    SIGLA_UF = as.factor(SIGLA_UF),
    SIGLA_UE = as.factor(SIGLA_UE),
    COD_SITUACAO_CANDIDATURA = as.factor(COD_SITUACAO_CANDIDATURA),
    SIGLA_PARTIDO = as.factor(SIGLA_PARTIDO)
  )
  
saveRDS(candidatos, file = '../data/candidatos.RData',  compress = 'bzip2')

###############################
# BENS DOS CANDIDATOS EM 2012 #
###############################

cnames <- c('DATA_GERACAO', 'HORA_GERACAO', 'ANO_ELEICAO', 'DESCRICAO_ELEICAO',
            'SIGLA_UF', 'SQ_CANDIDATO', 'CD_TIPO_BEM_CANDIDATO',
            'DS_TIPO_BEM_CANDIDATO', 'DETALHE_BEM', 'VALOR_BEM',
            'DATA_ULTIMA_ATUALIZACAO', 'HORA_ULTIMA_ATUALIZACAO')

cclasses <- c(rep('character', 2), 'integer', rep('character', 2), 'integer64', 
              # CD_TIPO_BEM_CANDIDATO
              'integer', rep('character', 2), 'numeric', rep('character', 2))

bens_2012 <- fread('../raw_data/bens_candidatos_2012.csv', header = FALSE, sep = ';',
                   stringsAsFactors = FALSE, dec = ',', data.table = F,
                   col.names = cnames, colClasses = cclasses)

bens_2016 <- fread('../raw_data/bens_candidatos_2016.csv', header = FALSE, sep = ';',
                   stringsAsFactors = FALSE, dec = ',', data.table = F,
                   col.names = cnames, colClasses = cclasses)

bens <- rbind(bens_2012, bens_2016) %>%
  mutate(
    DATA_GERACAO = as.Date(DATA_GERACAO, format='%d/%m/%Y'),
    HORA_GERACAO = as.POSIXct(HORA_GERACAO, format = '%H:%M:%S'),
    ANO_ELEICAO = as.factor(ANO_ELEICAO),
    SIGLA_UF = as.factor(SIGLA_UF),
    DATA_ULTIMA_ATUALIZACAO = as.Date(DATA_ULTIMA_ATUALIZACAO, format = '%d/%m/%Y'),
    HORA_ULTIMA_ATUALIZACAO = as.POSIXct(HORA_ULTIMA_ATUALIZACAO, format = '%H:%M:%S')
  )

rm(bens_2012, bens_2016)

saveRDS(bens, file = '../data/bens_candidatos.RData', compress = 'bzip2')

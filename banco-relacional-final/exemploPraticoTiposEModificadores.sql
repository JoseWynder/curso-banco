
EXEMPLO PRÁTICO TIPOS DE DADOS E MODIFICADORES: --------------------

-- Passo 1: Criação de banco de dados e tabela

-- Cria um novo banco de dados chamado 'exemplo_tipos_dados'
CREATE DATABASE exemplo_tipos_dados;

-- Seleciona o banco de dados 'exemplo_tipos_dados' para uso
USE exemplo_tipos_dados;

-- Cria uma nova tabela chamada 'tipos_dados' com diferentes tipos de dados e modificadores
CREATE TABLE tipos_dados (
    -- Tipos de dados numéricos
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Coluna 'id' do tipo INT, auto incremento e chave primária
    numero_pequeno TINYINT UNSIGNED NOT NULL,    -- Coluna 'numero_pequeno' do tipo TINYINT, não nulo e sem sinal
    numero_medio MEDIUMINT NOT NULL,             -- Coluna 'numero_medio' do tipo MEDIUMINT, não nulo
    numero_grande BIGINT,                        -- Coluna 'numero_grande' do tipo BIGINT
    ponto_flutuante FLOAT,                       -- Coluna 'ponto_flutuante' do tipo FLOAT
    numero_decimal DECIMAL(10, 2),               -- Coluna 'numero_decimal' do tipo DECIMAL com precisão de 10,2

    -- Tipos de dados de data e hora
    data DATE NOT NULL,                          -- Coluna 'data' do tipo DATE, não nulo
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Coluna 'data_hora' do tipo TIMESTAMP com valor padrão de data e hora atual
    tempo TIME,                                  -- Coluna 'tempo' do tipo TIME

    -- Tipos de dados de string
    nome VARCHAR(100) NOT NULL,                  -- Coluna 'nome' do tipo VARCHAR, não nulo
    descricao TEXT,                              -- Coluna 'descricao' do tipo TEXT
    comentario LONGTEXT,                         -- Coluna 'comentario' do tipo LONGTEXT
    binario BLOB,                                -- Coluna 'binario' do tipo BLOB

    -- Tipos de dados de enumeração e conjunto
    status ENUM('ativo', 'inativo') NOT NULL,    -- Coluna 'status' do tipo ENUM, não nulo
    opcoes SET('opcao1', 'opcao2', 'opcao3')     -- Coluna 'opcoes' do tipo SET
);

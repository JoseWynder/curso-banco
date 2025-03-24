
EXEMPLO PRÁTICO DDL: -----------------------------------------------

-- Passo 1: Criação de banco de dados e tabela

-- Cria um novo banco de dados chamado 'exemplo_ddl'
CREATE DATABASE exemplo_ddl;

-- Seleciona o banco de dados 'exemplo_ddl' para uso
USE exemplo_ddl;

-- Cria uma nova tabela chamada 'clientes' com as colunas especificadas
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna 'id' com auto incremento e chave primária
    nome VARCHAR(100) NOT NULL,         -- Coluna 'nome' do tipo VARCHAR, não nula
    email VARCHAR(100),                 -- Coluna 'email' do tipo VARCHAR
    data_registro DATE                  -- Coluna 'data_registro' do tipo DATE
);

-- Passo 2: Modificação de tabela

-- Adiciona uma nova coluna 'telefone' à tabela 'clientes'
ALTER TABLE clientes ADD telefone VARCHAR(20);

-- Modifica a coluna 'email' para ser NOT NULL
ALTER TABLE clientes MODIFY email VARCHAR(100) NOT NULL;

-- Renomeia a coluna 'data_registro' para 'data_cadastro'
ALTER TABLE clientes CHANGE data_registro data_cadastro DATE;

-- Passo 3: Exclusão de dados

-- Remove todos os dados da tabela 'clientes', mas mantém a estrutura da tabela
TRUNCATE TABLE clientes;

-- Passo 4: Exclusão de tabela e banco de dados

-- Remove a tabela 'clientes' do banco de dados
DROP TABLE clientes;

-- Remove o banco de dados 'exemplo_ddl'
DROP DATABASE exemplo_ddl;

-- Passo 5: Renomeação de tabela

-- Cria o banco de dados e tabela novamente para demonstrar o RENAME
CREATE DATABASE exemplo_ddl;
USE exemplo_ddl;
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_cadastro DATE
);

-- Renomeia a tabela 'clientes' para 'clientes_antigos'
RENAME TABLE clientes TO clientes_antigos;

EXEMPLO PRÁTICO DML: -----------------------------------------------

-- Passo 1: Criação de banco de dados e tabela

-- Cria um novo banco de dados chamado 'exemplo_dml'
CREATE DATABASE exemplo_dml;

-- Seleciona o banco de dados 'exemplo_dml' para uso
USE exemplo_dml;

-- Cria uma nova tabela chamada 'clientes' com as colunas especificadas
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Coluna 'id' com auto incremento e chave primária
    nome VARCHAR(100) NOT NULL,         -- Coluna 'nome' do tipo VARCHAR, não nula
    email VARCHAR(100) NOT NULL,        -- Coluna 'email' do tipo VARCHAR, não nula
    telefone VARCHAR(20),               -- Coluna 'telefone' do tipo VARCHAR
    data_cadastro DATE                  -- Coluna 'data_cadastro' do tipo DATE
);

-- Passo 2: Inserção de dados

-- Insere um novo registro na tabela 'clientes'
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES ('João Silva', 'joao.silva@example.com', '1234-5678', '2024-09-26');

-- Insere outro registro na tabela 'clientes'
INSERT INTO clientes (nome, email, telefone, data_cadastro)
VALUES ('Maria Oliveira', 'maria.oliveira@example.com', '8765-4321', '2024-09-25');

-- Passo 3: Atualização de dados

-- Atualiza o telefone do cliente com id 1
UPDATE clientes
SET telefone = '9999-9999'
WHERE id = 1;

-- Passo 4: Seleção de dados

-- Seleciona todos os dados da tabela 'clientes'
SELECT * FROM clientes;

-- Seleciona apenas os nomes e emails dos clientes
SELECT nome, email FROM clientes;

-- Seleciona os dados dos clientes cadastrados após uma data específica
SELECT * FROM clientes
WHERE data_cadastro > '2024-09-25';

-- Passo 5: Exclusão de dados

-- Exclui o cliente com id 2
DELETE FROM clientes
WHERE id = 2;

-- Exclui todos os registros da tabela 'clientes'
DELETE FROM clientes;
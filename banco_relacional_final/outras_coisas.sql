  
  EXEMPLO PRÁTICO OUTRAS COISAS: -----------------------------------
  
  select est.`nome` from estados est where sigla = "MA"
  -- Colocando alias(apelido) em "estados".

select
    regiao as 'Região', -- Define o nome que ira aparecer na tabela.
    sum(populacao) as Total -- Realiza a soma e define o nome.
from estados
group by regiao -- agrupa os dados por regiao.
order by Total desc -- Ordernando de forma decrescente.
    -- Se fosse só order by, seria de forma crescente.

select
    avg(populacao) as Total -- Faz a média entre o total da população.
from estados

select * from cidades c inner join prefeitos p on c.id = p.cidade_id;        -- Filtrando somente a interseção.
select * from cidades c left outer join prefeitos p on c.id = p.cidade_id;   -- Filtrando quem esta na esquerda e a interseção.
select * from cidades c right join prefeitos p on c.id = p.cidade_id;        -- Filtrando quem esta na direita e a interseção.

 -- select * from cidades c full join prefeitos p on c.id = p.cidade_id; -- Não existe full Join no MySQL.

select * from cidades c left outer join prefeitos p on c.id = p.cidade_id
union -- Forma de simular o full join.
-- union all -- Também realiza o full join mas não filtra elementos repetidos.
select * from cidades c right join prefeitos p on c.id = p.cidade_id;


CREATE TABLE IF NOT EXISTS teste ( -- Criando se não existir.
     id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
DROP TABLE IF EXISTS teste; -- Excluindo se existir.


INSERT INTO cidades 
    (nome, area, estado_id)
VALUES (
    'Caruaru', 
    920.6, 
    (select id from estados where sigla = 'PE') -- Colocando uma sentença de código como valor do atributo.
)

SELECT * FROM pessoas WHERE nome like 'A%' -- Verifica a presença de um ou mais valores.


-- Formas de utilizar INSERT INTO IF NOT EXISTS

-- 1. Usando INSERT INTO ... ON DUPLICATE KEY UPDATE

INSERT INTO your_table (column1, column2, ...)
VALUES (value1, value2, ...)
ON DUPLICATE KEY UPDATE column1 = column1;

-- 2. Usando INSERT IGNORE

INSERT IGNORE INTO your_table (column1, column2, ...)
VALUES (value1, value2, ...);

-- 3. Usando uma Subconsulta com NOT EXISTS

INSERT INTO your_table (column1, column2, ...)
SELECT value1, value2, ...
FROM dual
WHERE NOT EXISTS (SELECT 1 FROM your_table WHERE column1 = value1);

select * from cidades limit 4 offser 3; -- Coletando somente 4 elementos após os 3 primeiros.

CREATE TABLE funcionarios (
    id INT PRIMARY KEY, -- Define a chave primária.
    email VARCHAR(100) UNIQUE, -- Garante que o email não seja duplicado.
    salario DECIMAL(10, 2) CHECK (salario > 0) -- Restrição que garante que o salário seja positivo.
);

CREATE TABLE funcionarios (
    id INT PRIMARY KEY COMMENT 'Identificador único do funcionário',
    nome VARCHAR(100) COMMENT 'Nome completo do funcionário',
    salario DECIMAL(10, 2) COMMENT 'Salário atual do funcionário em reais'
);  -- Esses comentários são armazenados no banco de dados e podem ser visualizados posteriormente,
    --  ajudando na documentação do esquema.

CREATE TABLE funcionarios (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    departamento_id INT,
    CONSTRAINT fk_departamento -- Define a chave estrangeira com um nome específico.
    FOREIGN KEY (departamento_id) -- Coluna que será a chave estrangeira.
    REFERENCES departamentos(id) -- Define a tabela e coluna que será referenciada.
);

SELECT nome, salario
FROM funcionarios
WHERE salario NOT BETWEEN 2000 AND 5000; -- Filtra os funcionários cujo salário NÃO está entre 2000 e 5000.
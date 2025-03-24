/*
SGBD = Sistema Gerenciador de Banco de Dados
-> ORACLE
-> MySQL

MySQL utiliza a linguagem SQL(Structured Query Language). Linguagem de consultas estruturadas.
Todos esses bancos utilizam. Com variações entre eles, mas, com a sintaxe muito semelhante.
Tendo uma ou outra funcionalidade a mais, abordando alguns processos de forma ligeiramente
 diferente, mas em essência todos são bem parecidos.

MySQL é um banco relacional.
Um banco relacional é um banco que tem esquema, o esquema de um banco de dados
 é a definição de como os dados serão armazenados. As restrições, regras...

MySQL é um servidor gratuito e super popular.
SQL é uma linguagem descritiva.
SQL não é case-sensitive.
Cuidado com atualizações e exclusão de dados. Atento as condicionais.

Conceitos:

Modelo Entidade/Relacionamento
É o modelo do banco de dados, é o paradigma no qual se baseia o banco de dados.

---------------------------------------------------------------------------------------------

ENTIDADE

A entidade seria a tabela. Os dados são armazenados de forma tabular,
 colunas e linhas/tuplas.

Cada coluna tem um tipo e as tuplas representam os dados da tabela.
Esse dado tem que estar aderente as restrições impostas pelo sistema.
Diferente por exemplo, do banco MongoDB que é um banco sem esquema.
Em um banco sem esquema você não tem esse conceito de coluna,
 você não tem que obrigatoriamente atender aos requisitos de cada coluna.
Você pode inclusive ter dados variáveis, por exemplo, ao armazenar um carro
 em um banco não relacional(NoSQL), um carro pode ter placa e outro não ter,
 um pode ter marca e outro não ter, um pode ter um atributo que somente ele tem.

Via de regra você não armazena vídeos ou imagens dentro de banco de dados,
 você procura armazenar isso em outros mecanismos,
  no banco você armazena o endereço onde ele está.

----------------------------------------------------------------

CHAVE PRIMÁRIA (PK)

* Única - A chave primária é unica dentro de uma tabela.
A chave primária é uma coluna de uma tabela.
Não obrigatóriamente uma coluna que só aceita dados únicos é uma chave primária,
 mas, toda chave primária é única.
* Não vazia.
* Não muda - Ou seja, se você for colocar um valor como chave primária
 que tem a possíbilidade de mudar, ele não pode ser a chave primária.
Mudar uma chave primária é possível, mas muito trabalhoso.

Tem duas possíveis formas para trabalhar com colunas que são chave primária:

Surrogate Key - Chave sintética, artificial. Ou seja, a coluna de código foi gerada
 artificíalmente com valores que não tem nenhuma significado para o usuário.

Natural Key - Por exemplo, você poderia pegar o CPF mais o emissor do RG do cliente e
 utilizar como uma chave primária de 2 colunas. Pegar algo da vida da pessoa.
Porém, tem que ter um cuidado por que se na hora de cadastrar ocorrer algum tipo de erro e o
 CPF da Maria for trocado pelo do João, levando em consideração a dificuldade de mudar uma PK,
 acabaria causando muita dor de cabeça.
Por isso, via de regra, acabasse utilizando uma Surrogate Key como chave primária.

A chave primária vai servir para gerar relacionamentos dentro do banco de dados.
Além também de servir para realizar pesquisas no banco de dados rapidamente.
Já que é criado estruturas(índices) que a partir dessas estruturas você
 consegue rapidamente localizar uma única tupla dentro do banco de dados.

constraints = restrições

---------------------------------------------------------------------------------------------

RELACIONAMENTO

Não exite relação bidirecional.

----------------------------------------------------------------

Relação 1 para muitos. MÃE -|---< FILHO
Uma mãe pode ter muitos filhos mas um filho só pode ter uma mãe.

A chave primária da tabela 1 vai como chave estrangeira(FK) para a tabela muitos.
 Gerando uma outra coluna.

      TABELA MÃE                                 TABELA FILHO      
----------+----------+                 +---------+----------+---------+
    COD   |   NOME   |                 |   COD   |   NOME   | MAE_COD |
----------+----------|                 |---------+----------+---------|
     1    |   ANA    |                 |    1    |   JOÃO   |    1    |
     2    |   BIA    |                 |    2    |   GUI    |    2    |
----------+----------+                 |    3    |   JÚLIA  |    1    |
                                       +---------+----------+---------+
A Bia é mãe do Gui.
A Ana é mãe do João e da Júlia.

Caso você queira apagar a Ana você também terá que apagar os seus filhos.
Ou caso o campo "MAE_COD" aceite valor nulo, você pode definir como nulo e dessa forma
 seria possível apagar a Ana sem necessariamente apagar o João e a Júlia.
Mas, não é possível apagar um registro sem apagar suas relações.
Como o banco de dados relacional tem esquema, ocorre uma validação que
 não permite inconsistência nos dados.

----------------------------------------------------------------

Relação 1 para 1. MARIDO -|---|- ESPOSA
Um marido só pode ter uma esposa e uma esposa só pode ter um marido.

Nesse caso, você tem a opção de escolher como realizar a relação.
Ou criando uma coluna em marido que referêncie a esposa
 ou uma coluna na esposa que referêncie o marido.
Funcionando da mesma forma que no relacionamento 1 para muitos.
Porém, a FK não pode existir repetição, já que é um relacionamento 1 para 1.
Ela teria que ser única(UNIQUE).
Uma ou outra, nunca crie uma tabela em cada! Não existe relação bidirecional!
A escolha será definida de acordo com a necessidade.
Caso você precise acessar o marido a partir da esposa ou a esposa a partir do marido.
Você precisa acessar o prefeito a partir da cidade ou a cidade a partir do prefeito?
Caso você crie duas tabelas que tem uma relação 1 para 1,
 você sempre precisaria realizar joins para juntas as tabelas.
 Será que não seria melhor ter esses dados em uma unica tabela?
 Por isso sempre se faça essa pergunta ao criar uma relação 1 para 1.

----------------------------------------------------------------

Relação muitos para muitos. TIO >---< SOBRINHO
Um tio pode ter muitos sobrinhos e um sobrinho pode ter muitos tios.

Nesse caso, imaginando uma tabela de 3 tuplas representando os tio
 e outra representando os sobinhos, criar uma coluna para representar a chave estrangeira
 não irá funcionar.
O que se faz é criar uma outra tabela intermediária.


         TIO                          TIO_SOB                         SOBRINHO      
----------+----------+         +---------+----------+          +---------+----------+
    COD   |   NOME   |         | TIO_ID  |  SOB_ID  |          |   COD   |   NOME   |
----------+----------|         |---------+----------+          |---------+----------+
     1    |   -----  |         |    -    |     -    |          |    1    |   ----   |
     2    |   ---    |         |    -    |     -    |          |    2    |   ---    |
     3    |   ----   |         |    -    |     -    |          |    3    |   -----  |
----------+----------+         |    -    |     -    |          +---------+----------+
                               |    -    |     -    |
                               |    -    |     -    |
                               +---------+----------+

Essa tabela contém como chave estrangeira a chave primária da
 tabela sobrinho e também da tabela tio.
Podendo haver repetição em TIO_ID e em SOB_ID, mas, no par TIO_ID + SOB_ID não.
Essas 2 FK formam a PK da tabela TIO_SOB.
A partir de 2 relações 1 para muitos você consegue simular uma relação muitos para muitos.
Nada impede você de ter outros atributos(colunas) na tabela TIO_SOB.

TIO -N-----N- SOB
 |             |
 -             -
 |-< TIO_SOB >-|

Não há uma relação direta entre tio e sobrinho.
*/

---------------------------------------------------------------------------------------------

/*

SQL(Structured Query Language) - Linguagem de consultas estruturadas.
É divida em 4 partes.

----------------------------------------------------------------

DML(Data Manipulation Language) - Linguagem de Manipulação de Dados.

Isso é o que chamamos de CRUD. As operações de cadastro.


SELECT: Usado para consultar dados de uma ou mais tabelas.
SELECT * FROM nome_da_tabela;

INSERT: Usado para inserir novos registros em uma tabela.
INSERT INTO nome_da_tabela (coluna1, coluna2, ...) VALUES (valor1, valor2, ...);

UPDATE: Usado para atualizar registros existentes em uma tabela.
UPDATE nome_da_tabela SET coluna1 = valor1, coluna2 = valor2 WHERE condição;

DELETE: Usado para deletar registros de uma tabela.
DELETE FROM nome_da_tabela WHERE condição;


----------------------------------------------------------------

DDL(Data Definition Language) - Linguagem de Definição de Dados.

Aqui é onde você vai definir o esquema do banco de dados.
 Criar as estruturas para utilizar o DML.


CREATE DATABASE: Usado para criar um novo banco de dados.
CREATE DATABASE nome_do_banco;

DROP DATABASE: Usado para deletar um banco de dados existente.
DROP DATABASE nome_do_banco;

CREATE TABLE: Usado para criar uma nova tabela.
CREATE TABLE nome_da_tabela (
    coluna1 tipo_de_dado,
    coluna2 tipo_de_dado,
    ...
);

ALTER TABLE: Usado para modificar uma tabela existente, adicionando,
 removendo ou alterando colunas.
ALTER TABLE nome_da_tabela ADD coluna_nova tipo_de_dado;
ALTER TABLE nome_da_tabela DROP COLUMN coluna_existente;
ALTER TABLE nome_da_tabela MODIFY COLUMN coluna_existente tipo_de_dado;

DROP TABLE: Usado para deletar uma tabela existente.
DROP TABLE nome_da_tabela;


----------------------------------------------------------------

DCL(Data Control Language) - Linguagem de Controle de Dados.

A parte de dar acesso ou não ao usuário, a questão de segurança, é a DCL que faz.


GRANT: Usado para conceder permissões a usuários.
GRANT ALL PRIVILEGES ON nome_do_banco.* TO 'usuario'@'localhost';

REVOKE: Usado para revogar permissões de usuários.
REVOKE ALL PRIVILEGES ON nome_do_banco.* FROM 'usuario'@'localhost';


----------------------------------------------------------------

TCL(Transaction Control Language) - Linguagem de Controle de Transações.

Quando ocorre várias operações no banco de dados de uma vez só.
Imagine a situação de uma transferência do dinheiro de uma conta em um banco para outra.
Isso envolve 2 processos(updates), retirar o saldo da conta A e acrescentar na conta B.
Se o primeiro update dá certo e o segundo não, o banco ganha dinheiro.
Se o primeiro não dá certo mas o segundo sim, o banco perde dinheiro.
Então, essa é uma situação em que você precisa garantir que
 todas deem certo ou nada será feito.

BEGIN: Inicia uma nova transação.
BEGIN; ou START TRANSACTION;

COMMIT: Usado para salvar todas as alterações feitas durante a transação atual.
COMMIT;

ROLLBACK: Usado para desfazer todas as alterações feitas durante a transação atual.
ROLLBACK;

SAVEPOINT: Usado para definir um ponto de salvamento dentro de uma transação.
SAVEPOINT nome_do_savepoint;

RELEASE SAVEPOINT: Usado para remover um ponto de salvamento.
RELEASE SAVEPOINT nome_do_savepoint;


----------------------------------------------------------------

COMANDOS ÚTEIS:


DESCRIBE: Usado para descrever a estrutura de uma tabela.
DESCRIBE nome_da_tabela;

SHOW DATABASES: Usado para listar todos os bancos de dados.
SHOW DATABASES;

SHOW TABLES: Usado para listar todas as tabelas de um banco de dados.
SHOW TABLES;

USE: Usado para selecionar um banco de dados específico para ser usado.
USE nome_do_banco;

---------------------------------------------------------------------------------------------


TIPOS DE DADOS


Tipos de dados numéricos -------------------------------------------------------


INTEIROS

TINYINT:
 Intervalo de -128 a 127 (ou 0 a 255 se UNSIGNED).

SMALLINT:
 Intervalo de -32,768 a 32,767 (ou 0 a 65,535 se UNSIGNED).

MEDIUMINT:
 Intervalo de -8,388,608 a 8,388,607 (ou 0 a 16,777,215 se UNSIGNED).

INT ou INTEGER:
 Intervalo de -2,147,483,648 a 2,147,483,647 (ou 0 a 4,294,967,295 se UNSIGNED).

BIGINT:
 Intervalo de -9,223,372,036,854,775,808 a 9,223,372,036,854,775,807
  (ou 0 a 18,446,744,073,709,551,615 se UNSIGNED).

----------------------------------------------------------------

PONTO FLUTUANTE

FLOAT:
 Número de ponto flutuante de precisão simples.

DOUBLE:
 Número de ponto flutuante de precisão dupla.

DECIMAL ou NUMERIC:
 Número exato de ponto fixo, especificando precisão e escala.


Tipos de Dados de String (Caracteres) -------------------------------------------


CARACTERE

CHAR(M):
 Cadeia de caracteres de comprimento fixo (1 a 255).

VARCHAR(M):
 Cadeia de caracteres de comprimento variável (1 a 65,535).

----------------------------------------------------------------

TEXTO

TINYTEXT:
 Cadeia de texto com comprimento máximo de 255 caracteres.

TEXT:
 Cadeia de texto com comprimento máximo de 65,535 caracteres.

MEDIUMTEXT:
 Cadeia de texto com comprimento máximo de 16,777,215 caracteres.

LONGTEXT:
 Cadeia de texto com comprimento máximo de 4,294,967,295 caracteres.

----------------------------------------------------------------

BINÁRIO

BINARY(M):
 Cadeia de bytes de comprimento fixo.

VARBINARY(M):
 Cadeia de bytes de comprimento variável.

TINYBLOB:
 Cadeia de bytes binários com comprimento máximo de 255 bytes.

BLOB:
 Cadeia de bytes binários com comprimento máximo de 65,535 bytes.

MEDIUMBLOB:
 Cadeia de bytes binários com comprimento máximo de 16,777,215 bytes.

LONGBLOB:
 Cadeia de bytes binários com comprimento máximo de 4,294,967,295 bytes.


OUTROS -------------------------------------------------------------------------


ENUM:
 Enumerado, uma lista de valores predefinidos.

SET:
 Conjunto, uma coleção de valores predefinidos.


Tipos de Dados de Data e Hora --------------------------------------------------


DATA E HORA

DATE:
 Data no formato 'YYYY-MM-DD'.

DATETIME:
 Combinação de data e hora no formato 'YYYY-MM-DD HH:MM'.

TIMESTAMP:
 Carimbo de data e hora no formato 'YYYY-MM-DD HH:MM',
  armazena a data e hora atual por padrão.

TIME:
 Hora no formato 'HH:MM'.

YEAR:
 Ano no formato 'YYYY'.


---------------------------------------------------------------------------------------------


Modificadores de Colunas


INT UNSIGNED
Indica que a coluna só pode armazenar valores positivos.
 Este modificador é aplicável a tipos de dados numéricos.

VARCHAR(255) NOT NULL
Indica que a coluna não pode conter valores nulos.
 Ou seja, um valor deve ser sempre fornecido para esta coluna.

VARCHAR(255) NULL
Permite que a coluna contenha valores nulos. Este é o comportamento padrão,
 então normalmente não é necessário especificar este modificador explicitamente.

INT UNSIGNED AUTO_INCREMENT
Indica que o valor da coluna será incrementado automaticamente para cada
 novo registro inserido. Geralmente utilizado com a chave primária.

PRIMARY KEY (id)
Define uma ou mais colunas como chave primária da tabela.
 A chave primária deve ser única e não pode conter valores nulos.

UNIQUE (email)
Garante que todos os valores na coluna ou combinação de colunas sejam únicos.

TIMESTAMP DEFAULT CURRENT_TIMESTAMP
Define um valor padrão para a coluna,
 que será usado se nenhum valor for especificado durante a inserção.

TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
Usado para atualizar automaticamente o valor de uma coluna sempre
 que o registro é atualizado. Comumente usado com colunas do tipo TIMESTAMP.

FOREIGN KEY (category_id) REFERENCES categories(id)
Define uma ou mais colunas como chave estrangeira, que cria um vínculo entre tabelas.

age INT CHECK (age >= 18)
Define uma condição que os valores da coluna devem satisfazer.


---------------------------------------------------------------------------------------------


*/
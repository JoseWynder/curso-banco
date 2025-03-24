
EXEMPLO PRÁTICO DCL: -----------------------------------------------

-- Passo 1: Criação de banco de dados e usuários

-- Cria um novo banco de dados chamado 'exemplo_dcl'
CREATE DATABASE exemplo_dcl;

-- Cria um novo usuário 'usuario1' com a senha 'senha123'
CREATE USER 'usuario1'@'localhost' IDENTIFIED BY 'senha123';

-- Cria um novo usuário 'usuario2' com a senha 'senha456'
CREATE USER 'usuario2'@'localhost' IDENTIFIED BY 'senha456';

-- Passo 2: Concessão de privilégios

-- Concede privilégios de SELECT e INSERT no banco de dados 'exemplo_dcl' para o usuário 'usuario1'
GRANT SELECT, INSERT ON exemplo_dcl.* TO 'usuario1'@'localhost';

-- Concede todos os privilégios no banco de dados 'exemplo_dcl' para o usuário 'usuario2'
GRANT ALL PRIVILEGES ON exemplo_dcl.* TO 'usuario2'@'localhost';

-- Passo 3: Revogação de privilégios

-- Revoga o privilégio de INSERT do usuário 'usuario1' no banco de dados 'exemplo_dcl'
REVOKE INSERT ON exemplo_dcl.* FROM 'usuario1'@'localhost';

-- Revoga todos os privilégios do usuário 'usuario2' no banco de dados 'exemplo_dcl'
REVOKE ALL PRIVILEGES ON exemplo_dcl.* FROM 'usuario2'@'localhost';
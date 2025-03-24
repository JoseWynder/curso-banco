
EXEMPLO PRÁTICO TCL: -----------------------------------------------

-- Inicia uma nova transação
START TRANSACTION;

-- Define um ponto de salvamento
SAVEPOINT sp1;

-- Executa algumas operações de banco de dados
INSERT INTO accounts (account_number, balance) VALUES (12345, 1000);

-- Define outro ponto de salvamento
SAVEPOINT sp2;

-- Executa mais algumas operações
UPDATE accounts SET balance = balance - 100 WHERE account_number = 12345;

-- Reverte para o ponto de salvamento sp1, desfazendo a última operação
ROLLBACK TO SAVEPOINT sp1;

-- Confirma a transação
COMMIT;
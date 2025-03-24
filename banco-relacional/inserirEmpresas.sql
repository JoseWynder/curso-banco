ALTER TABLE empresas MODIFY cnpj VARCHAR(14);

INSERT INTO empresas 
    (nome, cnpj)
VALUES
    ('Bradesco', 52431726451980), 
    ('Vale', 46536782019211), 
    ('Cielo', 0236218920132);


desc empresas;
desc prefeitos;
select * from empresas;
select * from cidades;

INSERT INTO empresas_unidades
    (empresa_id, cidade_id,sede)
VALUES
    (1, 1, 1), 
    (1, 2, 0), 
    (2, 1, 0), 
    (2, 2, 1);
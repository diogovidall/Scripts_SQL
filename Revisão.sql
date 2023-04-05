-- CREATE DATABASE/USE
-- CREATE TABLE/ INSERT INTO/ SELECT/ UPDATE
-- DROP
-- ALTER TABLE

-- UTILIZAR O BANCO DE DADOS
USE sptechb;

-- CRIAR A TABELA PESSOA
CREATE TABLE pessoa (
id INT PRIMARY KEY auto_increment,
nome VARCHAR (50) not null,
peso FLOAT, 
altura FLOAT,
salario DECIMAL(10,2)
);

-- Tipagem Numérica
-- Decimais
-- FLOAT 7 DIGITOS 12345,67
-- DOUBLE 15 DÍGITOS 1234567890123,45
-- Tipos de decimais:
-- DECIMAL (TOTAL, QUANTIDADES DE DIGITOS APOS A VIRGULA)
-- DECIMAL 32 DÍGITOS
-- DECIMAL (5,2) 123,45
-- DECIMAL (3,1) 12,3
-- DECIMAL (7,4) 123,4567

INSERT INTO pessoa VALUES
(null, 'Pelé', 78.9, 1.71, 1000),
(null, 'Maradona', 89.9, 1.69, 999.99),
(null, 'Dudu', 82.7, 1.67, 499.99);

SELECT * FROM pessoa;

-- Posso adicionar número negativo?
INSERT INTO pessoa (nome,salario) VALUES
('Tafarel', - 114.98);

-- Atualizar dados
UPDATE pessoa SET salario = 9.99
WHERE id = 4;
SELECT * FROM pessoa;

UPDATE pessoa SET salario = 9.99
WHERE id = 5;

UPDATE pessoa SET salario = 9.99
WHERE id = 6;

SELECT * FROM pessoa;
-- CONFIGURAR O CAMPO PARA INSERIR APENAS NUM >= 0;
-- CONSTRAINT/ CONFIGURAÇÃO DO CAMPO OU RESTRIÇÃoptimize
ALTER TABLE pessoa ADD constraint chkSalario
CHECK (salario >= 0);

-- Revisão ALTER TABLE
-- Adicionando um coluna

ALTER TABLE pessoa ADD COLUMN dtNasc DATE;
DESC pessoa;

-- 'AAAA-MM-DD'
INSERT INTO pessoa (nome, dtNasc) VALUES
('Ronaldo', '1983-12-13');
SELECT * FROM pessoa;

-- Modificando a tipagem
ALTER TABLE pessoa MODIFY nome VARCHAR(80);
DESC pessoa;

-- Renomear um campo
ALTER TABLE pessoa RENAME COLUMN dtNasc TO dataNasc;
DESC pessoa;

-- Exluir um campo da tabela
ALTER TABLE pessoa DROP COLUMN dataNasc;
DESC pessoa;

-- Excluir uma tupla (LINHA) da tabela 
DELETE FROM pessoa WHERE id = 5;
SELECT * FROM pessoa;

DELETE FROM pessoa WHERE id = 6;
DELETE FROM pessoa WHERE id = 7;

SELECT * FROM pessoa;

-- Inserindo automaticamente após exclusão
-- próximo id = 6
INSERT INTO pessoa (nome, salario) VALUES
('Baggio', 1.99);
SELECT * FROM pessoa;

-- Comeca com tal letra 'letra%'
-- Segunda letra '_letra%'
-- antepenultima '%letra__'
-- penultima '%letra_'

-- Exibir as pessoas com valor diferente 
SELECT * FROM pessoa WHERE peso != 78.9;

-- Exibir s pessoas com valor menor
SELECT * FROM pessoa WHERE altura <1.71;
 
-- Exibir s pessoas com valor maior
SELECT * FROM pessoa WHERE altura > 1.69;

-- Escolher linhas especificas
SELECT * FROM pessoa WHERE nome IN  ('Maradona', 'Pelé');

-- saber salario entre um e outro
SELECT * FROM pessoa WHERE salario BETWEEN 9.99 AND 999.99;


-- Pode usar o constraint no create table 
CREATE TABLE musica (
id int primary key auto_increment,
nome VARCHAR(50),
genero VARCHAR(100), constraint chkGenero CHECK (genero IN ('Rock','Sertanejo'))
)auto_increment = 100;

INSERT INTO musica (nome, genero) VALUES
('Exemplo 1', 'Rock'),
('Exemplo 2', 'Rock');

SELECT * FROM musica;
TRUNCATE TABLE musica;

DROP TABLE musica;


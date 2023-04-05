-- Exercicio 1
CREATE DATABASE PetShop;
USE PetShop;


CREATE TABLE cliente (
idCliente INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
Sobrenome VARCHAR(45),
tel_fixo CHAR(12),
tel_celular CHAR(13),
endereco VARCHAR(45)
);


CREATE TABLE pet (
idPet INT PRIMARY KEY auto_increment,
nome VARCHAR(45),
tipo VARCHAR(45),
raca VARCHAR(45),
dtNasc DATE,
fkCliente INT,
FOREIGN KEY (fkCliente) references cliente(idCliente)
)auto_increment = 101;

INSERT INTO cliente VALUES
(default, 'Diogo', 'Vidal', '(96)22157832', '(92)986174908', '13057-043'),
(default, 'Abraão', 'Vidal', '(68)28433551', '(41)985166303', '15077-328'),
(default, 'Carlos', 'Monteiro', '(61)30146478', '(61)987647661', '04058-050');

select * from cliente;

INSERT INTO pet VALUES 
(null, 'Tico', 'Pássaro', 'Calopsita', '2021-04-06', 1),
(null, 'Iza', 'Cachoro', 'Border Colle', '2020-03-09', 2),
(null, 'Nala', 'Gato', 'Siames', '2019-02-12', 3);

select * from pet;

alter table cliente modify column nome varchar(50);

select * from pet where tipo = 'Gato';

select nome, dtNasc from pet;

select * from pet order by nome desc;

select * from pet where nome like 'T%';

select * from cliente where sobrenome = ('Vidal');

update cliente set tel_celular = '(63)988848483' 
where idCliente = 2;

select * from cliente;

select * from pet join cliente on fkCliente = idCliente;

select * from pet join cliente on fkCliente = idCliente
where idCliente = 1;

delete from pet where idPet = 104;
select * from pet;

DROP TABLE pet;
DROP TABLE cliente;

-- Exercicio 2
Create Table pessoa(
idPessoa Int Primary Key Auto_increment,
nome Varchar(45) Not Null,
dtNasc Date Not Null,
profissao Varchar(45)
);

Create Table gasto (
idGasto Int Primary Key auto_increment,
data_gasto Date,
valor_gastado Varchar(100) default 'Nenhum valor foi gasto',
descricao Varchar(45),
fkPessoa Int,
Foreign Key (fkPessoa) References pessoa (idPessoa)
) auto_increment = 100;

Insert Into pessoa values
(null, 'Diogo', '2003-02-07', 'Analista de Dados (SQL)'),
(null, 'Abraão', '1994-02-03', 'Back-End Developer'),
(null, 'Carlos', '1990-10-07', 'Gestor de TI');

Insert Into gasto Values
(null, '2023-03-02', 'R$100', 'Carrefour', 1),
(null, '2022-05-04', 'R$500', 'Renner', 2),
(null, '2021-06-08', 'R$1000', 'Eventim', 3);

Select * From pessoa;
Select * From gasto;
Select nome, profissao From pessoa;
Select data_gasto, descricao From Gasto;
Select * from Pessoa join gasto;	
Select * From Pessoa join gasto on fkPessoa = idPessoa
where idPessoa = 1;
Update Pessoa Set profissao = 'Professor de Banco de Dados' 
Where idPessoa = 1;
Delete from gasto where idGasto = 101;

Drop Table gasto;
Drop Table pessoa;



-- Exercicio 3
Create Database PraticaFuncionario;
Use PraticaFuncionario;


Create table setor (
idNumero Int Primary Key auto_increment,
nome_setor Varchar(30) Not null,
numero_andar Char(2) Not null
);

Create Table Funcionario (
idFuncionario Int Primary Key auto_increment,
nome_funcionario Varchar(45) Not null,
telefone_contato Varchar(15) Not null,
salario_funcionario Varchar(10) Constraint verificar_salario
 Check  (salario_funcionario > 0), 
fkSetor Int,
Foreign Key (fkSetor) references setor (idNumero)
);


Create Table Acompanhante (
idAcompanhante Int Primary Key auto_increment,
nome_acompanhante Varchar(45) Not null,
tipo_relacao Varchar(20) Not null,
dtNasc Date Not null,
fkFuncionario Int,
Foreign Key (fkFuncionario) references Funcionario(idFuncionario)
);

Insert Into Setor Values
(null, 'Recursos Humanos', '11'),
(null, 'TI', '9');
Select * from Setor;

Insert Into Funcionario Values 
(null, 'Diogo', '(11)988848483', '9000', 2),
(null, 'Luccas', '(11)988358483', '9202', 2),
(null, 'Thiago', '(11)988843583', '8790', 1);
Select * from Funcionario;

Insert Into Acompanhante Values 
(null , 'Jessica', 'Amiga', '2000-03-17', 1),
(null, 'Deborah', 'Amiga', '1999-04-07', 3),
(null, 'Abraão', 'Amigo', '1999-07-02', 2);
Select * from Acompanhante;

Select * from Setor join Funcionario on fkSetor = idNumero;

Select * from Setor Join Funcionario on fkSetor = idNumero
Where nome_setor Like "TI";

Select * from Funcionario join Acompanhante on fkFuncionario = idFuncionario;

Select * from Funcionario join Acompanhante on fkFuncionario = idFuncionario
Where nome_funcionario = 'Diogo';

Select * from Funcionario join Setor join Acompanhante on fkSetor = idNumero 
and FkFuncionario = idFuncionario;

Create Database Campeonato;
Use Campeonato;

Create table treinador (
idTreinador Int Primary key auto_increment,	
nome_treinador Varchar(45) not null,
telefone Varchar(15) not null,
email_treinador Varchar(45) not null,
fkExperiencia Int,
Foreign key (fkExperiencia) References treinador(idTreinador)
)auto_increment = 10;

Insert into treinador values 
(null, 'Diogo', '1194832586', 'diogo920@gmail.com', null),
(null, 'Luccas', '1194852626', 'luccas283@gmail.com', 10),
(null, 'Carlos', '11988125896', 'carlos292@gmail.com', 11),
(null, 'Abraão', '1194267986', 'abraaomarcs@gmail.com', null);

Create Table nadador (
idNadador Int Primary key auto_increment,
nome_nadador Varchar(45) not null,
estado_origem Varchar(35) not null,
dtNasc Date not null,
fkTreinador Int,
Foreign key (fkTreinador) References treinador(idTreinador)
)auto_increment = 100;

Insert into nadador values 
(null, 'Jorge', 'Curitiba-PR', '2000-12-02', 10),
(null, 'Jessica', 'São Paulo-SP', '1999-07-02', 11),
(null, 'Felipe', 'Campo Largo-PR', '2002-08-08', 12),
(null, 'Arthur', 'Curitiba-PR', '1999-01-16', 13);

Select * From treinador;
Select * From nadador;

Select * from treinador join nadador 
on fkTreinador = idTreinador;

Select * from treinador join nadador 
on fkTreinador = idTreinador
Where nome_treinador = 'Diogo';

Select * from treinador 
as treinadores join treinador
as orientadores on orientadores.fkExperiencia = treinadores.idTreinador;

Select * From treinador as treinadores 
Join treinador as orientadores 
on orientadores.fkExperiencia = treinadores.idTreinador 
Where treinadores.nome_treinador = 'Diogo';

Select * From treinador as orientadores
Join treinador as treinadores
On orientadores.fkExperiencia = treinadores.idTreinador
Join nadador
On treinadores.idTreinador = nadador.fkTreinador
Where treinadores.nome_treinador = 'Luccas';

Drop Database campeonato;







 






















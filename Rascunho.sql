create table tbEmpresa (
  idEmpresa int primary key auto_increment,
  nomeEmpresa varchar(60) not null,
  cnpj char(11) not null
) auto_increment = 100;

create table tbUsuario (
  idUsuario int primary key auto_increment,
  nomeUsuario varchar(60) not null,
  senha varchar(60) not null,
  -- Permissão basica: Apenas visualização dos dados;
  -- Permição intermediario: Visualização dos dados, permição para alterar algumas configurações;
  -- Permição total: Permição para realizar todas as ações dentro do sistema, incluindo criar novos usuarios dentro da empresa.
  permissoes varchar(30) constraint chkPermissao check (permissoes in ('basico', 'intermediario', 'total')),
  idEmpresa int
) auto_increment = 1000;

create table tbSensor (
  idSensor int primary key auto_increment,
  tipoSensor varchar(30) constraint chkTipo check (tipoSensor in ('presenca', 'temperatura')),
  dtInstalacao date not null,
  dtValidade date not null,
);

create table tbEntradaSensor (
  idEntrada int primary key auto_increment,
  valorEntrada float not null, -- No caso do sensor de presença será 0 ou 1
  dtEntrada datetime not null,
  idSensor int
);

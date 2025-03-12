create database EcoDrain;
use EcoDrain;

create table rua(
idRua int auto_increment,
cep char(9) not null,
primary key (idRua)
);

create table bueiro (
idBueiro int, -- esse id seria composto por XXYYY, 
-- sendo XX a chave estrangeira da rua e YYY um sequencial.
numeroRua int,
idRua int not null,
espacoTotal decimal(5,2) not null,
primary key (idBueiro),
constraint fk_rua_bueiro foreign key (idRua) references rua(idRua)
on delete cascade on update cascade -- isso aqui só vai utilizar lá para frente
);

create table dados (
idDados int auto_increment,
espacoLivre decimal(5,2) not null,
idBueiro int not null,
datahora datetime not null,
primary key (IdDados),
constraint fk_dados_bueiro foreign key (idBueiro) references bueiro(idBueiro)
on delete cascade on update cascade, -- isso aqui só vai utilizar lá para frente
-- Depois tem que ter uma restrição para impedir que espacoLivre > espacoTotal
-- acho que é essa aqui: CONSTRAINT chk_espaco CHECK (espacoLivre <= (SELECT espacoTotal 
-- FROM bueiro WHERE bueiro.idBueiro = dados.idBueiro)),
key ix_bueiro (idBueiro, datahora),
key ix_data (datahora, idBueiro)
);

create table usuario (
idUsuario int auto_increment,
nome varchar(70),
cpf varchar(15),
cargo varchar(24),
senha varchar(50),
primary key(idUsuario),
constraint chk_cargo check (cargo in('Funcionário Público', 'Funcionário Terceirizado'))
);

INSERT INTO rua (cep) VALUES 
('11111-111'),
('22222-222');

INSERT INTO bueiro (idBueiro, numeroRua, idRua, espacoTotal) VALUES
(01001, 10, 1, 60.00),
(01002, 20, 1, 70.00),
(02001, 15, 2, 55.00),
(02002, 25, 2, 65.00);

INSERT INTO dados (espacoLivre, idBueiro, datahora) VALUES
(30.00, 01001, '2025-03-11 10:10:00'),
(25.00, 01001, '2025-03-11 10:12:00'),
(40.00, 01002, '2025-03-11 10:14:00'),
(35.00, 01002, '2025-03-11 10:16:00'),
(20.00, 02001, '2025-03-11 10:18:00'),
(15.00, 02001, '2025-03-11 10:20:00'),
(50.00, 02002, '2025-03-11 10:22:00'),
(45.00, 02002, '2025-03-11 10:24:00');

INSERT INTO usuario (nome, cpf, cargo, senha) VALUES 
('João Silva', '123.456.789-00', 'Funcionário Público', 'senha123'),
('Maria Oliveira', '987.654.321-00', 'Funcionário Terceirizado', 'senha456');

create database projetoPI;
use projetoPI;



create table bairro
(
endereco varchar(70) unique,
idRua int primary key auto_increment 
);

insert into rua(endereco)
values('rua francisco alarico bergamo'),
('rua pedrinha bonita'),
('rua sales marques'),
('rua tarcilia lopes'),
('rua kelmon mariano');

create table bueiro
(
Tamanho_vazio decimal(4,2), 
idBueiro int primary key auto_increment,
idRua int,
foreign key (idRua) references rua(idRua)
);

select * from bueiro;

insert into bueiro(Tamanho_vazio,idRua)
value('79.12', 1),
('62.02', 2),
('18.02', 2),
('31.35', 3),
('67.02', 3),
('92.03', 4),
('92.03', 4),
('92.03', 5),
('82.32', 5);

create table dados 
(
idDados int primary key auto_increment,
Qtd_vazio decimal(4,2),
idRua int,
idBueiro int,
foreign key(idRua) references rua(idRua),
foreign key(idBueiro) references bueiro(idBueiro)
);

drop table dados;

INSERT INTO dados(Qtd_vazio, idRua, idBueiro)
VALUES 
    ('12.2', 1, 1),
    ('11.6', 2, 2),
    ('09.03', 2, 3), 
    ('03.08', 3, 4), 
    ('07.03', 3, 5), 
    ('09.03', 4, 2), 
    ('09.03', 4, 1), 
    ('04.08', 5, 4),
    ('09.29', 4, 3);
    
    select * from dados;

    create table usuario
    (
        idUsuario int primary key auto_increment,
        nome varchar(50) not null,
        email varchar(60) not null,
        telefone varchar(14) not null
    );

    insert into usuario(nome,email,telefone)
    values('Gabriela Villegas','gabriela@gmail.com','(11)99393-5924'),
    ('Leticia Pinheiro','letucia@gmail.com','(11)99394-5859'),
    ('Andrey Rodrigues','andrey@hotmail.com','(11)99458-2948'),
    ('Gabriel Moreira','gabriel@gmail.com','(61)92833-2489'),
    ('Isadora Alicia','isadora@oulook.com','(61)92488-2674');
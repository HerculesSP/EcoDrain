create database projetoPI;
use projetoPI;

create table rua
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
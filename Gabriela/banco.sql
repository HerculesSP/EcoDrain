create database projetoPI;
use projetoPI;

create table rua
(
endereço varchar(70) unique,
idRua int primary key auto_increment 
);

create table bueiro
(
Tamanho_vazio decimal(4,2), 
idBueiro int primary key auto_increment,
idRua int,
foreign key (idRua) references rua(idRua)
);

create table dados 
(
Qtd_vazio decimal(4,2),
idDados int primary key auto_increment,
idRua int,
idBueiro int,
foreign key(idRua) references rua(idRua),
foreign key(idBueiro) references bueiro(idBueiro)
);
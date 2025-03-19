-- criando tabela bueiro
create table bueiro(
id_bueiro int auto_increment primary key,
tamanho varchar (20) not null,
foreign key (bairro) references bairro
);

create table bairro(
id_bairro int auto_increment primary key,
rua varchar (80),
complemento varchar (5),
cep char (9)
);

create table dados (
idDados int auto_increment primary key,
id_bairro int,
idBueiro int,
foreign key (id_bairro) references bairro (id_bairro),
foreign key (id_bueiro) references bueiro (id_bueiro)
 );


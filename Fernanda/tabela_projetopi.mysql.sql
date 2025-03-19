-- criando tabela bairro
create table bairro(
id_bairro int auto_increment primary key,
rua varchar (80),
complemento varchar (5),
cep char (9)
);

-- criando tabela bueiro
create table bueiro(
id_bueiro int auto_increment primary key,
tamanho varchar (20) not null,
fk_bairro int,
foreign key (fk_bairro) references bairro(id_bairro)
);

-- criando tabela dados
create table dados (
idDados int auto_increment primary key,
nivel_lixo varchar (10) not null default 'Baixo' check (nivel_lixo in('Baixo', 'Médio', 'Alto')),
data_monitoramento timestamp default current_timestamp,
fk_bairro int,
fk_bueiro int,
foreign key (fk_bairro) references bairro (id_bairro),
foreign key (fk_bueiro) references bueiro (id_bueiro)
 );
 

insert into bairro (rua, complemento, cep)
values ('Rua Abelardo Luz', 10, '08295-380'),
('Rua Acotipa', 28, '08210-040'),
('Avenida Afonso de Sampaio e Sousa', 1989, '08270-001'),
('Rua Alayde de Souza Costa', 90, '08215-490'),
('Rua Almadina', 16, '08215-440'),
('Rua Álvaro de Mendonça', 695, '08215-285'),
('Rua Américo Salvador Novelli', 59, '08210-090');

select * from bairro;

insert into bueiro(tamanho, fk_bairro)
    values (60, 1), 
    (70, 1), 
    (55, 2), 
    (70, 2), 
    (60, 3), 
    (58, 3), 
    (69, 4), 
    (70, 4), 
    (80, 5), 
    (76, 5);
	select * from Bueiro;

    
insert into dados(fk_bairro, fk_bueiro)
	values 
	(1, 1),  
	(1, 2),  
	(2, 3),  
	(2, 4),  
	(3, 5), 
	(3, 6),  
	(4, 7),  
	(4, 8),  
	(5, 9),  
	(5, 10); 
    select * from dados;
   


-- PROTOTIPO DE PI
-- criando database
create database ecodrain;
use ecodrain;

CREATE TABLE endereco (
idRua int auto_increment primary key,
nome_rua  varchar(100) NOT NULL,	
num_bueiros int NOT NULL
);

create table bueiro(
idBueiro int auto_increment primary key,
tamanho_bueiro decimal(4,2) not null,
fk_endereco int, 
foreign key (fk_endereco) references endereco(idRua)
);

create table dados(
idDados int auto_increment primary key,
nivel_lixo varchar(10) not null default 'Baixo' check(Nivel_lixo in('Baixo','Médio','Alto')),
qtd_lixo decimal(4,2),
data_monitoramento timestamp default current_timestamp,
fkbueiro int,	
foreign key(fkbueiro) references bueiro(idBueiro)
);

create table usuario (
idUsuario int auto_increment,
nome varchar(70),
cpf varchar(15),
senha varchar(12),
primary key(idUsuario)
);

    
insert into endereco(nome_rua, num_bueiros)
values 
('Rua Antônio de França e Silva', 12),  
('Rua Tomazzo Ferrara', 8),  
('Rua Serra de Botucatu', 15),  	
('Rua Gregório Ramalho', 10),  
('Rua Harry Dannemberg', 14);
select * from endereco;
    
insert into bueiro(tamanho_bueiro, fk_endereco)
values (60, 1), (70, 1), (55, 2), (70, 2), (60, 3), (58, 3), (69, 4), (70, 4), (80, 5), (76, 5);
select * from bueiro;
        
insert into dados(qtd_lixo, fkbueiro)
values 
(9, 1),  -- Bueiro de 60 cm (mais cheio)
(13, 2),  -- Bueiro de 70 cm (mais cheio)
(11, 3),  -- Bueiro de 55 cm (mais cheio)
(42.7, 4),  -- Bueiro de 70 cm (meio)
(37.5, 5),  -- Bueiro de 60 cm (meio)
(28, 6),  -- Bueiro de 58 cm (meio)
(65.2, 7),  -- Bueiro de 69 cm (mais vazio)
(60, 8),  -- Bueiro de 70 cm (mais vazio)
(75, 9),  -- Bueiro de 80 cm (mais vazio)
(69.7, 10); -- Bueiro de 76 cm (mais vazio)   
select * from dados;

insert into usuario (nome, cpf, senha) 
values 
('João Silva', '123.456.789-08', 'senha123'),  
('Carlos Souza', '234.567.890-01', 'senhaabc'),  
('Maria Oliveira', '987.654.321-07', 'senha456'),  
('Ana Pereira', '345.678.901-02', 'senhaXYZ');  
select * from usuario;
    
-- o tamanho "padrao" dos bueiros inteligentes vamos aproximar a 70cm
alter table bueiro modify tamanho_bueiro int not null default 70;
desc bueiro;
-- atualizando os bueiros para todos terem o mesmo tamanho
update bueiro set tamanho_bueiro = 70 where tamanho_bueiro not like 70;
select * from bueiro;
    
update dados
set Nivel_lixo = case
when qtd_lixo between 0 and 18 then 'Alto'
when qtd_lixo between 19 and 45 then 'Médio'
else nivel_lixo 
end;
select * from dados;
    
-- dando um select nos dados de forma mais limpa com os dados das tabelas dados e bueiro
select * from dados as dados inner join bueiro as bueiro on idBueiro = dados.fkbueiro;
    
-- drop database ecodrain;

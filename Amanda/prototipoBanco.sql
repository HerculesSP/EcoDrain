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
	fkendereco int,
    fkbueiro int,	
	foreign key(fkendereco) references endereco(idRua),
	foreign key(fkbueiro) references bueiro(idBueiro)
	);
    
    insert into endereco(nome_rua, num_bueiros)
    values 
    ('Rua Antônio de França e Silva', 12),  
	('Rua Tomazzo Ferrara', 8),  
	('Rua Serra de Botucatu', 15),  
	('Rua Gregório Ramalho', 10),  
	('Rua Harry Dannemberg', 14);
    select * from Endereco;
    
    insert into bueiro(tamanho_bueiro, fk_endereco)
    values (60, 1), (70, 1), (55, 2), (70, 2), (60, 3), (58, 3), (69, 4), (70, 4), (80, 5), (76, 5);
	select * from Bueiro;
        
    insert into dados(qtd_lixo, fkendereco, fkbueiro)
	values 
	(9, 1, 1),  -- Bueiro de 60 cm (mais cheio)
	(13, 1, 2),  -- Bueiro de 70 cm (mais cheio)
	(11, 2, 3),  -- Bueiro de 55 cm (mais cheio)
	(42.7, 2, 4),  -- Bueiro de 70 cm (meio)
	(37.5, 3, 5),  -- Bueiro de 60 cm (meio)
	(28, 3, 6),  -- Bueiro de 58 cm (meio)
	(65.2, 4, 7),  -- Bueiro de 69 cm (mais vazio)
	(60, 4, 8),  -- Bueiro de 70 cm (mais vazio)
	(75, 5, 9),  -- Bueiro de 80 cm (mais vazio)
	(69.7, 5, 10); -- Bueiro de 76 cm (mais vazio)
    select * from dados;
    
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
    

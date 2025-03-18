CREATE DATABASE ecodrain;
USE ecodrain;

CREATE TABLE endereco (
    idEndereco INT AUTO_INCREMENT PRIMARY KEY,
    nomeRua VARCHAR(200) NOT NULL,
    numero INT NOT NULL
);

INSERT INTO endereco (idEndereco, nomeRua, numero) VALUES
(1,'Avenida Paulista',200),
(2,'Rua Haddock Lobo',595),
(3,'Rua Augusta',450);

SELECT * FROM endereco;

CREATE TABLE bueiro (
    idBueiro INT AUTO_INCREMENT PRIMARY KEY,
    numeroRua VARCHAR(4) NOT NULL,
    espaco_total DECIMAL(5,2) NOT NULL
);

INSERT INTO bueiro (idBueiro, numeroRua, espaco_total, espaco_livre) VALUES
(1,'101', 60.00, 30.00),
(2,'202', 50.00, 25.00),
(3,'303', 48.00, 12.00);

SELECT * FROM bueiro;

CREATE TABLE dados (
    idDados INT AUTO_INCREMENT PRIMARY KEY,
    lixoqtd DECIMAL(5,2) NOT NULL,
    datalixo DATE NOT NULL,
    horariolixo TIME NOT NULL,
    espaco_livre DECIMAL(5,2) NOT NULL,
    idBueiro INT -- relacionamento com o bueiro
    CONSTRAINT fk_dados_bueiro FOREIGN KEY (idBueiro) REFERENCES bueiro(idBueiro)
);

INSERT INTO dados (lixoqtd, datalixo, horariolixo, idBueiro) VALUES
(5.50, '2025-03-17', '08:30:00', 1),
(6.20, '2025-03-17', '09:15:00', 2),
(4.80, '2025-03-17', '10:00:00', 3);

SELECT * FROM dados;

CREATE TABLE usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    enderecoid INT,
    CONSTRAINT fk_usuario_endereco FOREIGN KEY (enderecoid) REFERENCES endereco(idEndereco)
);

INSERT INTO usuario (nome, email, enderecoid) VALUES
('Beatriz', 'beatriz@email.com', 1),
('Gabriella', 'gabriella@email.com', 2),
('Amanda', 'amanda@email.com', 3);

SELECT * FROM usuario;

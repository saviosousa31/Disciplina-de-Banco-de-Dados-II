CREATE DATABASE bd_campeonato_turmaA;

USE bd_campeonato_turmaA;

CREATE TABLE Pais(
    idpais INT NOT NULL AUTO_INCREMENT, nome VARCHAR(30) NOT NULL, continente VARCHAR(30) NOT NULL, condicao VARCHAR(30) NOT NULL,
    PRIMARY KEY (idpais)
);
DESC Pais;

CREATE TABLE Equipe(
    idequipe INT NOT NULL AUTO_INCREMENT, nome VARCHAR(30) NOT NULL, idpais INT NOT NULL,
    PRIMARY KEY (idequipe),
    CONSTRAINT fk_equipe_pais FOREIGN KEY (idpais) REFERENCES Pais (idpais)
);
DESC Equipe;

CREATE TABLE Uniforme(
    iduniforme INT NOT NULL AUTO_INCREMENT, corcamisa VARCHAR(15) NOT NULL, corcalcao VARCHAR(15) NOT NULL,
    cormeias VARCHAR(15) NOT NULL, tipo VARCHAR(15) NOT NULL, idequipe INT NOT NULL,
    PRIMARY KEY (iduniforme),
    CONSTRAINT fk_uniforme_equipe FOREIGN KEY (idequipe) REFERENCES Equipe (idequipe)
);
DESC Uniforme;

CREATE TABLE Pessoa(
	cpf VARCHAR(11) NOT NULL, nome VARCHAR(50) NOT NULL, datanascimento DATE NOT NULL,
	telcel INT NOT NULL, telcom INT, salario FLOAT(10), idpais INT NOT NULL,  
	PRIMARY KEY(cpf),
	CONSTRAINT fk_pessoa_pais FOREIGN KEY (idpais) REFERENCES Pais (idpais)
);
DESC Pessoa;

CREATE TABLE Jogador(
    idjogador int NOT NULL AUTO_INCREMENT, numero INT NOT NULL, posicao VARCHAR(15) NOT NULL, cpf VARCHAR(11) NOT NULL, idequipe INT NOT NULL,
    PRIMARY KEY (idjogador),
    CONSTRAINT fk_jogador_pessoa FOREIGN KEY (cpf) REFERENCES Pessoa (cpf), 
    CONSTRAINT fk_jogador_equipe FOREIGN KEY (idequipe) REFERENCES Equipe (idequipe)
);
DESC Jogador;

CREATE TABLE Tecnico(
    idtecnico INT NOT NULL AUTO_INCREMENT, formacao VARCHAR(15) NOT NULL, cpf VARCHAR(11) NOT NULL,
    PRIMARY KEY (idtecnico),
    CONSTRAINT fk_tecnico_pessoa FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
    
);
DESC Tecnico;

CREATE TABLE Juiz(
    idjuiz INT NOT NULL AUTO_INCREMENT, federacao VARCHAR(15) NOT NULL, cpf VARCHAR(11) NOT NULL,
    PRIMARY KEY (idjuiz),
    CONSTRAINT fk_juiz_pessoa FOREIGN KEY (cpf) REFERENCES Pessoa (cpf)
);
DESC Juiz;

CREATE TABLE Partida(
    idpartida INT NOT NULL AUTO_INCREMENT, data DATE NOT NULL, horarioinicial TIME, horariofinal TIME, placarfinal VARCHAR(15), cidade VARCHAR(15) NOT NULL,
    campo VARCHAR(15) NOT NULL, idequipemandante INT NOT NULL, idequipevisitante INT NOT NULL, idjuiz INT NOT NULL,
    PRIMARY KEY (idpartida),
    CONSTRAINT fk_idequipemandante FOREIGN KEY (idequipemandante) REFERENCES Equipe (idequipe),
    CONSTRAINT fk_idequipevisitante FOREIGN KEY (idequipevisitante) REFERENCES Equipe (idequipe),
    CONSTRAINT fk_idjuiz FOREIGN KEY (idjuiz) REFERENCES Juiz (idjuiz)
);
DESC Partida;

CREATE TABLE JogadorPartida(
    idjogador INT NOT NULL, idpartida INT NOT NULL, status VARCHAR(15) NOT NULL, qtddegols INT NOT NULL,
    qtddefaltas INT NOT NULL, cartaoamarelo INT NOT NULL, cartaovermelho INT NOT NULL, 
    CONSTRAINT fk_jogadorpartida_jogador FOREIGN KEY (idjogador) REFERENCES Jogador (idjogador),
    CONSTRAINT fk_jogadorpartida_partida FOREIGN KEY (idpartida) REFERENCES Partida (idpartida)
);
DESC JogadorPartida;

CREATE TABLE TreinaEquipe(
    idequipe INT NOT NULL, idtecnico INT NOT NULL, dtadmissao DATE NOT NULL, dtdemissao DATE,
    CONSTRAINT fk_treinaequipe_equipe FOREIGN KEY (idequipe) REFERENCES Equipe (idequipe),
    CONSTRAINT fk_treinaequipe_tecnico FOREIGN KEY (idtecnico) REFERENCES Tecnico (idtecnico)
);
DESC TreinaEquipe;

DESC Pais;
INSERT INTO Pais (nome, continente, condicao)
VALUES ("Alemanha", "Europa", "Desenvolvido");
INSERT INTO Pais (nome, continente, condicao)
VALUES ("Espanha", "Europa", "Desenvolvido");
INSERT INTO Pais (nome, continente, condicao)
VALUES ("Franca", "Europa", "Desenvolvido");
INSERT INTO Pais (nome, continente, condicao)
VALUES ("Italia", "Europa", "Desenvolvido");
INSERT INTO Pais (nome, continente, condicao)
VALUES ("Inglaterra", "Europa", "Desenvolvido");
SELECT * FROM Pais;

DESC Equipe;
INSERT INTO Equipe (nome, idpais)
VALUES ("Bayern", "1");
INSERT INTO Equipe (nome, idpais)
VALUES ("Borussia", "1");
INSERT INTO Equipe (nome, idpais)
VALUES ("Barcelona", "2");
INSERT INTO Equipe (nome, idpais)
VALUES ("RealMadrid", "2");
INSERT INTO Equipe (nome, idpais)
VALUES ("AtleticoMadrid", "2");
INSERT INTO Equipe (nome, idpais)
VALUES ("PSG", "3");
INSERT INTO Equipe (nome, idpais)
VALUES ("Mlan", "4");
INSERT INTO Equipe (nome, idpais)
VALUES ("Juventus", "4");
INSERT INTO Equipe (nome, idpais)
VALUES ("Liverpool", "5");
INSERT INTO Equipe (nome, idpais)
VALUES ("Chelsea", "5");
SELECT * FROM Equipe;

DESC Uniforme;
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Vermelho", "Vermelho", "Vermelho", "padrao", 1);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Amarelo", "Preto", "Amarelo", "padrao", 2);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Grena", "Grena", "Grena", "padrao", 3);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Branco", "Branco", "Branco", "padrao", 4);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Vermelho", "Azul", "Vermelho", "padrao", 5);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Azul", "Azul", "Azul", "padrao", 6);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Vermelho", "Preto", "Preto", "padrao", 7);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Branco", "Preto", "Preto", "padrao", 8);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Vermelho", "Vermelho", "Vermelho", "padrao", 9);
INSERT INTO Uniforme(corcamisa, corcalcao, cormeias, tipo, idequipe)
VALUES ("Azul", "Azul", "Azul", "padrao", 10);
SELECT * FROM Uniforme;

DESC Pessoa;
INSERT INTO Pessoa (cpf, nome, datanascimento, telcel, telcom, salario, idpais)
VALUES ("11111111111", "Joaquin", "1981-01-01", "11111111", NULL, NULL, "3");
INSERT INTO Pessoa (cpf, nome, datanascimento, telcel, telcom, salario, idpais)
VALUES ("22222222222", "Luisito", "1983-02-02", "22222222", NULL, NULL, "2");
INSERT INTO Pessoa (cpf, nome, datanascimento, telcel, telcom, salario, idpais)
VALUES ("33333333333", "Muller", "1971-03-03", "33333333", NULL, NULL, "1");
INSERT INTO Pessoa (cpf, nome, datanascimento, telcel, telcom, salario, idpais)
VALUES ("44444444444", "Francesco", "1972-04-04", "44444444", NULL, NULL, "4");
INSERT INTO Pessoa (cpf, nome, datanascimento, telcel, telcom, salario, idpais)
VALUES ("55555555555", "John", "1977-05-05", "55555555", NULL, NULL, "5");
SELECT * FROM Pessoa;

DESC Juiz;
INSERT INTO Juiz (federacao, cpf)
VALUES ("FIFA", "11111111111");
INSERT INTO Juiz (federacao, cpf)
VALUES ("FIFA", "22222222222");
INSERT INTO Juiz (federacao, cpf)
VALUES ("FIFA", "33333333333");
INSERT INTO Juiz (federacao, cpf)
VALUES ("FIFA", "44444444444");
INSERT INTO Juiz (federacao, cpf)
VALUES ("FIFA", "55555555555");
SELECT * FROM Juiz;

DESC Partida;
INSERT INTO Partida (data, horarioinicial, horariofinal, cidade, campo, idequipemandante, idequipevisitante, idjuiz)
VALUES ("2020-10-01", "19:00:00", "20:45:00", "Munique", "AllianzArena", 1, 2, 1);
INSERT INTO Partida (data, horarioinicial, horariofinal, cidade, campo, idequipemandante, idequipevisitante, idjuiz)
VALUES ("2020-10-02", "19:00:00", "20:45:00", "Madrid", "Bernabeu", 4, 3, 2);
INSERT INTO Partida (data, horarioinicial, horariofinal, cidade, campo, idequipemandante, idequipevisitante, idjuiz)
VALUES ("2020-10-03", "19:00:00", "20:45:00", "Paris", "ParcdePrince", 6, 5, 3);
INSERT INTO Partida (data, horarioinicial, horariofinal, cidade, campo, idequipemandante, idequipevisitante, idjuiz)
VALUES ("2020-10-04", "19:00:00", "20:45:00", "Milao", "SanSiro", 7, 8, 4);
INSERT INTO Partida (data, horarioinicial, horariofinal, cidade, campo, idequipemandante, idequipevisitante, idjuiz)
VALUES ("2020-10-05", "19:00:00", "20:45:00", "Londres", "Anfield", 9, 10, 5);
SELECT * FROM Partida;



SELECT * FROM Pessoa;

SELECT * FROM Equipe ORDER BY idpais;

SELECT * FROM Partida ORDER BY data;

SELECT * FROM Uniforme ORDER BY idequipe;
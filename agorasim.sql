CREATE DATABASE IF NOT EXISTS escola;
USE escola;
DROP TABLE IF EXISTS `pessoa`;
CREATE TABLE `pessoa` (	`id_pessoa` int(11) NOT NULL auto_increment,    `nome` varchar(70) NOT NULL,    `cpf` varchar(20) NOT NULL,    `dt_nascimento` datetime NOT NULL,    `sexo` int(11) NOT NULL,    PRIMARY KEY  (`id_pessoa`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
select * from pessoa;
INSERT INTO escola.pessoa(nome,cpf,dt_nascimento,sexo) VALUES
			('mozin','122.333.454-47','2020-11-24',1);
    
DROP TABLE IF EXISTS `aluno`;
CREATE TABLE `aluno` (`id_aluno` int(11) NOT NULL auto_increment,    `dt_cadastro` datetime NOT NULL,    `id_pessoa` int(11) NOT NULL,    PRIMARY KEY  (`id_aluno`),     FOREIGN KEY(`id_pessoa`) REFERENCES `pessoa`(`id_pessoa`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `aluno` (`dt_cadastro`,`id_pessoa`) VALUES	('2020-11-24 21:51:21',1),    ('2020-11-24 21:51:21',2),    ('2020-11-24 21:51:21',3),    ('2020-11-24 21:51:21',4),    ('2020-11-24 21:51:21',5);

DROP TABLE IF EXISTS `turma`;
CREATE TABLE `turma` (	`id_turma` int(11) NOT NULL auto_increment,    `nome` varchar(100) NOT NULL,    `dt_inicial` datetime NOT NULL ,    `dt_final` datetime NOT NULL,    `ano` INT(11) NOT NULL,    `periodo` int(11) NOT NULL,    `descricao` varchar(45) NOT NULL,        PRIMARY KEY(`id_turma`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO escola.turma(nome,dt_inicial,dt_final,ano,periodo,descricao) VALUES	('TurmaSI','2020-12-08 00:00:00',now(),4,8,'turma voltado para a area tecnologica'),    ('Turma Eng','2020-12-08 00:00:00',now(),4,8,'turma para os amantes da engenharia'),    ('Turma Calculo','2020-12-08 00:00:00',now(),4,8,'turma pra calculo'),    ('Turma Civil','2020-12-08 00:00:00',now(),4,8,'Ramo civil da engenharia'),    ('Turma eletrica','2020-12-08 00:00:00',now(),4,8,'turma do ramo eletrico da engenharia');

DROP TABLE IF EXISTS `alunoturma`;
CREATE TABLE `alunoturma`(	`id_aluno` int(11) NOT NULL,    `id_turma` int(11) NOT NULL,       `dt_matricula` datetime NOT NULL,    `dt_cancelamento` datetime NOT NULL,    PRIMARY KEY  (`id_aluno`,`id_turma`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `alunoturma` (`id_aluno`,`id_turma`,`dt_matricula`,`dt_cancelamento`) VALUES	(1,1,'2020-11-24 22:33:44','1900-01-01 00:00:00'),    (2,1,'2020-11-24 22:33:44','1900-01-01 00:00:00'),    (3,1,'2020-11-24 22:33:44','1900-01-01 00:00:00'),    (4,1,'2020-11-24 22:33:44','1900-01-01 00:00:00'),    (5,1,'2020-11-24 22:33:44','1900-01-01 00:00:00');

DROP TABLE IF EXISTS `avaliacao`;
CREATE TABLE `avaliacao` (	`id_avaliacao` int(11) NOT NULL auto_increment,    `descricao` varchar(45) NOT NULL,    `valor` double NOT NULL,    `observacao` text,    PRIMARY KEY  (`id_avaliacao`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `avaliacao` (`id_avaliacao`,`descricao`,`valor`,`observacao`) VALUES	(1,'Trabalho 1',30,'Trabalho sobre BD'),    (2,'Trabalho 2',30,'Trabalho sobre INNER JOIN'),    (3,'AVALIA&amp;Ccedil;&amp;Atilde;O',40,'AVALIA&amp;Ccedil;&amp;Atilde;O FINAL'),    (4,'TESTE',10,'Obs');

DROP TABLE IF EXISTS `avaliacaoturma`;
CREATE TABLE `avaliacaoturma` (	`id_avaliacao` int(11) NOT NULL,    `id_aluno` int(11) NOT NULL,    `id_turma` int(11) NOT NULL,    `id_disciplina` int(11) NOT NULL,     `dt_avaliacao` datetime NOT NULL,    `nota` double NOT NULL,    PRIMARY KEY  (`id_avaliacao`,`id_aluno`,`id_turma`,`id_disciplina`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `avaliacaoturma` (`id_avaliacao`,`id_aluno`,`id_turma`,`id_disciplina`,`dt_avaliacao`,`nota`)VALUES	(1,1,1,1,'2020-12-08 00:00:00',20),    (1,2,1,1,'2020-12-08 00:00:00',25),    (1,3,1,1,'2020-12-08 00:00:00',21),    (1,4,1,1,'2020-12-08 00:00:00',10),    (1,5,1,1,'2020-12-08 00:00:00',0),    (2,1,1,1,'2020-12-18 00:00:00',28),    (2,2,1,1,'2020-12-18 00:00:00',22),    (2,3,1,1,'2020-12-18 00:00:00',5),    (2,4,1,1,'2020-12-18 00:00:00',10),    (2,5,1,1,'2020-12-18 00:00:00',0),    (3,1,1,1,'2020-12-15 00:00:00',30),    (3,2,1,1,'2020-12-15 00:00:00',39),    (3,3,1,1,'2020-12-15 00:00:00',20),    (3,4,1,1,'2020-12-15 00:00:00',35);
DROP TABLE IF EXISTS `professor`;
CREATE TABLE `professor`(	`id_professor` int(11) NOT NULL auto_increment,    `formacao` varchar(60) NOT NULL ,    `id_pessoa` int(11) NOT NULL,    PRIMARY KEY(`id_professor`),    FOREIGN KEY(`id_pessoa`) REFERENCES `pessoa`(`id_pessoa`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO escola.professor(formacao,id_pessoa) VALUES	('Mestrado em TI UEMG',6),    ('Historia unicamp',7),    ('Fisica FUVEST',8),    ('Ingles UNIFENAS',9),    ('Graduado Portugues UNIFRAN ',10);
DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE `disciplina` (  	`id_disciplina` int(11) NOT NULL auto_increment,    `nome` varchar(60) NOT NULL ,    `numero` int(11) NOT NULL,    `creditos` int(11) NOT NULL,    PRIMARY KEY(`id_disciplina`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO escola.disciplina(nome,numero,creditos) VALUES 	('Geografia',44,53),    ('Historia',43,25),    ('AED3',23,15),    ('Matematica',24,35),    ('Portugues',45,55);
DROP TABLE IF EXISTS prof_turm_disc;
CREATE TABLE prof_turm_disc (	id_professor INT(12) NOT NULL,	id_turma INT(12) NOT NULL,    id_disciplina INT(12) NOT NULL);
INSERT INTO escola.prof_turm_disc(id_professor,id_turma,id_disciplina) VALUES 	(6,1,3);

CREATE TABLE `escola`.`mensagens`(	`idmensagens` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,    `id_aluno` INTEGER UNSIGNED NOT NULL DEFAULT 0,    `id_professor` INTEGER UNSIGNED NOT NULL DEFAULT 0,    `dt_mensagem` DATETIME NOT NULL,    `mensagem` VARCHAR(100) NOT NULL,    `situacao` INTEGER UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 Nao lida; 1 Lida; 2 arquivada',    `dt_leitura` DATETIME DEFAULT '1900-01-01'NOT NULL,    PRIMARY KEY (`idmensagens`)) ENGINE = InnoDB;
-- CREATE TRIGGER `msg_avaliacao_aluno_ins` AFTER INSERT ON `escola.alunoturma` FOR EACH ROW BEGIN	INSERT INTO mensagens(id_aluno,dt_mensagem, mensagem) SELECT    NEW.id_aluno, NOW(), CONCAT('Aluno',p.nome,'    ingressou na turma.'+ t.nome) FROM alunoturma alt     INNER JOIN aluno a ON alt.id_aluno = a.id_aluno    INNER JOIN pessoa p ON a.id_pessoa = p.id_pessoa	INNER JOIN turma t ON alt.id_turma = t.id_turma    END;

create trigger tr_mensagem after insert on escola.alunoturma for each row insert into mensagens(id_aluno,dt_mensagem, mensagem) select NEW.id_aluno, NOW(), CONCAT('Aluno',p.nome,'    ingressou na turma.'+ t.nome) FROM alunoturma alt     INNER JOIN aluno a ON alt.id_aluno = a.id_aluno    INNER JOIN pessoa p ON a.id_pessoa = p.id_pessoa	INNER JOIN turma t ON alt.id_turma = t.id_turma;

INSERT INTO escola.alunoturma(`id_aluno`,`id_turma`,`dt_matricula`,`dt_cancelamento`) VALUES	(11,1,now(),'1900-01-01 00:00:00');
desc aluno;
SELECT * FROM escola.mensagens;
SELECT * FROM escola.alunoturma;
select * from aluno;
select * from professor;
select * from pessoa;
desc pessoa;
-- função para verificar a idade da pessoa:
DELIMITER $
CREATE FUNCTION func_idade(dtNascimento DATETIME)
RETURNS INTEGER
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dtNascimento, NOW());
END$
DELIMITER ;

select *, func_idade(dt_nascimento) idade from pessoa limit 5;
update pessoa set dt_nascimento = '1980-01-25' where id_pessoa = 5;
select *, func_idade(dt_nascimento) idade from pessoa limit 5;

select nome from aluno join pessoa where aluno.id_pessoa = pessoa.id_pessoa order by nome limit 100;
select * from aluno;
delete from aluno where id_aluno > '8';

select * from professor;
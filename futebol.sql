select id, nome from equipes order by nome;
select *, timestampdiff(year, jogadores.datanasc, current_date()) idade from jogadores; -- idade em anos
desc jogadores;
 
 create view players as select jogadores.nome as jogador, camisa, altura, nacionalidade, equipes.nome as equipe, timestampdiff(year, jogadores.datanasc, current_date()) idade from jogadores join equipes where jogadores.idequipe = equipes.id;
 select * from players order by equipe;

insert into equipes(nome, estadio, pais) values 
('Borussia Dortmund', 'Signal Iduna Park', 'Alemanha');
insert into jogadores(nome, camisa, altura, nacionalidade, datanasc, idequipe) values
('Dybala', '10', '1.73', 'Argentina', '1997-10-07', '3');

create table mensagens(idmensagem int auto_increment, idjogador int, mensagem varchar(100), idequipe int, dtmsg datetime, primary key(idmensagem));
-- create trigger trmsg after insert on futebol.jogadores for each row insert into mensagens(idjogador, idequipe, mensagem, dtmsg) select new.idjogador, concat('Jogador:', new.jogador.nome, ' foi cadastrado na equipe: ', new.equipe.nome, ' cujo código é: '), new.idequipe, concat(' - Data de cadastro:'), now();

create table jogadorequipe(idjogador int, idequipe int, dtcadastro datetime);
alter table jogadorequipe add primary key(idjogador, idequipe);
desc jogadorequipe;

delimiter $
create trigger tr_je after insert on jogadores for each row begin
insert into jogadorequipe(idjogador, idequipe, dtcadastro) values (new.id, new.idequipe, now()); end$
delimiter ;

select * from jogadorequipe;

create view jog_eq as select jogadores.nome as jogador, equipes.nome as equipe, dtcadastro from jogadores join equipes join jogadorequipe where jogadores.id = jogadorequipe.idjogador and equipes.id = jogadorequipe.idequipe;

select * from jog_eq;


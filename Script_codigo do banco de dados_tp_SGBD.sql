CREATE DATABASE gestao_eventos_academicos;
USE gestao_eventos_academicos;

-- 2. Tabela Evento (Base para as Atividades)
CREATE TABLE Evento (
Id_Evento int primary key auto_increment,
Nome_Evento varchar(100),
Descricao text,
Local varchar(50),
Cidade VARCHAR(50), 
Data_inicio datetime not null,
Data_fim datetime not null,
PrecoInscricao decimal(10, 2) default 0.00,
constraint chk_datas check (Data_fim > Data_inicio)

) ;
-- 3. Tabela Participante
CREATE TABLE Participante (
    Id_Participante INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20),
    Tipo_Participante VARCHAR(50) -- Ex: Estudante, Docente

);

-- 4. Tabela Palestrante
CREATE TABLE Palestrante (
Id_palestrante int primary key auto_increment,
Nome_Palestrante varchar(50) not null,
Detalhes_bibliograficos text
   
) ;

-- 5. Tabela Atividade (Ex: Palestras, Workshops)
CREATE TABLE Atividade (
Id_Atividade int primary key auto_increment,
Tipo_atividade varchar(50),
hora datetime,
Titulo varchar(50),
Capacidade int check (Capacidade > 0),
Id_Evento int,
foreign key  (Id_Evento) references   Evento  (Id_Evento) on delete cascade
	
) ;

-- 6. Tabela Inscricao (Vínculo oficial entre Participante e Evento)
CREATE TABLE Inscricao (
 Id_Inscricao int primary key auto_increment,
Data_inscricao datetime default current_timestamp,
status_pagamento varchar(20),
Id_Participante int,
Id_Evento int,
foreign key (Id_Participante) references Participante(Id_Participante) on delete cascade,
foreign key (Id_Evento) references  Evento(Id_Evento) on delete cascade
) ;

-- 7. Tabela Assistir (CONTROLE DE PRESENÇA - N:N)
CREATE TABLE Assistir (
    Id_Atividade INT ,
    Id_Participante INT,
    Hora_Entrada datetime, -- Registra o momento real da entrada
foreign key (Id_Participante) references Participante(Id_Participante) on delete cascade,
foreign key (Id_Atividade) references  Atividade(Id_Atividade) on delete cascade
) ;

-- 8. Tabela Ministrar (Vínculo Palestrante e Atividade - N:N)
CREATE TABLE Ministrar (
Id_Atividade int,
Id_palestrante int,
primary key (Id_Atividade, Id_palestrante),
foreign key (Id_Atividade) references Atividade(Id_Atividade) on delete cascade,
foreign key(Id_palestrante) references Palestrante(Id_palestrante) on delete cascade
);


insert into Ministrar (Id_Atividade, Id_palestrante) value (1, 1);

insert into Evento (Nome_Evento, Descricao, Local, Cidade, Data_inicio, Data_fim, PrecoInscricao) values
('Conferência de TI Uíge', 'Inovações em Engenharia Informática', 'Uíge - Kimpa Vita', 'Uíge', '2026-05-10 09:00:00', '2026-05-12 18:00:00', 5000.00),
('Workshop Python', 'Programação avançada com Django', 'Hotel Epic Sana', 'Luanda', '2026-06-15 10:00:00', '2026-06-15 17:00:00', 2500.00),
('Fórum de Cibersegurança', 'Proteção de dados em Angola', 'Centro de Conferências Talatona', 'Luanda', '2026-07-20 08:30:00', '2026-07-22 16:00:00', 7000.00),
('Semana Tecnológica Uige', 'Tecnologia e Inovação', 'Auditório da unikiv ', 'Uíge', '2026-08-05 09:00:00', '2026-08-07 18:00:00', 3000.00),
('Simpósio de Agro-Tech', 'Tecnologia no Campo', 'Feira do Uíge', 'Uíge', '2026-09-12 08:00:00', '2026-09-13 15:00:00', 1500.00);


insert into Palestrante (Nome_Palestrante, Detalhes_bibliograficos) values
('Dr. Pedro', 'Especialista em Engenharia de Software'),
('Eng. Mateus Ernesto', 'Desenvolvedor Fullstack e Redes'),
('Dra. Ana Luísa', 'Ph.D. em Inteligência Artificial'),
('Msc. João Manuel', 'Consultor de Segurança de Redes'),
('Eng. Silo Pedro', 'Especialista em Base de Dados'),
('Dr. Ricardo Jorge', 'Investigador em IoT'),
('Eng. Rogerio Mbidi', 'Arquiteto de Sistemas Cloud'),
('Msc. Moyo', 'Especialista em Governança de TI'),
('Eng. Ernesto Sunda', 'Desenvolvedor Mobile Flutter'),
('Eng. José Dias ', 'Analista de Sistemas de Informação');

insert into Participante (Nome, Tipo_participante, Telefone) values
('António Carlos', 'Estudante', '923000111'),
('Beatriz Manuel', 'Profissional', '931000222'),
('Cláudio José', 'Estudante', '944000333'),
('Delfina Amós', 'Investigadora', '912000444'),
('Edson Mateus', 'Estudante', '922000555'),
(' Mateus', 'Estudante', '922000555'),
('Edson ', 'Estudante', '922000555'),
('Zélia Gomes', 'Profissional', '933000999');

insert into Participante ( Nome,Tipo_participante , Telefone) values
( 'Isabel Francisco', 'Estudante', '923111222'),
( 'Mateus João', 'Profissional', '931222333'),
( 'Domingos André', 'Estudante', '944333444'),
( 'Catarina José', 'Investigadora', '912444555'),
( 'Sebastião Paulo', 'Estudante', '922555666'),
( 'Teresa Bento', 'Profissional', '933666777'),
( 'Luvualu Gabriel', 'Estudante', '924777888'),
( 'Joana Hipólito', 'Estudante', '923888999'),
( 'Miguel Arcanjo', 'Profissional', '931999000'),
( 'Feliciana Kiala', 'Estudante', '944000111'),
( 'Bernardo Luís', 'Investigador', '912111222'),
( 'Sofia Manuel', 'Estudante', '922222333'),
( 'Daniel Cassoma', 'Profissional', '933333444'),
( 'Rosa Agostinho', 'Estudante', '924444555'),
( 'Gaspar Neto', 'Estudante', '923555666'),
( 'Helder Vunge', 'Profissional', '931666777'),
( 'Lucinda Pedro', 'Estudante', '944777888'),
( 'Bartolomeu Dias', 'Investigador', '912888999'),
( 'Eugénia Carlos', 'Estudante', '922999000'),
( 'Valter Gomes', 'Profissional', '933000111');

select * from  Participante;
insert into Inscricao (status_pagamento, Id_Participante, Id_Evento) values
('Confirmado', 1, 1), ('Confirmado', 20, 1), ('Pendente', 23, 1),
('Confirmado', 4, 2), ('Confirmado', 17, 2), ('Confirmado', 16, 2), 
('Confirmado', 15, 3), ('Pendente', 18, 3), ('Confirmado', 24, 3),
('Confirmado', 9, 4), ('Confirmado', 11, 4), ('Confirmado', 14, 4),
('Confirmado', 12, 5), ('Confirmado', 13, 5), ('Confirmado', 19, 5); 

insert into Inscricao (status_pagamento, Id_Participante, Id_Evento) values
('Confirmado', 21, 2), 
('Confirmado', 28, 3), 
('Confirmado', 22, 2);

insert into Atividade (Tipo_atividade, hora, Titulo, Capacidade, Id_Evento) values
('Palestra', '2026-05-10 10:00:00', 'Bases de Dados Relacionais', 50, 1),
('Workshop',  '2026-05-11 14:00:00', 'Contentores na Nuvem', 100, 1),
('Sessão Técnica', '2026-06-15 11:00:00', 'Web Security 101', 50, 2);

select * from Atividade;


#Listar eventos com oradores e total de participantes

select
    e.Nome_Evento, 
    p.Nome_Palestrante,  
    (select count(*) from  Inscricao i where Id_Evento = e.Id_Evento) as Total_Inscritos 
from Evento e 
join Atividade a on e.Id_Evento = a.Id_Evento 
join Ministrar m on a.Id_Atividade = m.Id_Atividade 
join Palestrante p on m.Id_palestrante = p.Id_palestrante 
limit 0, 1000;

#Participantes inscritos em mais de um evento
select p.Nome, count(i.Id_Evento) as Qtd_Eventos
from Participante p
join  Inscricao i on p.Id_Participante = i.Id_Participante
group  by p.Id_Participante
having Qtd_Eventos >= 1;

#Sessões de um evento específico ordenadas por hora

select Titulo, Hora, Tipo_Atividade 
from Atividade 
where Id_Evento = 1 
order by Hora asc;

# Calcular receita total gerada por cada evento

select e.Nome_Evento, 
count(i.Id_Inscricao) * e.PrecoInscricao as Receita_Total
from Evento e
left join  Inscricao i  on e.Id_Evento = i.Id_Evento
where i.status_pagamento = 'Confirmado' 
group by e.Id_Evento;

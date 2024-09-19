-- Populando a tabela visitante
INSERT ALL
INTO visitante VALUES(11234567899, 'João', 'Silva', 'M', 1.75, DATE '1990-01-01')
INTO visitante VALUES(12234567889, 'Maria', 'Souza', 'F', 1.65, DATE '1985-05-20')
INTO visitante VALUES(12334567789, 'Carlos', 'Pereira', 'M', 1.80, DATE '1978-11-15')
INTO visitante VALUES(79450061382, 'Júnior', 'Bocão', 'M', 1.86, DATE '1965-03-26')
INTO visitante VALUES(12345678901, 'Ana', 'Silva', 'F', 1.70, DATE '1995-07-10')
INTO visitante VALUES(12345678902, 'Pedro', 'Santos', 'M', 1.75, DATE '1990-01-01')
INTO visitante VALUES(12345678903, 'Mariana', 'Pereira', 'F', 1.65, DATE '1985-05-20')
INTO visitante VALUES(12345678904, 'Lucas', 'Souza', 'M', 1.20, DATE '2012-11-15')
INTO visitante VALUES(12345678905, 'Paula', 'Silva', 'F', 1.40, DATE '1965-03-26')
INTO visitante VALUES(38475610293, 'Donatelo', 'Gilson', 'M', 1.77, DATE '1983-09-25')
INTO visitante VALUES(57382910465, 'Elton', 'Jonas', 'O', 1.72, DATE '1947-03-25')
INTO visitante VALUES(90817264531, 'Rian', 'Reinaldo', 'M', 1.88, DATE '1976-10-23')
INTO visitante VALUES(21649385702, 'Henrique','Carvalho', 'M', 1.85, DATE '1983-05-05')
INTO visitante VALUES(21649385703, 'Milena', 'Roberta', 'F', 1.61, DATE '2004-02-19')
INTO visitante VALUES(49182706354, 'Maia', 'Aguiar', 'F', 1.74, DATE '1998-07-08')
INTO visitante VALUES(65832049127, 'Thomas', 'Cruzeiro', 'M', 1.70, DATE '1962-07-03')
INTO visitante VALUES(98256317528, 'Timóteo', 'Chaleira', 'M', 1.78, DATE '1995-12-27')
INTO visitante VALUES(52178168616, 'Roberto', 'Patrício', 'M', 1.85, DATE '1986-05-13')
INTO visitante VALUES(10865917705, 'Charlene', 'Timão', 'F', 1.77, DATE '1975-08-07')
INTO visitante VALUES(10965917705, 'Scarlet', 'Gomes', 'F', 1.62, DATE '2000-05-07')
INTO visitante VALUES(11065917705, 'Beatriz', 'Santos', 'F', 1.67, DATE '2001-08-07')
INTO visitante VALUES(11165917705, 'Bárbara', 'Brito', 'F', 1.65, DATE '2001-05-24')
INTO visitante VALUES(11265917705, 'Bruno', 'Goes', 'M', 1.70, DATE '2002-04-07')
INTO visitante VALUES(11365917705, 'Caique', 'Medeiros', 'M', 1.80, DATE '1990-08-07')
INTO visitante VALUES(11465917705, 'Cauã', 'Santos', 'M', 1.75, DATE '2005-07-14')
INTO visitante VALUES(11565917705, 'César', 'Cielo', 'M', 1.78, DATE '2001-04-07')
INTO visitante VALUES(11665917705, 'Cícero', 'Santos', 'M', 1.72, DATE '2006-06-25')
INTO visitante VALUES(11765917705, 'Ciro', 'Gomes', 'M', 1.70, DATE '2001-02-07')
INTO visitante VALUES(11865917705, 'Daniela', 'Mercúrio', 'O', 1.65, DATE '2002-09-07')
INTO visitante VALUES(11965917705, 'Donald', 'Bezerra', 'M', 1.80, DATE '2000-08-07')
INTO visitante VALUES(12065917705, 'Eduarda', 'Canudos', 'F', 1.75, DATE '2005-07-14')
INTO visitante VALUES(12165917705, 'Eduardo', 'Lima', 'M', 1.78, DATE '2001-04-07')
INTO visitante VALUES(12265917705, 'Elias', 'Carneiros', 'M', 1.72, DATE '2006-06-25')
INTO visitante VALUES(12465917705, 'Hugo', 'Chávez', 'M', 1.75, DATE '1954-06-28')
INTO visitante VALUES(12565917705, 'Dráuzio', 'Varela', 'M', 1.82, DATE '1943-05-03')
INTO visitante VALUES(12565917706, 'Valentina', 'Otaviana', 'F', 1.68, DATE '1974-11-12')
INTO visitante VALUES(12565917707, 'Ribamar', 'Glorioso', 'M', 1.74, DATE '1981-12-24')
INTO visitante VALUES(12565917708, 'Ronaldo', 'Vieira', 'M', 1.78, DATE '1988-05-14')
INTO visitante VALUES(12565917709, 'Hebe', 'Gouveia', 'F', 1.62, DATE '1948-02-05')
INTO visitante VALUES(12565917710, 'Isabel', 'Costa', 'F', 1.79, DATE '1997-07-25')
SELECT 1 FROM dual;

-- Populando a tabela atracao
INSERT ALL
INTO atracao VALUES('Montanha Russa', 'radical', 20, 12, 1.50) --operado por 12345678932(José)
INTO atracao VALUES('Carrossel', 'família', 30, 0, 1.00) --operado por 12345678956(Ana)
INTO atracao VALUES('Thunderbolt', 'radical', 15, 0, 1.50) --operado por 12345678978(Pedro)
INTO atracao VALUES('Roda Gigante', 'família', 20, 0, 1.00) --operado por 12345678977(Marcone)
INTO atracao VALUES('Trem Fantasma', 'família', 30, 6, 1.00) --operado por 31344556781(Jorge)
INTO atracao VALUES('Pandeiro', 'radical', 10, 4, 1.40) --operado por 12345678901(Diego)
INTO atracao VALUES('Carrinho de Bate-Bate', 'infantil', 15, 6, 1.00) --operado por 44344556781(Barbára)
INTO atracao VALUES('Elefante', 'infantil', 20, 0, 1.00) --operado por 55662509123(Márcio)
INTO atracao VALUES('Castelo Pula-Pula', 'infantil', 10, 0, 1.00) --operado por 12345678903(Kailane)
INTO atracao VALUES('Barca', 'radical', 10, 6, 1.30) --operado por 21344556781(Pietro)
INTO atracao VALUES('Splash', 'radical', 15, 6, 1.30) --operado por  12344567890(Júlia)
INTO atracao VALUES('Badoque', 'radical', 30, 0, 1.40) --operado por 12345678999(Miguel)
INTO atracao VALUES('Avião Mágico', 'infantil', 15, 0, 1.40) --operado por 00865708463(Alex)
INTO atracao VALUES('Mansão do Terror', 'radical', 30, 18, 1.40) --operado por 31415926535(Pierre)
INTO atracao VALUES('Tiro ao Alvo', 'família', 10, 6, 1.50) --operado por 50596374158(Harrison)
INTO atracao VALUES('Escalador', 'radical', 15, 12, 1.60) --operado por 75315968423(Italo)
INTO atracao VALUES('Escorregador', 'família', 15, 6, 1.40) --operado por 15375964701(Fernando)
SELECT 1 FROM dual;

-- Populando a tabela utilizar 
INSERT ALL
INTO utilizar VALUES('Montanha Russa', 11234567899,  TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Carrossel', 11234567899,  TIMESTAMP '2024-01-18 11:00:00')
INTO utilizar VALUES('Thunderbolt', 11234567899,  TIMESTAMP '2024-01-18 12:00:00')
INTO utilizar VALUES('Badoque', 11234567899,  TIMESTAMP '2024-01-18 13:00:00')
INTO utilizar VALUES('Montanha Russa', 12234567889,  TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Thunderbolt', 12234567889,  TIMESTAMP '2024-01-18 11:00:00')
INTO utilizar VALUES('Barca', 12234567889,  TIMESTAMP '2024-01-18 11:30:00')
INTO utilizar VALUES('Badoque', 12234567889,  TIMESTAMP '2024-01-18 12:00:00')
INTO utilizar VALUES('Trem Fantasma', 12234567889, TIMESTAMP '2024-01-18 12:00:00')
INTO utilizar VALUES('Montanha Russa', 12334567789, TIMESTAMP '2024-06-29 09:00:00')
INTO utilizar VALUES('Splash', 12334567789, TIMESTAMP '2024-06-29 10:30:00')
INTO utilizar VALUES('Roda Gigante', 12334567789, TIMESTAMP '2024-06-29 11:45:00')
INTO utilizar VALUES('Carrinho de Bate-Bate', 12334567789, TIMESTAMP '2024-06-29 13:00:00')
INTO utilizar VALUES('Mansão do Terror', 12334567789, TIMESTAMP '2024-06-29 13:30:00')
INTO utilizar VALUES('Thunderbolt', 79450061382, TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Barca', 79450061382, TIMESTAMP '2024-01-18 10:30:00')
INTO utilizar VALUES('Badoque', 79450061382, TIMESTAMP '2024-01-18 11:00:00')
INTO utilizar VALUES('Trem Fantasma', 79450061382, TIMESTAMP '2024-01-18 11:30:00')
INTO utilizar VALUES('Splash', 79450061382, TIMESTAMP '2024-01-18 13:00:00')
INTO utilizar VALUES('Tiro ao Alvo', 79450061382, TIMESTAMP '2024-01-18 14:00:00')
INTO utilizar VALUES('Pandeiro', 12345678901, TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Carrinho de Bate-Bate', 12345678901, TIMESTAMP '2024-01-18 10:30:00')
INTO utilizar VALUES('Badoque', 12345678901, TIMESTAMP '2024-01-18 11:30:00')
INTO utilizar VALUES('Trem Fantasma', 12345678901, TIMESTAMP '2024-01-18 12:00:00')
INTO utilizar VALUES('Splash', 12345678901, TIMESTAMP '2024-01-18 14:00:00')
INTO utilizar VALUES('Tiro ao Alvo', 12345678901, TIMESTAMP '2024-01-18 15:00:00')
INTO utilizar VALUES('Castelo Pula-Pula', 12345678902, TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Carrinho de Bate-Bate', 12345678902, TIMESTAMP '2024-01-18 10:30:00')
INTO utilizar VALUES('Badoque', 12345678902, TIMESTAMP '2024-01-18 11:30:00')
INTO utilizar VALUES('Trem Fantasma', 12345678902, TIMESTAMP '2024-01-18 12:00:00')
INTO utilizar VALUES('Splash', 12345678902, TIMESTAMP '2024-01-18 14:00:00')
INTO utilizar VALUES('Montanha Russa', 12345678903, TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Carrossel', 12345678903, TIMESTAMP '2024-01-18 11:00:00')
INTO utilizar VALUES('Thunderbolt', 12345678903, TIMESTAMP '2024-01-18 12:00:00')
INTO utilizar VALUES('Badoque', 12345678903, TIMESTAMP '2024-01-18 13:00:00')
INTO utilizar VALUES('Tiro ao Alvo', 12345678903, TIMESTAMP '2024-01-18 10:00:00')
INTO utilizar VALUES('Splash', 12345678903, TIMESTAMP '2024-01-18 11:30:00')
INTO utilizar VALUES('Trem Fantasma', 12345678903, TIMESTAMP '2024-01-18 13:00:00')
INTO utilizar VALUES('Elefante', 12345678904, TIMESTAMP '2024-06-30 10:00:00')
INTO utilizar VALUES('Castelo Pula-Pula', 12345678904, TIMESTAMP '2024-06-30 11:00:00')
INTO utilizar VALUES('Roda Gigante', 12345678904, TIMESTAMP '2024-06-30 11:30:00')
INTO utilizar VALUES('Carrossel', 12345678904, TIMESTAMP '2024-06-30 12:00:00')
INTO utilizar VALUES('Elefante', 12345678905, TIMESTAMP '2024-06-30 10:00:00')
INTO utilizar VALUES('Roda Gigante', 12345678905, TIMESTAMP '2024-06-30 11:00:00')
INTO utilizar VALUES('Avião Mágico', 12345678905, TIMESTAMP '2024-06-30 11:30:00')
INTO utilizar VALUES('Barca', 12345678905, TIMESTAMP '2024-06-30 12:00:00')
INTO utilizar VALUES('Pandeiro', 38475610293, TIMESTAMP '2024-06-30 10:00:00')
INTO utilizar VALUES('Montanha Russa', 38475610293, TIMESTAMP '2024-06-30 10:30:00')
INTO utilizar VALUES('Thunderbolt', 38475610293, TIMESTAMP '2024-06-30 12:00:00')
INTO utilizar VALUES('Roda Gigante', 38475610293, TIMESTAMP '2024-06-30 12:00:00')
INTO utilizar VALUES('Tiro ao Alvo', 57382910465, TIMESTAMP '2024-06-30 10:00:00')
INTO utilizar VALUES('Pandeiro', 57382910465, TIMESTAMP '2024-06-30 10:30:00')
INTO utilizar VALUES('Roda Gigante', 57382910465, TIMESTAMP '2024-06-30 13:00:00')
INTO utilizar VALUES('Thunderbolt', 57382910465, TIMESTAMP '2024-06-30 13:00:00')
INTO utilizar VALUES('Thunderbolt', 90817264531, TIMESTAMP '2024-06-30 14:00:00')
INTO utilizar VALUES('Roda Gigante', 90817264531, TIMESTAMP '2024-06-30 15:00:00')
INTO utilizar VALUES('Montanha Russa', 90817264531, TIMESTAMP '2024-06-30 16:00:00')
INTO utilizar VALUES('Escalador', 90817264531, TIMESTAMP '2024-06-30 16:30:00')
INTO utilizar VALUES('Trem Fantasma', 21649385702, TIMESTAMP '2024-06-30 13:00:00')
INTO utilizar VALUES('Barca', 21649385702, TIMESTAMP '2024-06-30 14:00:00')
INTO utilizar VALUES('Escalador', 21649385702, TIMESTAMP '2024-06-30 14:30:00')
INTO utilizar VALUES('Tiro ao Alvo', 21649385702, TIMESTAMP '2024-06-30 15:00:00')
INTO utilizar VALUES('Splash', 21649385703, TIMESTAMP '2024-12-29 14:00:00')
INTO utilizar VALUES('Pandeiro', 21649385703, TIMESTAMP '2024-12-29 15:00:00')
INTO utilizar VALUES('Barca', 21649385703, TIMESTAMP '2024-12-29 15:30:00')
INTO utilizar VALUES('Roda Gigante', 21649385703, TIMESTAMP '2024-12-29 16:00:00')
INTO utilizar VALUES('Montanha Russa', 49182706354, TIMESTAMP '2024-06-30 10:00:00')
INTO utilizar VALUES('Carrossel', 49182706354, TIMESTAMP '2024-06-30 11:00:00')
INTO utilizar VALUES('Thunderbolt', 49182706354, TIMESTAMP '2024-06-30 12:00:00')
INTO utilizar VALUES('Avião Mágico', 49182706354, TIMESTAMP '2024-06-30 13:00:00')
INTO utilizar VALUES('Trem Fantasma', 65832049127, TIMESTAMP '2024-07-01 14:00:00')
INTO utilizar VALUES('Barca', 65832049127, TIMESTAMP '2024-07-01 15:00:00')
INTO utilizar VALUES('Escalador', 65832049127, TIMESTAMP '2024-07-01 16:30:00')
INTO utilizar VALUES('Tiro ao Alvo', 65832049127, TIMESTAMP '2024-07-01 17:00:00')
INTO utilizar VALUES('Splash', 98256317528, TIMESTAMP '2024-07-01 13:00:00')
INTO utilizar VALUES('Pandeiro', 98256317528, TIMESTAMP '2024-07-01 14:30:00')
INTO utilizar VALUES('Barca', 98256317528, TIMESTAMP '2024-07-01 15:00:00')
INTO utilizar VALUES('Roda Gigante', 98256317528, TIMESTAMP '2024-07-01 16:00:00')
INTO utilizar VALUES('Carrinho de Bate-Bate', 52178168616, TIMESTAMP '2024-07-01 10:00:00')
INTO utilizar VALUES('Escalador', 12565917706, TIMESTAMP '2024-12-29 10:00:00')
INTO utilizar VALUES('Escalador', 12565917707, TIMESTAMP '2024-12-29 10:00:00')
INTO utilizar VALUES('Pandeiro', 12565917707, TIMESTAMP '2024-12-29 12:00:00')
INTO utilizar VALUES('Elefante', 12565917707, TIMESTAMP '2024-12-29 15:00:00')
INTO utilizar VALUES('Barca', 12565917708, TIMESTAMP '2024-12-29 10:00:00')
INTO utilizar VALUES('Mansão do Terror', 12565917708, TIMESTAMP '2024-12-29 13:00:00')
INTO utilizar VALUES('Avião Mágico', 12565917708, TIMESTAMP '2024-12-29 14:00:00')
INTO utilizar VALUES('Splash', 12565917708, TIMESTAMP '2024-12-29 16:00:00')
INTO utilizar VALUES('Pandeiro', 12565917709, TIMESTAMP '2024-12-29 10:00:00')
INTO utilizar VALUES('Thunderbolt', 12565917709, TIMESTAMP '2024-12-29 11:00:00')
INTO utilizar VALUES('Barca', 12565917709, TIMESTAMP '2024-12-29 11:30:00')
INTO utilizar VALUES('Carrinho de Bate-Bate', 12565917709, TIMESTAMP '2024-12-29 14:00:00')
INTO utilizar VALUES('Pandeiro', 12565917710, TIMESTAMP '2024-06-30 10:00:00')
INTO utilizar VALUES('Roda Gigante', 12565917710, TIMESTAMP '2024-06-30 11:00:00')
INTO utilizar VALUES('Pandeiro', 12565917710, TIMESTAMP '2024-06-30 12:00:00')
INTO utilizar VALUES('Mansão do Terror', 12565917710, TIMESTAMP '2024-06-30 15:00:00')
SELECT 1 FROM dual;

-- Populando a tabela funcionario
INSERT ALL
INTO funcionario VALUES(12345678932, NULL, 'José', 'Oliveira', 'M', 2000.00, DATE '1995-03-25') --operador e supervisor
INTO funcionario VALUES(12344567890, NULL, 'Júlia', 'Silva', 'F', 2000.00, DATE '1990-05-21') --operador e supervisor
INTO funcionario VALUES(44344556781, NULL, 'Barbára', 'Teixeira', 'F', 2000.00, DATE '1998-03-20') --operador e supervisor
INTO funcionario VALUES(00865708463, NULL, 'Alex', 'Rodrigues', 'M', 2000.00, DATE '2002-04-26') --operador e supervisor
INTO funcionario VALUES(12345678956, 12345678932, 'Ana', 'Santos', 'F', 1500.00, DATE '1998-07-25') --operador e supervisionado por 12345678932(José)
INTO funcionario VALUES(12345678978, 12345678932, 'Pedro', 'Ferreira', 'M', 1800.00, DATE '1992-12-30') --operador e supervisionado por 12345678932(José)
INTO funcionario VALUES(12345678999, 12344567890, 'Miguel', 'Santos', 'M', 1700.00, DATE '1988-07-21') --operador e supervisionado por 12344567890(Júlia)
INTO funcionario VALUES(21344556781, 12344567890, 'Pietro', 'Brito', 'M', 1700.00, DATE '1999-07-21') --operador e supervisionado por 12344567890(Júlia)
INTO funcionario VALUES(55662509123, 44344556781, 'Márcio', 'Santos', 'M', 1800.00, DATE '1995-06-25') --operador e supervisionado por 44344556781(Barbára)
INTO funcionario VALUES(31344556781, 12345678932, 'Jorge', 'Lucas', 'M', 1700.00, DATE '2000-05-22') --operador e supervisionado por 12345678932(José)
INTO funcionario VALUES(12345678977, 44344556781, 'Marcone', 'Pereira', 'M', 1800.00, DATE '2000-02-09') -- operador e supervisionado por 44344556781(Barbára)
INTO funcionario VALUES(12345678901, 44344556781, 'Diego', 'Medeiros', 'M', 2000.00, DATE '1996-03-10') --operador e supervisionado por 44344556781(Barbára)
INTO funcionario VALUES(12345678903, 12344567890, 'Kailane', 'Santana', 'F', 1800.00, DATE '1997-06-30') --operador e supervisionado por 44344556781(Bárbara)
INTO funcionario VALUES(31415926535, 00865708463, 'Pierre', 'Eratóstenes', 'M', 2000.00, DATE '1984-05-18') --operador e supervisionado por 00865708463(Alex)
INTO funcionario VALUES(50596374158, 00865708463, 'Harrison', 'Pereira', 'M', 1800.00, DATE '1998-01-01') --operador e supervisionado por 00865708463(Alex)
INTO funcionario VALUES(75315968423, 00865708463, 'Italo', 'Sena', 'M', 1800.00, DATE '1997-07-21') --operador e supervisionado por 00865708463(Alex)
INTO funcionario VALUES(15375964701, 00865708463, 'Fernando', 'Bragança', 'M', 2000.00, DATE '1995-09-18') --operador e supervisionado por 00865708463(Alex)

INTO funcionario VALUES(12155978954, NULL, 'Patrício', 'Petrúcio', 'M', 2200.00, DATE '1978-10-20') --organizador e supervisor
INTO funcionario VALUES(12045665144, NULL, 'Roberta', 'Cândido', 'F', 2200.00, DATE '1981-05-05') --organizador e supervisor
INTO funcionario VALUES(12745278910, NULL, 'Dimitri', 'Lumin', 'M', 2200.00, DATE '1985-04-29') --organizador e supervisor
INTO funcionario VALUES(12345678944, 12155978954, 'Rafael', 'Ferreira', 'M', 2000.00, DATE '2000-12-07') --organizador e supervisionado por 12155978954(Patrício)
INTO funcionario VALUES(12345678915, 12045665144, 'Paula', 'Ferreira', 'F', 2000.00, DATE '2001-08-30') --organizador e supervisionado por 12045665144(Roberta)
INTO funcionario VALUES(13348678906, 12745278910, 'Juliety', 'Pinheiro', 'O', 2000.00, DATE '1999-10-08') --organizador e supervisionado por 12045665144(Dimitri)

INTO funcionario VALUES(12345678955, NULL, 'Lucas', 'Walmir', 'O', 1900.00, DATE '1982-08-22') -- recepcionista e supervisor
INTO funcionario VALUES(12345678996, NULL, 'Mariana', 'Silva', 'F', 2000.00, DATE '1995-03-10') --recepcionista e supervisor
INTO funcionario VALUES(12345678945, 12345678996, 'Lucas', 'Santos', 'M', 1500.00, DATE '1995-06-25') --recepcionista e supervisionado por 12345678996(Mariana)
INTO funcionario VALUES(12345678966, 12345678955, 'Joana', 'Darque', 'F', 1800.00, DATE '1989-03-20') -- recepcionista e supervisionado por 12345678955(Lucas WaLmir)

INTO funcionario VALUES(98421823588, NULL, 'Rafaela', 'Gomes', 'F', 3000.00, DATE '1990-12-21') --vendedor e supervisor
INTO funcionario VALUES(12345678988, 98421823588, 'Pietra', 'Silva', 'F', 1700.00, DATE '1990-07-21') --vendedor e supervisionado por  98421823588(Rafaela)
INTO funcionario VALUES(55123645979, 98421823588, 'David', 'Pierre', 'M', 1700.00, DATE '2000-01-10') --vendedor e supervisionado por 98421823588(Rafaela)
INTO funcionario VALUES(89758702589, 98421823588, 'Rosa', 'Valverde', 'F', 1700.00, DATE '1995-02-28') --vendedor e supervisionado por 98421823588(Rafaela)
INTO funcionario VALUES(49212206713, 98421823588, 'Claudemir', 'Alencar','M', 1700.00, DATE '1987-08-18') --vendedor e supervisionado por 98421823588(Rafaela)
SELECT 1 FROM dual;

-- Populando a tabela operador
INSERT ALL
INTO operador VALUES(12345678932, 'Montanha Russa')
INTO operador VALUES(12345678956, 'Carrossel')
INTO operador VALUES(12345678978, 'Thunderbolt')
INTO operador VALUES(12345678999, 'Badoque')
INTO operador VALUES(12344567890, 'Splash')
INTO operador VALUES(21344556781, 'Barca')
INTO operador VALUES(31344556781, 'Trem Fantasma')
INTO operador VALUES(44344556781, 'Carrinho de Bate-Bate')
INTO operador VALUES(55662509123, 'Elefante')
INTO operador VALUES(12345678901, 'Pandeiro')
INTO operador VALUES(12345678977, 'Roda Gigante')
INTO operador VALUES(12345678903, 'Castelo Pula-Pula')
INTO operador VALUES(00865708463, 'Avião Mágico')
INTO operador VALUES(31415926535, 'Mansão do Terror')
INTO operador VALUES(50596374158, 'Tiro ao Alvo')
INTO operador VALUES(75315968423, 'Escalador')
INTO operador VALUES(15375964701, 'Escorregador')
SELECT 1 FROM dual;

-- Populando a tabela recepcionista
INSERT ALL
INTO recepcionista VALUES (12345678955)
INTO recepcionista VALUES (12345678996)
INTO recepcionista VALUES (12345678945)
INTO recepcionista VALUES (12345678966)
SELECT 1 FROM dual;

-- Populando a tabela organizador
INSERT ALL
INTO organizador VALUES (12155978954)
INTO organizador VALUES (12045665144)
INTO organizador VALUES (12745278910)
INTO organizador VALUES (12345678944)
INTO organizador VALUES (12345678915)
INTO organizador VALUES (13348678906)
SELECT 1 FROM dual;

-- acho que devemos colocar mais organizadores

-- Populando a tabela vendedor
INSERT ALL
INTO vendedor VALUES (98421823588)
INTO vendedor VALUES (12345678988)
INTO vendedor VALUES (55123645979)
INTO vendedor VALUES (89758702589)
INTO vendedor VALUES (49212206713)
SELECT 1 FROM dual;

-- Populando a tabela ingresso
INSERT ALL
INTO ingresso VALUES(1010001, 11234567899, 'inteira', 'dinheiro', DATE '2024-01-18')
INTO ingresso VALUES(1010002, 11234567899, 'meia', 'dinheiro', DATE '2024-01-18')
INTO ingresso VALUES(1010003, 11234567899, 'meia', 'dinheiro', DATE '2024-01-18')
INTO ingresso VALUES(1010004, 11234567899, 'inteira', 'dinheiro', DATE '2024-01-18')
INTO ingresso VALUES(1020001, 79450061382, 'inteira', 'cortesia', DATE '2024-01-18')
INTO ingresso VALUES(1030001, 12345678901, 'inteira', 'pix', DATE '2024-01-18')
INTO ingresso VALUES(1040001, 12345678902, 'meia', 'credito', DATE '2024-01-18')
INTO ingresso VALUES(1050001, 12345678903, 'meia', 'credito', DATE '2024-01-18')
INTO ingresso VALUES(1060001, 12334567789, 'inteira', 'pix', DATE '2024-06-29')
INTO ingresso VALUES(1060002, 12334567789, 'meia', 'pix', DATE '2024-06-29')
INTO ingresso VALUES(1060003, 12334567789, 'inteira', 'pix', DATE '2024-06-29')
INTO ingresso VALUES(1060004, 12334567789, 'inteira', 'pix', DATE '2024-06-29')
INTO ingresso VALUES(1070001, 12234567889, 'meia', 'debito', DATE '2024-06-29')
INTO ingresso VALUES(1070002, 12234567889, 'meia', 'debito', DATE '2024-06-29')
INTO ingresso VALUES(1070003, 12234567889, 'meia', 'debito', DATE '2024-06-29')
INTO ingresso VALUES(1080001, 12345678904, 'inteira', 'dinheiro', DATE '2024-06-30')
INTO ingresso VALUES(1090001, 12345678905, 'inteira', 'pix', DATE '2024-06-30')
INTO ingresso VALUES(1100001, 38475610293, 'meia', 'vale', DATE '2024-06-30')
INTO ingresso VALUES(1110001, 57382910465, 'meia', 'credito', DATE '2024-06-30')
INTO ingresso VALUES(1120001, 90817264531, 'inteira', 'debito', DATE '2024-06-30')
INTO ingresso VALUES(1130001, 21649385702, 'meia', 'credito', DATE '2024-06-30')

--VENDIDO POR DAVID
INTO ingresso VALUES(1150001, 12565917710, 'meia', 'credito', DATE '2024-06-30') --n aparece
INTO ingresso VALUES(1150002, 49182706354, 'meia', 'dinheiro', DATE '2024-06-30')
INTO ingresso VALUES(1160001, 65832049127, 'inteira', 'pix', DATE '2024-07-01')
INTO ingresso VALUES(1170001, 98256317528, 'inteira', 'credito', DATE '2024-07-01')
INTO ingresso VALUES(1180001, 52178168616, 'inteira', 'pix', DATE '2024-07-01')
INTO ingresso VALUES(1190001, 10865917705, 'meia', 'vale', DATE '2024-07-01')

--VENDIDO POR ROSA
INTO ingresso VALUES(1200001, 10965917705, 'meia', 'pix', DATE '2024-07-01')
INTO ingresso VALUES(1210001, 11065917705, 'inteira', 'credito', DATE '2024-07-01')
INTO ingresso VALUES(1220001, 11165917705, 'inteira', 'pix', DATE '2024-07-01')
INTO ingresso VALUES(1230001, 11265917705, 'meia', 'vale', DATE '2024-07-01')
INTO ingresso VALUES(1240001, 11365917705, 'meia', 'pix', DATE '2024-11-15')
INTO ingresso VALUES(1250001, 11465917705, 'meia', 'credito', DATE '2024-11-15')
INTO ingresso VALUES(1260001, 11565917705, 'inteira', 'vale', DATE '2024-11-15')
INTO ingresso VALUES(1270001, 11665917705, 'inteira', 'vale', DATE '2024-11-15')
INTO ingresso VALUES(1280001, 11765917705, 'meia', 'credito', DATE '2024-11-15')
INTO ingresso VALUES(1290001, 11865917705, 'inteira', 'credito', DATE '2024-11-15')
INTO ingresso VALUES(1300001, 11965917705, 'meia', 'vale', DATE '2024-11-15')
INTO ingresso VALUES(1310001, 12065917705, 'meia', 'pix', DATE '2024-11-15')

--VENDIDO POR CLAUDEMIR
INTO ingresso VALUES(1320001, 12165917705, 'meia', 'vale', DATE '2024-11-15')
INTO ingresso VALUES(1330001, 12265917705, 'inteira', 'pix', DATE '2024-12-29')
INTO ingresso VALUES(1340001, 12465917705, 'inteira', 'credito', DATE '2024-12-29')
INTO ingresso VALUES(1350001, 12565917705, 'meia', 'credito', DATE '2024-12-29')
INTO ingresso VALUES(1360001, 12565917706, 'meia', 'vale', DATE '2024-12-29')
INTO ingresso VALUES(1370001, 12565917707, 'inteira', 'pix', DATE '2024-12-29')
INTO ingresso VALUES(1380001, 12565917708, 'meia', 'pix', DATE '2024-12-29')
INTO ingresso VALUES(1390001, 12565917709, 'inteira', 'pix', DATE '2024-12-29')
INTO ingresso VALUES(1400001, 21649385703, 'meia', 'credito', DATE '2024-12-29')
SELECT 1 FROM dual;

-- Populando a tabela compra
CREATE SEQUENCE compra_seq
    START WITH 505100000
    INCREMENT BY 1;

INSERT INTO compra(id, data_compra, valor_total, metodo_pagto)
SELECT compra_seq.NEXTVAL, data_compra, valor_total, metodo_pagto
FROM (
    SELECT DATE '2024-01-18' AS data_compra, 150.25 AS valor_total, 'dinheiro' AS metodo_pagto FROM dual UNION ALL
    SELECT DATE '2024-01-18', 399.99, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-01-18', 505.75, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-01-18', 225.60, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-01-18', 580.45, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-01-18', 1200.50, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-01-18', 670.25, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 320.00, 'dinheiro' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 470.10, 'dinheiro' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 590.85, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 540.55, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 275.30, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 8500.75, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-06-29', 365.70, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 485.90, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 123.45, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 450.00, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 560.35, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 310.25, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 210.50, 'dinheiro' FROM dual UNION ALL
    SELECT DATE '2024-06-30', 399.20, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 575.60, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 530.80, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 2300.80, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 4500.00, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 345.90, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 180.75, 'dinheiro' FROM dual UNION ALL
    SELECT DATE '2024-07-01', 499.99, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 589.10, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 300.00, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 375.25, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 290.80, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 7800.10, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 599.99, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-11-15', 405.50, 'pix' FROM dual UNION ALL
    SELECT DATE '2024-12-29', 14500.30, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-12-29', 540.00, 'debito' FROM dual UNION ALL
    SELECT DATE '2024-12-29', 420.10, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-12-29', 7000.45, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-12-29', 495.70, 'credito' FROM dual UNION ALL
    SELECT DATE '2024-12-29', 310.15, 'dinheiro' FROM dual
);

-- Populando a tabela itens_comprados 
INSERT ALL 
INTO itens_comprados VALUES (505100000, 'Refrigerante')
INTO itens_comprados VALUES (505100000, 'Batata Chips')
INTO itens_comprados VALUES (505100001, 'Pipoca')
INTO itens_comprados VALUES (505100001, 'Algodão Doce')
INTO itens_comprados VALUES (505100002, 'Cachorro-Quente')
INTO itens_comprados VALUES (505100002, 'Sorvete ')
INTO itens_comprados VALUES (505100003, 'Chaveiro Temático')
INTO itens_comprados VALUES (505100003, 'Camiseta')
INTO itens_comprados VALUES (505100004, 'Chapéu de Festa')
INTO itens_comprados VALUES (505100004, 'Bolsa')
INTO itens_comprados VALUES (505100005, 'Imã de Geladeira')
INTO itens_comprados VALUES (505100005, 'Chocolate')
INTO itens_comprados VALUES (505100006, 'Pirulito')
INTO itens_comprados VALUES (505100006, 'Hambúrguer')
INTO itens_comprados VALUES (505100007, 'Pipoca')
INTO itens_comprados VALUES (505100007, 'Suco Natural')
INTO itens_comprados VALUES (505100008, 'Milkshake')
INTO itens_comprados VALUES (505100008, 'Pipoca')
INTO itens_comprados VALUES (505100009, 'Refrigerante')
INTO itens_comprados VALUES (505100010, 'Cartão Postal')
INTO itens_comprados VALUES (505100010, 'Cartão Postal')
INTO itens_comprados VALUES (505100011, 'Balde de Pipoca')
INTO itens_comprados VALUES (505100011, 'Camisa Estampada')
INTO itens_comprados VALUES (505100012, 'Copo Térmico')
INTO itens_comprados VALUES (505100012, 'Boneca')
INTO itens_comprados VALUES (505100013, 'Milkshake')
INTO itens_comprados VALUES (505100013, 'Botton')
INTO itens_comprados VALUES (505100014, 'Refrigerante')
INTO itens_comprados VALUES (505100014, 'Carregador Portátil')
INTO itens_comprados VALUES (505100015, 'Adesivos Temáticos')
INTO itens_comprados VALUES (505100015, 'Caixa de Música')
INTO itens_comprados VALUES (505100016, 'Boneca')
INTO itens_comprados VALUES (505100016, 'Refrigerante')
INTO itens_comprados VALUES (505100017, 'Picolé')
INTO itens_comprados VALUES (505100017, 'Almofada de Pescoço')
INTO itens_comprados VALUES (505100018, 'Protetor Solar')
INTO itens_comprados VALUES (505100018, 'Pulseira Luminosas')
INTO itens_comprados VALUES (505100019, 'Jogo de Tabuleiro')
INTO itens_comprados VALUES (505100019, 'Livro de Colorir')
INTO itens_comprados VALUES (505100020, 'Milkshake')
INTO itens_comprados VALUES (505100020, 'Guarda-Chuva')
INTO itens_comprados VALUES (505100021, 'Milkshake')
INTO itens_comprados VALUES (505100021, 'Churros')
INTO itens_comprados VALUES (505100022, 'Chapéu de Cowboy')
INTO itens_comprados VALUES (505100022, 'Jogo de Tabuleiro')
INTO itens_comprados VALUES (505100023, 'Protetor Solar')
INTO itens_comprados VALUES (505100023, 'Máscara de Super-Herói')
INTO itens_comprados VALUES (505100024, 'Jogo de Tabuleiro')
INTO itens_comprados VALUES (505100024, 'Pipoca')
INTO itens_comprados VALUES (505100025, 'Biscoito de Polvilho')
INTO itens_comprados VALUES (505100025, 'Boneca')
INTO itens_comprados VALUES (505100026, 'Churros')
INTO itens_comprados VALUES (505100026, 'Protetor Solar')
INTO itens_comprados VALUES (505100027, 'Botton')
INTO itens_comprados VALUES (505100027, 'Protetor Solar')
INTO itens_comprados VALUES (505100028, 'Pão de Mel')
INTO itens_comprados VALUES (505100028, 'Kit de Pintura')
INTO itens_comprados VALUES (505100029, 'Churros')
INTO itens_comprados VALUES (505100029, 'Chapéu de Festa')
INTO itens_comprados VALUES (505100030, 'Carrinho de Brinquedo')
INTO itens_comprados VALUES (505100030, 'Protetor Labial')
INTO itens_comprados VALUES (505100031, 'Churros')
INTO itens_comprados VALUES (505100031, 'Capa de Celular')
INTO itens_comprados VALUES (505100032, 'Jogo de Tabuleiro')
INTO itens_comprados VALUES (505100032, 'Protetor Solar')
INTO itens_comprados VALUES (505100033, 'Almofada de Pescoço')
INTO itens_comprados VALUES (505100033, 'Capa de Chuva')
INTO itens_comprados VALUES (505100034, 'Protetor Solar')
INTO itens_comprados VALUES (505100034, 'Botton')
INTO itens_comprados VALUES (505100035, 'Tiara de Princesa')
INTO itens_comprados VALUES (505100035, 'Bolsa')
INTO itens_comprados VALUES (505100036, 'Tiara de Princesa')
INTO itens_comprados VALUES (505100037, 'Camisa Estampada')
INTO itens_comprados VALUES (505100037, 'Churros')
INTO itens_comprados VALUES (505100038, 'Boneca')
INTO itens_comprados VALUES (505100038, 'Botton')
INTO itens_comprados VALUES (505100039, 'Jogo de Tabuleiro')
INTO itens_comprados VALUES (505100039, 'Churros')
INTO itens_comprados VALUES (505100040, 'Bolsa')
SELECT 1 FROM dual;

-- Populando a tabela info_evento
INSERT ALL
INTO info_evento VALUES('Festa Junina', 'família', 'Festa com comidas típicas e brincadeiras')
INTO info_evento VALUES('Festa de Halloween', 'adulto', 'Festa com fantasias e decoração temática')
INTO info_evento VALUES('Festa de Carnaval', 'família', 'Festa com fantasias e desfile de blocos')
INTO info_evento VALUES('Festa de Páscoa', 'infantil', 'Festa com brinquedos e doces')
INTO info_evento VALUES('Festa de Natal', 'família', 'Festa com decoração natalina e presentes')
INTO info_evento VALUES('Stand-up', 'adulto', 'Show de comédia com diversos humoristas')
INTO info_evento VALUES('Show de Palhaços', 'infantil', 'Show de palhaços com brincadeiras e mágicas')
INTO info_evento VALUES('Show de Rock', 'adulto', 'Show de rock com bandas locais')
INTO info_evento VALUES('Show das Princesas', 'infantil', 'Show com personagens de contos de fadas')
INTO info_evento VALUES('Show de Mágica', 'família', 'Show de mágica com diversos truques')
INTO info_evento VALUES('Musical Moana', 'infantil', 'Musical com personagens do filme Moana')
INTO info_evento VALUES('Musical Bambi', 'infantil', 'Musical com personagens do filme Bambi')
SELECT 1 FROM dual;

-- Populando a tabela evento
INSERT ALL 
INTO evento VALUES(12345, 12345678915, 'Festa Junina', 'A','perto do quiosque de cachorro-quente', DATE '2024-06-30')
INTO evento VALUES(11234, 12345678915, 'Festa de Halloween', 'B','ao lado direito do Thunderbolt', DATE '2024-10-31')
INTO evento VALUES(12346, 12345678944, 'Festa de Carnaval', 'C','perto da loja de camisas', DATE '2025-02-28')
INTO evento VALUES(12234, 12345678944, 'Festa de Páscoa', 'E','perto da saída do parque', DATE '2025-04-24')
INTO evento VALUES(12012, 12155978954, 'Festa de Natal', 'D','perto do estacionamento do parque', DATE '2024-12-25')
INTO evento VALUES(12013, 12045665144, 'Stand-up', 'C','perto da entrada do parque', DATE '2024-08-20')
INTO evento VALUES(12114, 12045665144, 'Show de Palhaços', 'E','perto da quiosque de pipoca', DATE '2025-07-01')
INTO evento VALUES(12014, 12745278910, 'Show de Rock', 'A','perto da sorveteria', DATE '2024-11-15')
INTO evento VALUES(12015, 12745278910, 'Show das Princesas', 'B','ao lado do carrossel', DATE '2025-05-22')
INTO evento VALUES(12016, 12155978954, 'Show de Mágica', 'D','perto da entrada do parque', DATE '2024-09-30')
INTO evento VALUES(12017, 13348678906, 'Musical Moana', 'C','perto do quiosque de pipoca', DATE '2025-10-10')
INTO evento VALUES(12018, 13348678906, 'Musical Bambi','E','perto da sorveteria', DATE '2024-03-14')
SELECT 1 FROM dual;

-- Populando a tabela acompanhante
INSERT ALL
INTO acompanhante VALUES(11234567899, 1, 'Adalberto', 'Abreu', 72, 1.67)
INTO acompanhante VALUES(11234567899, 2, 'Márcia', 'Melo', 33, 1.62,)
INTO acompanhante VALUES(11234567899, 3, 'Ariovaldo', 'Astolfo', 48, 1.82)
INTO acompanhante VALUES(12234567889, 1, 'William', 'Wallace', 12, 1.85)
INTO acompanhante VALUES(12234567889, 2, 'Walter', 'White', 40, 1.75)
INTO acompanhante VALUES(12334567789, 1, 'Severina', 'Santos', 67, 1.58)
INTO acompanhante VALUES(12334567789, 2, 'Paula', 'Pereira', 46, 1.63)
INTO acompanhante VALUES(12334567789, 3, 'Plínio', 'Pereira', 8, 1.35)
INTO acompanhante VALUES(79450061382, 1, 'Dom Diego', 'De La Vega', 33, 1.73)
SELECT 1 FROM dual;



-- Populando a tabela aquisicao
INSERT ALL
INTO aquisicao VALUES(1010001, 12345678955) -- INGRESSOS VENDIDOS POR LUCAS WALMIR
INTO aquisicao VALUES(1010002, 12345678955)
INTO aquisicao VALUES(1010003, 12345678955)
INTO aquisicao VALUES(1010004, 12345678955)
INTO aquisicao VALUES(1020001, 12345678955)
INTO aquisicao VALUES(1030001, 12345678955)
INTO aquisicao VALUES(1040001, 12345678955)
INTO aquisicao VALUES(1200001, 12345678955)
INTO aquisicao VALUES(1240001, 12345678955)
INTO aquisicao VALUES(1280001, 12345678955)
INTO aquisicao VALUES(1320001, 12345678955)
INTO aquisicao VALUES(1360001, 12345678955)

INTO aquisicao VALUES(1050001, 12345678996) -- INGRESSOS VENDIDOS POR MARIANA SILVA
INTO aquisicao VALUES(1060001, 12345678996)
INTO aquisicao VALUES(1060002, 12345678996)
INTO aquisicao VALUES(1060003, 12345678996)
INTO aquisicao VALUES(1060004, 12345678996)
INTO aquisicao VALUES(1080001, 12345678996)
INTO aquisicao VALUES(1090001, 12345678996)
INTO aquisicao VALUES(1210001, 12345678996)
INTO aquisicao VALUES(1250001, 12345678996)
INTO aquisicao VALUES(1290001, 12345678996)
INTO aquisicao VALUES(1330001, 12345678996)
INTO aquisicao VALUES(1370001, 12345678996)

INTO aquisicao VALUES(1070001, 12345678945) -- INGRESSOS VENDIDOS POR LUCAS SANTOS
INTO aquisicao VALUES(1070002, 12345678945)
INTO aquisicao VALUES(1070003, 12345678945)
INTO aquisicao VALUES(1100001, 12345678945)
INTO aquisicao VALUES(1110001, 12345678945)
INTO aquisicao VALUES(1120001, 12345678945)
INTO aquisicao VALUES(1220001, 12345678945)
INTO aquisicao VALUES(1260001, 12345678945)
INTO aquisicao VALUES(1300001, 12345678945)
INTO aquisicao VALUES(1340001, 12345678945)
INTO aquisicao VALUES(1380001, 12345678945)

INTO aquisicao VALUES(1130001, 12345678966) -- INGRESSOS VENDIDOS POR JOANA DARQUE
INTO aquisicao VALUES(1150001, 12345678966) 
INTO aquisicao VALUES(1150002, 12345678966) 
INTO aquisicao VALUES(1160001, 12345678966) 
INTO aquisicao VALUES(1170001, 12345678966) 
INTO aquisicao VALUES(1180001, 12345678966) 
INTO aquisicao VALUES(1190001, 12345678966)
INTO aquisicao VALUES(1230001, 12345678966) 
INTO aquisicao VALUES(1270001, 12345678966) 
INTO aquisicao VALUES(1310001, 12345678966) 
INTO aquisicao VALUES(1350001, 12345678966) 
INTO aquisicao VALUES(1390001, 12345678966)  
SELECT 1 FROM dual;

-- Populando a tabela realizar
INSERT ALL
INTO realizar VALUES (505100000, 11234567899, 98421823588) --VENDIDO POR RAFAELA
INTO realizar VALUES (505100001, 79450061382, 98421823588)
INTO realizar VALUES (505100007, 12334567789, 98421823588)
INTO realizar VALUES (505100008, 12234567889, 98421823588)
INTO realizar VALUES (505100017, 12345678904, 98421823588)
INTO realizar VALUES (505100018, 57382910465, 98421823588)
INTO realizar VALUES (505100025, 65832049127, 98421823588)
INTO realizar VALUES (505100032, 11965917705, 98421823588)

INTO realizar VALUES (505100005, 11234567899, 12345678988)  --VENDIDO POR PIETRA
INTO realizar VALUES (505100009, 12334567789, 12345678988)
INTO realizar VALUES (505100010, 12234567889, 12345678988)
INTO realizar VALUES (505100014, 12345678904, 12345678988)
INTO realizar VALUES (505100021, 65832049127, 12345678988)
INTO realizar VALUES (505100028, 11565917705, 12345678988)
INTO realizar VALUES (505100033, 12065917705, 12345678988)
INTO realizar VALUES (505100040, 21649385703, 12345678988)

INTO realizar VALUES (505100003, 12345678901, 55123645979)  --VENDIDO POR DAVID
INTO realizar VALUES (505100006, 12345678903, 55123645979)
INTO realizar VALUES (505100015, 12345678905, 55123645979)
INTO realizar VALUES (505100016, 38475610293, 55123645979)
INTO realizar VALUES (505100011, 12334567789, 55123645979)
INTO realizar VALUES (505100023, 65832049127, 55123645979)
INTO realizar VALUES (505100026, 65832049127, 55123645979)
INTO realizar VALUES (505100037, 12565917705, 55123645979)

INTO realizar VALUES (505100004, 12345678902, 89758702589) --VENDIDO POR ROSA
INTO realizar VALUES (505100012, 12334567789, 89758702589)
INTO realizar VALUES (505100013, 12234567889, 89758702589)
INTO realizar VALUES (505100020, 90817264531, 89758702589)
INTO realizar VALUES (505100022, 65832049127, 89758702589)
INTO realizar VALUES (505100024, 65832049127, 89758702589)
INTO realizar VALUES (505100027, 65832049127, 89758702589)
INTO realizar VALUES (505100035, 12265917705, 89758702589)
INTO realizar VALUES (505100039, 12565917708, 89758702589)

INTO realizar VALUES (505100002, 12345678901, 49212206713) --VENDIDO POR CLAUDEMIR
INTO realizar VALUES (505100019, 21649385702, 49212206713)
INTO realizar VALUES (505100029, 11365917705, 49212206713)
INTO realizar VALUES (505100030, 11665917705, 49212206713)
INTO realizar VALUES (505100031, 11865917705, 49212206713)
INTO realizar VALUES (505100034, 12165917705, 49212206713)
INTO realizar VALUES (505100036, 12465917705, 49212206713)
INTO realizar VALUES (505100038, 12565917707, 49212206713)
SELECT 1 FROM dual;
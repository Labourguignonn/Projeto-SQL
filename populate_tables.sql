-- Populando a tabela visitante
INSERT INTO visitante (cpf, nome, sobrenome, sexo, altura, data_de_nascimento)
VALUES 
    (11234567899, 'João', 'Silva', 'M', 1.75, DATE '1990-01-01'),
    (12234567889, 'Maria', 'Souza', 'F', 1.65, DATE '1985-05-20'),
    (12334567789, 'Carlos', 'Pereira', 'M', 1.80, DATE '1978-11-15'),
    (79450061382, 'Júnior', 'Bocão', 'M', 1.86, DATE '1965-03-26');

-- Populando a tabela atracao
INSERT INTO atracao (nome_atr, categoria, limite_max, idade_min, altura_min)
VALUES 
    ('Montanha Russa', 'radical', 20, 12, 1.50),
    ('Carrossel', 'família', 30, 0, 1.00),
    ('Thunderbolt', 'radical', 10, 0, 1.50);

-- Populando a tabela funcionario
INSERT INTO funcionario (cpf, supervisor, nome, sobrenome, sexo, salário, data_de_nascimento)
VALUES 
    (12345678932, NULL, 'José', 'Oliveira', 'M', 2000.00, DATE '1995-03-25'),
    (12345678956, 1, 'Ana', 'Santos', 'F', 1500.00, DATE '1998-07-25'),
    (12345678978, 4, 'Pedro', 'Ferreira', 'M', 1800.00, DATE '1992-12-30'),
    (12345678996, NULL, 'Mariana', 'Silva', 'F', 2000.00, DATE '1995-03-10'),
    (12345678945, 6, 'Lucas', 'Santos', 'M', 1500.00, DATE '1995-06-25'),
    (12345678915, 4, 'Paula', 'Ferreira', 'F', 1800.00, DATE '1990-08-30'),
    (12345678944, 7, 'Rafael', 'Ferreira', 'M', 1800.00, DATE '1990-12-30');
    (12345678955, 1, 'Rafaela', 'Gomes', 'M', 1800.00, DATE '1990-12-21');
    (12345678988, 1, 'Pietra', 'Silva', 'M', 1700.00, DATE '1990-07-21');


Populando a tabela operador
INSERT INTO operador (cpf_func, atracao)
VALUES 
   (12345678932, 'Montanha Russa'),
  (12345678956, 'Carrossel'),
   (12345678978, 'Thunderbolt');

Populando a tabela recepcionista
INSERT INTO recepcionista (cpf_func)
VALUES 
   (12345678996),
   (12345678945);

Populando a tabela organizador
INSERT INTO organizador (cpf_func)
VALUES 
   (12345678915),
   (12345678944);
acho que devemos colocar mais organizadores

Populando a tabela vendedor
INSERT INTO vendedor (cpf_func)
VALUES 
   (12345678955),
   (12345678988);

-- Populando a tabela ingresso
INSERT INTO ingresso (codigo, cpf_visitante, tipo_de_ingresso, metodo_pagto, data_compra)
VALUES 
    (1, 11234567899, 'meia', 'dinheiro', DATE '2021-01-01'),
    (2, 12234567889, 'inteira', 'cartao de credito', DATE '2021-01-02'),
    (3, 12334567789, 'inteira', 'cartao de debito', DATE '2021-01-03');
    
-- Populando a tabela compra
INSERT INTO compra (id, data_compra, valor_total, metodo_pagto)
VALUES 
    (1, DATE '2021-01-01', 50.00, 'dinheiro'),
    (2, DATE '2021-01-02', 70.00, 'cartao de credito'),
    (3, DATE '2021-01-03', 100.00, 'cartao de debito');

-- Populando a tabela itens_comprados 
INSERT INTO itens_comprados (id_compra, nome_item)
VALUES 
    (1, 'Bola'), 
    (2, 'Pipoca salgada'), 
    (3, 'Camiseta');

-- Populando a tabela localidade 
INSERT INTO localidade (zona, complemento)
VALUES 
    ('A', 'perto da loja de compras'), 
    ('B', 'perto do banheiro'), 
    ('E', 'perto da saída');

-- Populando a tabela evento
INSERT INTO evento (id, organizador, localidade, nome, data_do_evento, publico_alvo, descricao)
VALUES 
    (1, 12345678915, 'A', 'Festa Junina', DATE '2021-06-22', 'família', 'Festa com comidas típicas e brincadeiras'),
    (2, 12345678915, 'B', 'Festa de Halloween', DATE '2021-10-31', 'adulto', 'Festa com fantasias e decoração temática'),
    (3, 12345678944, 'E', 'Festa de Páscoa', DATE '2021-04-24', 'infantil', 'Festa com brinquedos e doces');

-- Populando a tabela acompanhante
INSERT INTO acompanhante (cpf_visitante, num_acompanhante, nome, sobrenome, idade, altura)
VALUES
    (11234567899, 1, 'Adalberto', 'Abreu', 72, 1.67),
    (11234567899, 2, 'Márcia', 'Melo', 33, 1.62),
    (11234567899, 3, 'Ariovaldo', 'Astolfo', 48, 1.82),
    (12234567889, 1, 'William', 'Wallace', 12, 1.85),
    (12234567889, 2, 'Walter', 'White', 40, 1.75),
    (12334567789, 1, 'Severina', 'Santos', 67, 1.58),
    (12334567789, 2, 'Paula', 'Pereira', 46, 1.63),
    (12334567789, 3, 'Plínio', 'Pereira', 8, 1.35),
    (79450061382, 1, 'Dom Diego', 'De La Vega', 33, 1.73);

-- Populando a tabela aquisicao
INSERT INTO aquisicao (cod_ingresso, cpf_visitante, cpf_recepcionista)
VALUES 
    (1, 11234567899, 12345678996),
    (2, 12234567889, 12345678945),
    (3, 12334567789, 12345678996);

-- Populando a tabela participar 
INSERT INTO participar (cpf_visitante, id_evento)
VALUES 
    (11234567899, 1),
    (12234567889, 2),
    (12334567789, 3);

-- Populando a tabela realizar
INSERT INTO realizar (compra, visitante, vendedor)
VALUES 
    (1, 11234567899, 12345678955),
    (2, 12234567889, 12345678988),
    (3, 12334567789, 12345678955);

DROP TABLE visitante;
DROP TABLE atracao;
DROP TABLE funcionario;
DROP TABLE operador;
DROP TABLE recepcionista;
DROP TABLE organizador;
DROP TABLE vendedor;
DROP TABLE ingresso;
DROP TABLE compra;
DROP TABLE itens_comprados;
DROP TABLE info_evento;
DROP TABLE evento;
DROP TABLE acompanhante;
DROP TABLE aquisicao;
DROP TABLE utilizar;
DROP TABLE realizar;

CREATE TABLE visitante (
    cpf NUMBER(11), -- Nomes diferentes para tabelas diferentes?
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    sexo VARCHAR2(1) CHECK (sexo IN ('M', 'F', 'O')), -- M,F,O(other)
    altura DECIMAL(3,2) CHECK (altura > 0),
    data_de_nascimento DATE NOT NULL,
    CONSTRAINT visitante_pk PRIMARY KEY (cpf)
);

CREATE TABLE atracao (
    nome_atracao VARCHAR2(30),
    categoria VARCHAR2(8) NOT NULL CHECK (categoria IN ('radical', 'família', 'infantil')), -- as opções são: "radical", "família", "infantil"
    limite_max NUMBER, 
    idade_min NUMBER NULL,
    altura_min DECIMAL(3,2),
    CONSTRAINT atracao_pk PRIMARY KEY (nome_atracao)
);

CREATE TABLE funcionario (
    cpf NUMBER(11), --Nomes diferentes para tabelas diferentes?
    cpf_supervisor NUMBER(11) NULL, -- CPF do supervisor deste funcionário, NULL caso ele não possua supervisor
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    sexo VARCHAR2(1) CHECK (sexo IN ('M', 'F', 'O')), 
    salário DECIMAL(8,2), -- consideramos q o máx do salário é 999.999,99
    data_de_nascimento DATE NOT NULL,
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES funcionario (cpf),
    CONSTRAINT funcionario_supervisor_check CHECK (cpf <> cpf_supervisor) --ver se isso funciona
);

CREATE TABLE operador (
    cpf_funcionario NUMBER(11), 
    atracao VARCHAR2(30),
    CONSTRAINT operador_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT operador_cpf_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf),
    CONSTRAINT operador_atracao_fk FOREIGN KEY (atracao) REFERENCES atracao (nome_atracao)
);

CREATE TABLE recepcionista (
    cpf_funcionario NUMBER(11), 
    CONSTRAINT recepcionista_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT recepcionista_cpf_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf)
);

CREATE TABLE organizador (
    cpf_funcionario NUMBER(11), 
    CONSTRAINT organizador_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT organizador_cpf_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf)
);

CREATE TABLE vendedor (
    cpf_funcionario NUMBER(11), 
    CONSTRAINT vendedor_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT vendedor_cpf_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf)
);

CREATE TABLE ingresso (
    codigo NUMBER(7),
    cpf_visitante NUMBER(11),
    tipo_de_ingresso VARCHAR2(8) CHECK (tipo_de_ingresso IN ('meia', 'inteira')), -- as opções são: "meia", "inteira", "cortesia"
    metodo_pagto VARCHAR2(8) CHECK (metodo_pagto IN ('pix', 'dinheiro', 'credito', 'debito', 'vale', 'cortesia')), -- as opções são: "pix", "dinheiro", "cartao de credito", "cartao de debito"
    data_compra DATE NOT NULL,
    CONSTRAINT ingresso_pk PRIMARY KEY (codigo),
    CONSTRAINT ingresso_cpf_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf)
);

CREATE TABLE compra (
    id NUMBER(9),
    data_compra DATE NOT NULL,
    valor_total DECIMAL(7,2), -- consideramos q o máx do valor_total é 99.999,99
    metodo_pagto VARCHAR2(17) CHECK (metodo_pagto IN ('pix', 'dinheiro', 'credito', 'debito', 'vale')), -- consideramos a maior string como "cartao de credito"
    CONSTRAINT compra_pk PRIMARY KEY (id)
);

CREATE TABLE itens_comprados (
    id_compra NUMBER(9),
    nome_item VARCHAR2(35),
    CONSTRAINT itens_comprados_pk PRIMARY KEY (id_compra, nome_item),
    CONSTRAINT itens_comprados_id_compra_fk FOREIGN KEY (id_compra) REFERENCES compra (id)
);

CREATE TABLE info_evento (
    nome VARCHAR2(50),
    publico_alvo VARCHAR2(8) CHECK (publico_alvo IN ('família', 'infantil', 'adulto')), -- as opções são: "família", "infantil", "adulto"
    descricao VARCHAR2(60) NULL,
    CONSTRAINT info_evento_pk PRIMARY KEY (nome)
);

CREATE TABLE evento (
    id NUMBER(5),
    organizador NUMBER(11), -- CPF do organizador
    info_evento VARCHAR2(50),
    zona VARCHAR2(1) CHECK (zona IN ('A', 'B', 'C', 'D', 'E')), -- as opções são: "A", "B", "C", "D" ou "E" -- zona do evento
    complemento VARCHAR2(60), -- complemento do evento
    data_evento DATE NOT NULL,
    CONSTRAINT evento_pk PRIMARY KEY (id),
    CONSTRAINT evento_organizador_fk FOREIGN KEY (organizador) REFERENCES organizador (cpf_funcionario),
    CONSTRAINT evento_info_evento_fk FOREIGN KEY (info_evento) REFERENCES info_evento (nome)
);

CREATE TABLE acompanhante (
    cpf_visitante NUMBER(11),
    num_acompanhante NUMBER(2), -- consideramos que ninguém vai levar mais que 99 acompanhantes
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    idade NUMBER,
    altura DECIMAL(3,2) CHECK (altura > 0),
    CONSTRAINT acompanhante_pk PRIMARY KEY (cpf_visitante, num_acompanhante),
    CONSTRAINT acompanhante_cpf_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf)
);

CREATE TABLE aquisicao(
    cod_ingresso NUMBER(7), -- id do ingresso
    cpf_recepcionista NUMBER(11), 
    CONSTRAINT aquisicao_pk PRIMARY KEY (cod_ingresso),
    CONSTRAINT aquisicao_cod_ingresso_fk FOREIGN KEY (cod_ingresso) REFERENCES ingresso (codigo),
    CONSTRAINT aquisicao_cpf_recepcionista_fk FOREIGN KEY (cpf_recepcionista) REFERENCES recepcionista (cpf_funcionario)
);

CREATE TABLE utilizar(
    nome_atracao VARCHAR2(30), -- nome da atração
    cpf_visitante NUMBER(11), -- CPF do visitante
    horario TIMESTAMP, 
    CONSTRAINT utilizar_pk PRIMARY KEY (nome_atracao, cpf_visitante, horario),
    CONSTRAINT utilizar_atracao_fk FOREIGN KEY (nome_atracao) REFERENCES atracao (nome_atracao),
    CONSTRAINT utilizar_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf)
);

CREATE TABLE realizar(
    id_compra NUMBER(9), -- id da compra
    cpf_visitante NUMBER(11), -- CPF do visitante
    cpf_vendedor NUMBER(11), -- CPF do funcionário vendedor
    CONSTRAINT realizar_pk PRIMARY KEY (id_compra),
    CONSTRAINT realizar_compra_fk FOREIGN KEY (id_compra) REFERENCES compra (id),
    CONSTRAINT realizar_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf),
    CONSTRAINT realizar_vendedor_fk FOREIGN KEY (cpf_vendedor) REFERENCES vendedor (cpf_funcionario)
);
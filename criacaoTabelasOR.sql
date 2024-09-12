/* criar tabelas OR */

CREATE TYPE visitante_t AS OBJECT (
    cpf NUMBER(11),
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    sexo VARCHAR2(1),
    altura DECIMAL(3,2),
    data_de_nascimento DATE,
    telefones telefone_varray_t,  -- VARRAY para armazenar os telefones

    MEMBER FUNCTION idade RETURN NUMBER
);

--FOI CRIADO O TELEFONES TEM QUE MUDAR NO MINIMUNDO E NO DIAGRAMA
CREATE TABLE visitante_obj_table OF visitante_t (
    CONSTRAINT visitante_pk PRIMARY KEY (cpf)
);

-- Definir uma função membro para calcular a idade do visitante
CREATE OR REPLACE TYPE BODY visitante_t IS
    MEMBER FUNCTION idade RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, data_de_nascimento) / 12);
    END;
END;

--Conferir se está correto 

INSERT INTO visitante_obj_table
VALUES (
    visitante_t(11234567899, 'João', 'Silva', 'M', 1.75, DATE '1990-01-01',
        telefone_varray_t(telefone_t('99999-9999'), telefone_t('88888-8888'))
    )
);

CREATE TYPE atracao_t AS OBJECT (
    nome_atracao VARCHAR2(30),
    categoria VARCHAR2(8),
    limite_max NUMBER,
    idade_min NUMBER,
    altura_min DECIMAL(3,2)
);

CREATE TABLE atracao_obj_table OF atracao_t (
    CONSTRAINT atracao_pk PRIMARY KEY (nome_atracao)
);

CREATE TYPE funcionario_t AS OBJECT (
    cpf NUMBER(11),
    cpf_supervisor NUMBER(11),
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    sexo VARCHAR2(1),
    salario DECIMAL(8,2),
    data_de_nascimento DATE
)NOT FINAL;

CREATE TABLE funcionario_obj_table OF funcionario_t (
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES funcionario_obj_table (cpf),
    CONSTRAINT funcionario_supervisor_check CHECK (cpf <> cpf_supervisor)
);

CREATE OR REPLACE TYPE operador_t UNDER funcionario_t(
    atracao VARCHAR2(30)
);

CREATE TABLE operador_obj_table OF operador_t (
    CONSTRAINT operador_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT operador_cpf_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario_obj_table (cpf),
    CONSTRAINT operador_atracao_fk FOREIGN KEY (atracao) REFERENCES atracao_obj_table (nome_atracao)
);


CREATE OR REPLACE TYPE recepcionista_t UNDER funcionario_t();

CREATE TABLE recepcionista_obj_table OF recepcionista_t(
    CONSTRAINT fk_recepcionista_funcionario FOREIGN
    KEY (cpf)
)

CREATE TABLE recepcionista_obj_table OF recepcionista_t (
    CONSTRAINT recepcionista_pk PRIMARY KEY (cpf),
    CONSTRAINT recepcionista_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES funcionario_obj_table (cpf),
    CONSTRAINT recepcionista_supervisor_check CHECK (cpf <> cpf_supervisor)
);

CREATE OR REPLACE TYPE organizador_t UNDER funcionario_t();

CREATE TABLE organizador_obj_table OF organizador_t (
    CONSTRAINT organizador_pk PRIMARY KEY (cpf),
    CONSTRAINT organizador_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES funcionario_obj_table (cpf),
    CONSTRAINT organizador_supervisor_check CHECK (cpf <> cpf_supervisor)
);

CREATE OR REPLACE TYPE vendedor_t UNDER funcionario_t();

CREATE TABLE vendedor_obj_table OF vendedor_t (
    CONSTRAINT vendedor_pk PRIMARY KEY (cpf),
    CONSTRAINT vendedor_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES funcionario_obj_table (cpf),
    CONSTRAINT vendedor_supervisor_check CHECK (cpf <> cpf_supervisor)
);

CREATE TYPE ingresso_t AS OBJECT (
    id_ingresso NUMBER,
    data_compra DATE,
    valor DECIMAL(8,2),
    visitante REF visitante_t,
    vendedor REF vendedor_t
);

CREATE TABLE ingresso_obj_table OF ingresso_t (
    CONSTRAINT ingresso_pk PRIMARY KEY (id_ingresso),
    CONSTRAINT ingresso_visitante_fk FOREIGN KEY (visitante) REFERENCES visitante_obj_table,
    CONSTRAINT ingresso_vendedor_fk FOREIGN KEY (vendedor) REFERENCES vendedor_obj_table
);

CREATE TYPE compra_t AS OBJECT (
    id NUMBER(9),
    data_compra DATE,
    valor_total DECIMAL(8,2),
    metodo_pagto VARCHAR2(17),
    itens_comprados itens_comprados_varray_t
);

CREATE TABLE compra_obj_table OF compra_t (
    CONSTRAINT compra_pk PRIMARY KEY (id_compra)
);

CREATE TYPE itens_comprados_t AS OBJECT (
    id_compra NUMBER(9),
    nome_item VARCHAR2(35)
);

CREATE TYPE itens_comprados_varray_t AS VARRAY(10) OF itens_comprados_t;

CREATE TABLE itens_comprados_obj_table OF itens_comprados_t (
    CONSTRAINT itens_comprados_pk PRIMARY KEY (nome_item)
);

CREATE TYPE info_evento_t AS OBJECT (
    nome VARCHAR2(50),
    publico_alvo VARCHAR2(8) CHECK (publico_alvo IN ('família', 'infantil', 'adulto'))
);


CREATE TABLE info_evento_obj_table OF info_evento_t (
    CONSTRAINT info_evento_pk PRIMARY KEY (nome)
);

CREATE TYPE evento_t AS OBJECT (
    id NUMBER(5),
    organizador REF organizador_t, --ver se ta certo
    info_evento REF info_evento_t, --ver se ta certo
    zona VARCHAR2(1) CHECK (zona IN ('A', 'B', 'C', 'D', 'E')), -- as opções são: "A", "B", "C", "D" ou "E" -- zona do evento
    complemento VARCHAR2(60), -- complemento do evento
    data_evento DATE NOT NULL
);

CREATE TABLE evento_obj_table OF evento_t (
    CONSTRAINT evento_pk PRIMARY KEY (id),
    CONSTRAINT evento_organizador_fk FOREIGN KEY (organizador) REFERENCES organizador_obj_table,
    CONSTRAINT evento_info_evento_fk FOREIGN KEY (info_evento) REFERENCES info_evento_obj_table
);

CREATE TYPE acompanhante_t AS OBJECT (
    cpf_visitante NUMBER(11)
    num_acompanhantes NUMBER(2)
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    idade NUMBER,
    altura DECIMAL(3,2) CHECK (altura > 0), 

);

CREATE TABLE acompanhante_obj_table OF acompanhante_t (
    CONSTRAINT acompanhante_pk PRIMARY KEY (cpf_visitante, num_acompanhantes)
);

-- FICOU FALTANDO CRIAR AQUISICAO, UTILIZAR E REALIZAR 








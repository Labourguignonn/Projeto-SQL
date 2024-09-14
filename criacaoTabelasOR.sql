/* criar tabelas OR */

CREATE OR REPLACE TYPE tp_nomeCompleto AS OBJECT (
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_visitante AS OBJECT (
    cpf NUMBER(11),
    nome_completo tp_nomeCompleto,
    sexo VARCHAR2(1),
    altura DECIMAL(3,2),
    data_de_nascimento DATE,
    telefones tp_telefone_varray,  -- VARRAY para armazenar os telefones

    MEMBER FUNCTION idade RETURN NUMBER
) FINAL;
/

-- Definir uma função membro para calcular a idade do visitante
CREATE OR REPLACE TYPE BODY tp_visitante AS
    MEMBER FUNCTION idade RETURN NUMBER IS
    BEGIN
        RETURN TRUNC(MONTHS_BETWEEN(SYSDATE, data_de_nascimento) / 12);
    END;
END;
/

--FOI CRIADO O TELEFONES TEM QUE MUDAR NO MINIMUNDO E NO DIAGRAMA
CREATE TABLE tb_visitante OF tp_visitante (
    CONSTRAINT visitante_pk PRIMARY KEY (cpf)
);

INSERT INTO tb_visitante VALUES (
    tp_visitante(11234567899, 'João', 'Silva', 'M', 1.75, DATE '1990-01-01',
    tp_telefone_varray(tp_telefone('99999-9999'), tp_telefone('88888-8888'))
    )
);

CREATE OR REPLACE TYPE tp_atracao AS OBJECT (
    nome_atracao VARCHAR2(30),
    categoria VARCHAR2(8),
    limite_max NUMBER,
    idade_min NUMBER,
    altura_min DECIMAL(3,2)
);
/

CREATE TABLE tb_atracao OF tp_atracao (
    CONSTRAINT atracao_pk PRIMARY KEY (nome_atracao)
);

CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    cpf NUMBER(11),
    cpf_supervisor NUMBER(11),
    nome_completo tp_nomeCompleto,
    sexo VARCHAR2(1),
    salario DECIMAL(8,2),
    data_de_nascimento DATE,
    NOT INSTANTIABLE MEMBER PROCEDURE exibir_info(SELF tp_funcionario)
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_funcionario AS
    MEMBER PROCEDURE exibir_info(SELF tp_funcionario) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Informações do Funcionário');
        DBMS_OUTPUT.PUT_LINE('CPF: ' || TO_CHAR(cpf));
        DBMS_OUTPUT.PUT_LINE('Nome Completo: ' || nome_completo.nome || ' ' || nome_completo.sobrenome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(data_de_nascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Salário: R$' || TO_CHAR(salario, '999999.99'));
        DBMS_OUTPUT.PUT_LINE('Supervisor: ' || NVL(TO_CHAR(cpf_supervisor), 'Sem Supervisor'));
    END;
END;
/

CREATE TABLE tb_funcionario OF tp_funcionario (
    CONSTRAINT funcionario_pk PRIMARY KEY (cpf),
    CONSTRAINT funcionario_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES tb_funcionario (cpf),
    CONSTRAINT funcionario_supervisor_check CHECK (cpf <> cpf_supervisor)
);

-- Criação do tipo operador, do corpo do tipo e da tabela
CREATE OR REPLACE TYPE tp_operador UNDER tp_funcionario (
    atracao VARCHAR2(30),
    CONSTRUCTOR FUNCTION tp_operador(f tp_funcionario) RETURN SELF AS RESULT,
    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_operador)
) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_operador AS
    CONSTRUCTOR FUNCTION tp_operador(f tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        cpf := f.cpf;
        cpf_supervisor := f.cpf_supervisor;
        nome_completo := f.nome_completo;
        sexo := f.sexo;
        salario := f.salario;
        data_de_nascimento := f.data_de_nascimento;
        RETURN SELF;
    END;

    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_operador) IS  -- Corrigido o tipo de SELF
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Informações do Operador');
        DBMS_OUTPUT.PUT_LINE('CPF: ' || TO_CHAR(cpf));
        DBMS_OUTPUT.PUT_LINE('Nome Completo: ' || nome_completo.nome || ' ' || nome_completo.sobrenome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(data_de_nascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Salário: ' || 'R$' || TO_CHAR(salario, '999999.99'));  -- Formatação ajustada
        DBMS_OUTPUT.PUT_LINE('Atração Operada: ' || atracao);
        DBMS_OUTPUT.PUT_LINE('Supervisor: ' || NVL(TO_CHAR(cpf_supervisor), 'Não possui supervisor'));  -- Ajustado cpf_supervisor
    END;
END;
/

CREATE TABLE tb_operador OF tp_operador (
    CONSTRAINT operador_pk PRIMARY KEY (cpf_funcionario),
    CONSTRAINT operador_cpf_fk FOREIGN KEY (cpf_funcionario) REFERENCES tb_funcionario (cpf),
    CONSTRAINT operador_atracao_fk FOREIGN KEY (atracao) REFERENCES tb_atracao (nome_atracao)
);

-- Criação do tipo recepcionista, do corpo do tipo e da tabela
CREATE OR REPLACE TYPE tp_recepcionista UNDER tp_funcionario (
    CONSTRUCTOR FUNCTION tp_recepcionista(f tp_funcionario) RETURN SELF AS RESULT,
    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_recepcionista)
) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_recepcionista AS
    CONSTRUCTOR FUNCTION tp_recepcionista(f tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        cpf := f.cpf;
        cpf_supervisor := f.cpf_supervisor;
        nome_completo := f.nome_completo;
        sexo := f.sexo;
        salario := f.salario;
        data_de_nascimento := f.data_de_nascimento;
        RETURN SELF;
    END;

    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_recepcionista) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Informações do Recepcionista');
        DBMS_OUTPUT.PUT_LINE('CPF: ' || TO_CHAR(cpf));
        DBMS_OUTPUT.PUT_LINE('Nome Completo: ' || nome_completo.nome || ' ' || nome_completo.sobrenome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(data_de_nascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Salário: ' || 'R$' || TO_CHAR(salario, '999999.99'));  -- Formatação ajustada
        DBMS_OUTPUT.PUT_LINE('Supervisor: ' || NVL(TO_CHAR(cpf_supervisor), 'Não possui supervisor'));  -- Ajustado cpf_supervisor
    END;
END;
/

CREATE TABLE tb_recepcionista OF tp_recepcionista (
    CONSTRAINT recepcionista_pk PRIMARY KEY (cpf),
    CONSTRAINT recepcionista_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES tb_funcionario (cpf),
    CONSTRAINT recepcionista_supervisor_check CHECK (cpf <> cpf_supervisor)
);

-- Criação do tipo organizador, do corpo do tipo e da tabela
CREATE OR REPLACE TYPE tp_organizador UNDER tp_funcionario (
    CONSTRUCTOR FUNCTION tp_organizador(f tp_funcionario) RETURN SELF AS RESULT,
    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_organizador)
) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_organizador AS
    CONSTRUCTOR FUNCTION tp_organizador(f tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        cpf := f.cpf;
        cpf_supervisor := f.cpf_supervisor;
        nome_completo := f.nome_completo;
        sexo := f.sexo;
        salario := f.salario;
        data_de_nascimento := f.data_de_nascimento;
        RETURN SELF;
    END;

    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_organizador) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Informações do Organizador');
        DBMS_OUTPUT.PUT_LINE('CPF: ' || TO_CHAR(cpf));
        DBMS_OUTPUT.PUT_LINE('Nome Completo: ' || nome_completo.nome || ' ' || nome_completo.sobrenome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(data_de_nascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Salário: ' || 'R$' || TO_CHAR(salario, '999999.99'));  -- Formatação ajustada
        DBMS_OUTPUT.PUT_LINE('Supervisor: ' || NVL(TO_CHAR(cpf_supervisor), 'Não possui supervisor'));  -- Ajustado cpf_supervisor
    END;
END;
/

CREATE TABLE tb_organizador OF tp_organizador (
    CONSTRAINT organizador_pk PRIMARY KEY (cpf),
    CONSTRAINT organizador_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES tb_funcionario (cpf),
    CONSTRAINT organizador_supervisor_check CHECK (cpf <> cpf_supervisor)
);

-- Criação do tipo vendedor, do corpo do tipo e da tabela
CREATE OR REPLACE TYPE tp_vendedor UNDER tp_funcionario (
    CONSTRUCTOR FUNCTION tp_vendedor(f tp_funcionario) RETURN SELF AS RESULT,
    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_vendedor)
) FINAL;
/

CREATE OR REPLACE TYPE BODY tp_vendedor AS
    CONSTRUCTOR FUNCTION tp_vendedor(f tp_funcionario) RETURN SELF AS RESULT IS
    BEGIN
        cpf := f.cpf;
        cpf_supervisor := f.cpf_supervisor;
        nome_completo := f.nome_completo;
        sexo := f.sexo;
        salario := f.salario;
        data_de_nascimento := f.data_de_nascimento;
        RETURN SELF;
    END;

    OVERRIDING MEMBER PROCEDURE exibir_info(SELF tp_vendedor) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Informações do Vendedor');
        DBMS_OUTPUT.PUT_LINE('CPF: ' || TO_CHAR(cpf));
        DBMS_OUTPUT.PUT_LINE('Nome Completo: ' || nome_completo.nome || ' ' || nome_completo.sobrenome);
        DBMS_OUTPUT.PUT_LINE('Sexo: ' || sexo);
        DBMS_OUTPUT.PUT_LINE('Data de Nascimento: ' || TO_CHAR(data_de_nascimento, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('Salário: ' || 'R$' || TO_CHAR(salario, '999999.99'));  -- Formatação ajustada
        DBMS_OUTPUT.PUT_LINE('Supervisor: ' || NVL(TO_CHAR(cpf_supervisor), 'Não possui supervisor'));  -- Ajustado cpf_supervisor
    END;
END;
/

CREATE TABLE tb_vendedor OF tp_vendedor (
    CONSTRAINT vendedor_pk PRIMARY KEY (cpf),
    CONSTRAINT vendedor_supervisor_fk FOREIGN KEY (cpf_supervisor) REFERENCES tb_funcionario (cpf),
    CONSTRAINT vendedor_supervisor_check CHECK (cpf <> cpf_supervisor)
);

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT (
    id_ingresso NUMBER,
    data_compra DATE,
    valor DECIMAL(8,2),
    visitante REF tp_visitante,
    vendedor REF tp_vendedor
);
/

CREATE TABLE tb_ingresso OF tp_ingresso (
    CONSTRAINT ingresso_pk PRIMARY KEY (id_ingresso),
    CONSTRAINT ingresso_visitante_fk FOREIGN KEY (visitante) REFERENCES tb_visitante,
    CONSTRAINT ingresso_vendedor_fk FOREIGN KEY (vendedor) REFERENCES tb_vendedor
);

CREATE OR REPLACE TYPE tp_compra AS OBJECT (
    id NUMBER(9),
    data_compra DATE,
    valor_total DECIMAL(8,2),
    metodo_pagto VARCHAR2(17),
    itens_comprados tp_itens_comprados_varray
);
/

CREATE TABLE tb_compra OF tp_compra (
    CONSTRAINT compra_pk PRIMARY KEY (id_compra)
);

CREATE OR REPLACE TYPE tp_itens_comprados AS OBJECT (
    id_compra NUMBER(9),
    nome_item VARCHAR2(35)
);
/

CREATE TYPE tp_itens_comprados_varray AS VARRAY(10) OF tp_itens_comprados;

CREATE TABLE tb_itens_comprados OF tp_itens_comprados (
    CONSTRAINT itens_comprados_pk PRIMARY KEY (nome_item)
);

CREATE TYPE tp_info_evento AS OBJECT (
    nome VARCHAR2(50),
    publico_alvo VARCHAR2(8) CHECK (publico_alvo IN ('família', 'infantil', 'adulto'))
);


CREATE TABLE tb_info_evento OF tp_info_evento (
    CONSTRAINT info_evento_pk PRIMARY KEY (nome)
);

CREATE TYPE tp_evento AS OBJECT (
    id NUMBER(5),
    organizador REF tp_organizador, --ver se ta certo
    info_evento REF tp_info_evento, --ver se ta certo
    zona VARCHAR2(1) CHECK (zona IN ('A', 'B', 'C', 'D', 'E')), -- as opções são: "A", "B", "C", "D" ou "E" -- zona do evento
    complemento VARCHAR2(60), -- complemento do evento
    data_evento DATE NOT NULL
);

CREATE TABLE tb_evento OF tp_evento (
    CONSTRAINT evento_pk PRIMARY KEY (id),
    CONSTRAINT evento_organizador_fk FOREIGN KEY (organizador) REFERENCES tb_organizador,
    CONSTRAINT evento_info_evento_fk FOREIGN KEY (info_evento) REFERENCES tb_info_evento
);

CREATE TYPE tp_acompanhante AS OBJECT (
    cpf_visitante NUMBER(11)
    num_acompanhantes NUMBER(2)
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    idade NUMBER,
    altura DECIMAL(3,2) CHECK (altura > 0), 

);

CREATE TABLE tb_acompanhante OF tp_acompanhante (
    CONSTRAINT acompanhante_pk PRIMARY KEY (cpf_visitante, num_acompanhantes)
);

-- FICOU FALTANDO CRIAR AQUISICAO, UTILIZAR E REALIZAR 








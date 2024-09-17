/* criar tabelas OR */

CREATE OR REPLACE TYPE tp_nome_completo AS OBJECT (
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    ddd VARCHAR2(2),
    numero VARCHAR2(9)
);
/

CREATE OR REPLACE TYPE tp_lista_telefones AS VARRAY(3) OF tp_telefone; 
/

CREATE OR REPLACE TYPE tp_visitante AS OBJECT (
    cpf NUMBER(11),
    nome_completo tp_nome_completo,
    sexo VARCHAR2(1),
    altura DECIMAL(3,2),
    data_de_nascimento DATE,
    telefones tp_lista_telefones,  -- VARRAY para armazenar os telefones

    MEMBER FUNCTION idade RETURN NUMBER
);
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

CREATE OR REPLACE TYPE tp_atracao AS OBJECT (
    nome_atracao VARCHAR2(30),
    categoria VARCHAR2(8),
    limite_max NUMBER,
    idade_min NUMBER,
    altura_min DECIMAL(3,2),
    
    MAP MEMBER FUNCTION map_categoria RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY tp_atracao AS
    -- Função MAP que retorna a categoria para comparação
    MAP MEMBER FUNCTION map_categoria RETURN VARCHAR2 IS
    BEGIN
        RETURN categoria;
    END;
END;
/

CREATE TABLE tb_atracao OF tp_atracao (
    CONSTRAINT atracao_pk PRIMARY KEY (nome_atracao)
);

CREATE OR REPLACE TYPE tp_funcionario AS OBJECT (
    cpf NUMBER(11),
    cpf_supervisor REF tp_funcionario,
    cpf_supervisor_val NUMBER(11),
    nome_completo tp_nome_completo,
    sexo VARCHAR2(1),
    salario DECIMAL(8,2),
    data_de_nascimento DATE,
    MEMBER PROCEDURE exibir_info(SELF tp_funcionario)
) NOT FINAL NOT INSTANTIABLE;
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
    CONSTRAINT funcionario_sexo_check CHECK (sexo IN ('M', 'F', 'O'))
);

-- Criação do tipo operador, do corpo do tipo e da tabela
CREATE OR REPLACE TYPE tp_operador UNDER tp_funcionario (
    atracao REF tp_atracao,
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
    CONSTRAINT operador_pk PRIMARY KEY (cpf),
    atracao SCOPE IS tb_atracao
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
    CONSTRAINT organizador_pk PRIMARY KEY (cpf)
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
    CONSTRAINT vendedor_pk PRIMARY KEY (cpf)
);

CREATE OR REPLACE TYPE tp_ingresso AS OBJECT (
    codigo NUMBER,
    cpf_visitante REF tp_visitante,
    tipo_de_ingresso VARCHAR2(8),
    metodo_pagto VARCHAR2(8),
    data_compra DATE
);
/

CREATE TABLE tb_ingresso OF tp_ingresso (
    CONSTRAINT ingresso_pk PRIMARY KEY (codigo),
    CONSTRAINT ingresso_tipo_check CHECK (tipo_de_ingresso IN ('meia', 'inteira')),
    CONSTRAINT ingresso_metodo_pagto_check CHECK (metodo_pagto IN ('pix', 'dinheiro', 'credito', 'debito', 'vale', 'cortesia')),
    
    data_compra NOT NULL
);

CREATE OR REPLACE TYPE tp_item AS OBJECT (
    id_compra NUMBER(9),
    nome_item VARCHAR2(35)
);
/

-- Criando a tabela aninhada para armazenar os itens comprados
CREATE OR REPLACE TYPE tp_nt_itens AS TABLE OF tp_item;
/

-- Definindo o tipo compra que inclui a tabela aninhada
CREATE OR REPLACE TYPE tp_compra AS OBJECT (
    id NUMBER(9),
    data_compra DATE,
    valor_total DECIMAL(8,2),
    metodo_pagto VARCHAR2(17),
    itens_comprados tp_nt_itens -- Tabela aninhada
);
/

-- Criando a tabela tb_compra e associando a tabela aninhada corretamente
CREATE TABLE tb_compra OF tp_compra (
    CONSTRAINT compra_pk PRIMARY KEY (id)
)
NESTED TABLE itens_comprados STORE AS tb_nt_itens_tab;

CREATE OR REPLACE TYPE tp_info_evento AS OBJECT (
    nome VARCHAR2(50),
    publico_alvo VARCHAR2(8),
    descricao VARCHAR2(60)
);
/

CREATE TABLE tb_info_evento OF tp_info_evento (
    CONSTRAINT info_evento_pk PRIMARY KEY (nome),
    CONSTRAINT info_evento_publico_alvo_check CHECK (publico_alvo IN ('família', 'infantil', 'adulto'))
);

CREATE OR REPLACE TYPE tp_evento AS OBJECT (
    id NUMBER(5),
    organizador REF tp_organizador,
    info_evento REF tp_info_evento, 
    zona VARCHAR2(1),
    complemento VARCHAR2(60), -- complemento do evento
    data_evento DATE,
    ORDER MEMBER FUNCTION compare_date (other tp_evento) RETURN NUMBER
);
/

CREATE OR REPLACE TYPE BODY tp_evento AS
    ORDER MEMBER FUNCTION compare_date(other tp_evento) RETURN NUMBER IS
    BEGIN
         IF data_evento < other.data_evento THEN
            RETURN -1;  -- O evento atual é menor (mais antigo)
        ELSIF data_evento > other.data_evento THEN
            RETURN 1;   -- O evento atual é maior (mais recente)
        ELSE
            RETURN 0;   -- As datas dos eventos são iguais
        END IF;
    END;
END;
/

CREATE TABLE tb_evento OF tp_evento (
    CONSTRAINT evento_pk PRIMARY KEY (id),
    CONSTRAINT evento_zona_check CHECK (zona IN ('A', 'B', 'C', 'D', 'E')),
    info_evento WITH ROWID REFERENCES tb_info_evento,
    data_evento NOT NULL
);

CREATE OR REPLACE TYPE tp_acompanhante AS OBJECT (
    cpf_visitante REF tp_visitante,
    cpf_visitante_val VARCHAR2(11), -- Novo campo para armazenar o valor do CPF
    num_acompanhante NUMBER(2),
    nome_completo tp_nome_completo,
    idade NUMBER,
    altura DECIMAL(3,2)
);
/ 

CREATE TABLE tb_acompanhante OF tp_acompanhante (
    CONSTRAINT acompanhante_pk PRIMARY KEY (cpf_visitante_val, num_acompanhante), -- Usando o novo campo cpf_visitante_val
    CONSTRAINT acompanhante_altura_check CHECK (altura > 0)
);


CREATE OR REPLACE TYPE tp_aquisicao AS OBJECT (
    cod_ingresso REF tp_ingresso,
    cod_ingresso_val VARCHAR2(7), -- Novo campo para armazenar o código do ingresso
    cpf_recepcionista REF tp_recepcionista
);
/

CREATE TABLE tb_aquisicao OF tp_aquisicao (
    CONSTRAINT aquisicao_pk PRIMARY KEY (cod_ingresso_val)
);

CREATE OR REPLACE TYPE tp_utilizar AS OBJECT(
    nome_atracao REF tp_atracao,
    nome_atracao_val VARCHAR2(30), -- Novo campo para armazenar o nome da atração
    cpf_visitante REF tp_visitante,
    cpf_visitante_val VARCHAR2(11), -- Novo campo para armazenar o valor do CPF
    horario TIMESTAMP
);
/ 

CREATE TABLE tb_utilizar OF tp_utilizar (
    CONSTRAINT utilizar_pk PRIMARY KEY (nome_atracao_val, cpf_visitante_val, horario)
);



CREATE OR REPLACE TYPE tp_realizar AS OBJECT (
    id_compra REF tp_compra,
    id_compra_val NUMBER, -- Novo campo para armazenar o valor do ID da compra
    cpf_visitante REF tp_visitante,
    cpf_vendedor REF tp_vendedor
);
/ 

CREATE TABLE tb_realizar OF tp_realizar (
    CONSTRAINT realizar_pk PRIMARY KEY (id_compra_val)
);

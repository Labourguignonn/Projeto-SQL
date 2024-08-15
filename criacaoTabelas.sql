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
DROP TABLE lugar;
DROP TABLE evento;
DROP TABLE acompanhante;
DROP TABLE aquisicao;
DROP TABLE utilizar;
DROP TABLE participar;
DROP TABLE realizar;

CREATE TABLE visitante (
    cpf NUMBER, --Nomes diferentes para tabelas diferentes?
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    sexo VARCHAR2(1) NULL, --M,F,O(other)
    altura DECIMAL(3,2),
    data_de_nascimento DATE NOT NULL,
    CONSTRAINT visitante_pk PRIMARY KEY (cpf)
);

CREATE TABLE atracao (
    nome_atr VARCHAR2(30),
    categoria VARCHAR2(10), --radical, família ou infantil
    limite_max NUMBER, 
    idade_min NUMBER NULL,
    altura_min DECIMAL(3,2),
    CONSTRAINT atracao_pk PRIMARY KEY (nome_atr)
);

CREATE TABLE funcionario (
    cpf NUMBER, --Nomes diferentes para tabelas diferentes?
    supervisor NUMBER,
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    sexo VARCHAR2(1) NULL, 
    salário DECIMAL(8,2), -- considerei q o máx do salário é 999.999,99
    data_de_nascimento DATE NOT NULL,
    CONSTRAINT visitante_pk PRIMARY KEY (cpf),
    CONSTRAINT supervisor_fk FOREIGN KEY (supervisor) REFERENCES funcionario (cpf)
);

-- CREATE TABLE operador (
--     cpf_func NUMBER, 
--     atracao VARCHAR2(30),
--     CONSTRAINT operador_pk PRIMARY KEY (cpf_func),
--     CONSTRAINT operador_cpf_fk FOREIGN KEY (cpf_func) REFERENCES funcionario (cpf),
--     CONSTRAINT atracao_fk FOREIGN KEY (atracao) REFERENCES atracao (nome_atr)
-- );

-- CREATE TABLE recepcionista (
--     cpf_func NUMBER, 
--     CONSTRAINT recepcionista_pk PRIMARY KEY (cpf_func),
--     CONSTRAINT recepcionista_cpf_fk FOREIGN KEY (cpf_func) REFERENCES funcionario (cpf)
-- );

-- CREATE TABLE organizador (
--     cpf_func NUMBER, 
--     CONSTRAINT organizador_pk PRIMARY KEY (cpf_func),
--     CONSTRAINT organizador_cpf_fk FOREIGN KEY (cpf_func) REFERENCES funcionario (cpf)
-- );

-- CREATE TABLE vendedor (
--     cpf_func NUMBER, 
--     CONSTRAINT vendedor_pk PRIMARY KEY (cpf_func),
--     CONSTRAINT vendedor_cpf_fk FOREIGN KEY (cpf_func) REFERENCES funcionario (cpf)
-- );

CREATE TABLE ingresso (
    codigo NUMBER,
    cpf_visitante NUMBER,
    tipo_de_ingresso VARCHAR2(20),
    metodo_pagto VARCHAR2(20), --considerei a maior string como "cartao de credito"
    data_compra DATE NOT NULL,
    CONSTRAINT ingresso_pk PRIMARY KEY (codigo),
    CONSTRAINT ingresso_cpf_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf)
);

CREATE TABLE compra (
    id NUMBER,
    data_compra DATE NOT NULL,
    valor_total DECIMAL(7,2), --considerei q o máx do valor_total é 99.999,99
    metodo_pagto VARCHAR2(20), --considerei a maior string como "cartao de credito"
    CONSTRAINT compra_pk PRIMARY KEY (id)
);

CREATE TABLE itens_comprados (
    id_compra NUMBER,
    nome_item VARCHAR2(35), 
    CONSTRAINT itens_comprados_pk PRIMARY KEY (id_compra, nome_item),
    CONSTRAINT itens_comprados_id_compra_fk FOREIGN KEY (id_compra) REFERENCES compra (id)
);

CREATE TABLE lugar(
    zona VARCHAR(30),
    complemento VARCHAR2(60), 
    CONSTRAINT lugar_pk PRIMARY KEY (zona)
);

CREATE TABLE evento (
    id NUMBER,
    organizador NUMBER,
    lugar VARCHAR2(30)
    nome VARCHAR2(50),
    data_evento DATE NOT NULL
    publico_alvo VARCHAR2(30) NULL,
    descricao VARCHAR2(60) NULL
    CONSTRAINT evento_pk PRIMARY KEY (id),
    CONSTRAINT evento_organizador_fk FOREIGN KEY (organizador) REFERENCES organizador (cpf_func),
    CONSTRAINT evento_lugar_fk FOREIGN KEY (lugar) REFERENCES lugar (zona)
);

CREATE TABLE acompanhante (
    cpf_visitante NUMBER,
    num_acompanhante NUMBER,
    nome VARCHAR2(20),
    sobrenome VARCHAR2(50),
    idade NUMBER,
    altura DECIMAL(3,2),
    CONSTRAINT acompanhante_pk PRIMARY KEY (cpf_visitante, num_acompanhante),
    CONSTRAINT acompanhante_cpf_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf)
);

CREATE TABLE aquisicao(
    cod_ingresso NUMBER,
    cpf_visitante NUMBER,
    cpf_recepcionista NUMBER, 
    CONSTRAINT aquisicao_pk PRIMARY KEY (cod_ingresso, cpf_visitante),
    CONSTRAINT aquisicao_cod_ingresso_fk FOREIGN KEY (cod_ingresso) REFERENCES ingresso (codigo),
    CONSTRAINT aquisicao_cpf_visitante_fk FOREIGN KEY (cpf_visitante) REFERENCES visitante (cpf),
    CONSTRAINT aquisicao_cpf_recepcionista_fk FOREIGN KEY (cpf_recepcionista) REFERENCES recepcionista (cpf_func)
);

CREATE TABLE utilizar(
    atracao VARCHAR2(30),
    visitante NUMBER,
    horario TIME, 
    CONSTRAINT utilizar_pk PRIMARY KEY (atracao, visitante, horario),
    CONSTRAINT utilizar_atracao_fk FOREIGN KEY (atracao) REFERENCES atracao (nome),
    CONSTRAINT utilizar_visitante_fk FOREIGN KEY (visitante) REFERENCES visitante (cpf)
);

CREATE TABLE participar(
    visitante NUMBER,
    evento NUMBER, 
    CONSTRAINT participar_pk PRIMARY KEY (visitante, evento),
    CONSTRAINT participar_visitante_fk FOREIGN KEY (visitante) REFERENCES visitante (cpf),
    CONSTRAINT participar_evento_fk FOREIGN KEY (evento) REFERENCES evento (id)
);

CREATE TABLE realizar(
    compra NUMBER
    visitante NUMBER,
    vendedor NUMBER, 
    CONSTRAINT realizar_pk PRIMARY KEY (compra),
    CONSTRAINT realizar_compra_fk FOREIGN KEY (compra) REFERENCES compra (id),
    CONSTRAINT realizar_visitante_fk FOREIGN KEY (visitante) REFERENCES visitante (cpf),
    CONSTRAINT realizar_vendedor_fk FOREIGN KEY (vendedor) REFERENCES vendedor (cpf_func)
);
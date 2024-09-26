--CREATE INDEX
--Otimizar o tempo em relação a consulta de nomes e sobrenomes na tabela de visitante

CREATE INDEX idx_nome_visitante ON visitante(nome);
CREATE INDEX idx_sobrenome_visitante ON visitante(sobrenome);

------------------------------------------------------------------------------
-- INNER JOIN, ORDER BY, BETWEEN, COUNT, GROUP BY, SELECT-FROM-WHERE, HAVING
-- Tabela com o nome das pessoas que visitaram o parque no primeiro semestre de 2024, aparecendo apenas as pessoas que compraram mais de um ingresso
SELECT V.nome, V.sobrenome, COUNT(V.nome) as Num_iNGRESSOS,I.data_compra
FROM Visitante V
	INNER JOIN Ingresso I ON I.cpf_visitante = V.cpf
	WHERE TRUNC(I.data_compra) BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-06-30', 'YYYY-MM-DD')
GROUP BY V.nome, V.sobrenome, I.data_compra
HAVING COUNT(V.nome) > 1
ORDER BY data_compra, V.nome;

------------------------------------------------------------------------------
-- AVG, IN, MAX, MIN, CREATE VIEW
-- Tabelas com a média, maior e o menor valores de compra por dia de parque, separado em tabelas de compras com cartao e sem cartao
CREATE VIEW controle_rendimento_compras_com_cartao AS
SELECT C.data_compra, round(AVG(C.valor_total),2) as Media_dos_valores_das_compras, 
    MAX(C.valor_total) as valor_max, MIN(C.valor_total) as valor_min
FROM compra C 
	WHERE C.metodo_pagto IN('debito','credito')   
GROUP BY C.data_compra
ORDER BY C.data_compra;

CREATE VIEW controle_rendimento_compras_sem_cartao AS
SELECT C.data_compra, round(AVG(C.valor_total),2) as Media_dos_valores_das_compras, 
    MAX(C.valor_total) as valor_max, MIN(C.valor_total) as valor_min
FROM compra C 
	WHERE C.metodo_pagto IN('dinheiro','pix')   
GROUP BY C.data_compra
ORDER BY C.data_compra;

SELECT * FROM controle_rendimento_compras_sem_cartao;
SELECT * FROM controle_rendimento_compras_com_cartao;

-------------------------------------------------------------------------------
--LEFT OUTER JOIN AND IS NULL
--Tabela que mostre qual gênero comprou mais no parque, masculino ou feminino
SELECT V.sexo, count(V.sexo) as num_de_pessoas_que_nao_compraram
FROM realizar R
RIGHT OUTER JOIN Visitante V ON V.cpf = R.cpf_visitante	
WHERE R.id_compra IS NULL
GROUP BY V.sexo

-----------------------------------------------------------------------------
--  ALTER TABLE, INSERT INTO, UPDATE, DELETE
-- Adicionar uma nova coluna 'email' à tabela 'visitante', inserir um novo visitante, colocar um email real e deletar esse cleinte novo da tabela
ALTER TABLE Visitante
ADD email VARCHAR2(100);

INSERT INTO visitante (cpf, nome, sobrenome, sexo, altura, data_de_nascimento, email) 
VALUES (98765432100, 'José', 'Lima', 'M', 1.78, DATE '1992-02-14', 'novoemail@example.com');

UPDATE Visitante
SET email = 'jose.lima@example.com'
WHERE cpf = 98765432100;

DELETE FROM Visitante
WHERE cpf = 98765432100;

--------------------------------------------------------------------------
--LIKE, SUBCONSULTA USANDO IN
--Comparar que recepcionistas nascidos depois dos anos 90 que venderam mais ingressos
SELECT V.nome, V.sobrenome, F.nome as Recepcionista
FROM visitante V, Funcionario F 

WHERE V.cpf IN (
    SELECT cpf_visitante 
    FROM ingresso
) AND F.cpf IN(
    SELECT cpf_funcionario
    FROM recepcionista
) AND TO_CHAR(F.data_de_nascimento, 'YYYY') LIKE '199%';

-----------------------------------------------------------------------------
--SUBCONSULTA USANDO ANY, UNION
--Altura dos visitantes e dos acompanhantes que são maiores que 1.50 
SELECT nome, altura
FROM visitante
WHERE altura > ANY (
    SELECT altura
    FROM visitante
    WHERE altura > 1.50
)
UNION
SELECT nome, altura
FROM acompanhante
WHERE altura > ANY (
    SELECT altura
    FROM acompanhante
    WHERE altura > 1.50
);
----------------------------------------------------------------------
--SUBCONSULTA USANDO ALL
-- Tabela mostrando os funcionários com o maior salário de cada gênero
SELECT f.cpf, f.nome, f.sobrenome, f.sexo, f.salário
FROM funcionario f
WHERE f.salário >= ALL (
    SELECT f2.salário
    FROM funcionario f2
    WHERE f2.sexo = f.sexo
);

------------------------------------------------------------------------------
--SUBCONSULTA USANDO OPERADOR
-- Tabela mostrando a porcentagem, entre pessoas do mesmo gênero, de salário acima da média
SELECT f.sexo, COUNT(f.sexo),
    ROUND(COUNT(f.sexo) * 100.0 / (SELECT COUNT(*) FROM funcionario WHERE sexo = f.sexo),2) AS porcentagem
FROM funcionario f
WHERE f.salário >= (
    SELECT AVG(salário) FROM funcionario
)
GROUP BY f.sexo

-----------------------------------------------------------------------------
-- CASE WHEN 
-- Caso o item comprado tenha mais de 5 vendas no parque, ele é considerado um item popular 
SELECT 
    nome_item,
    quantidade_compras,
    CASE 
        WHEN quantidade_compras >= 5 THEN 'Muito Procurado'
        WHEN quantidade_compras >= 2 THEN 'Procurado'
        ELSE 'Pouco Procurado'
    END AS classificacao
    FROM ( 
        SELECT 
            nome_item, 
            COUNT(*) AS quantidade_compras
            FROM itens_comprados
            GROUP BY nome_item 
    )
    ORDER BY quantidade_compras DESC;

--------------------------------------------------------------------------
--WHILE LOOP 
-- enquanto a data de hoje for igual a data do evento, delete o evento 
DECLARE
    v_event_count NUMBER;
BEGIN
    LOOP
        -- Conta os eventos com a data de hoje
        SELECT COUNT(*) INTO v_event_count FROM evento WHERE TRUNC(data_evento) = TRUNC(SYSDATE);
        -- Sai do loop se não houver mais eventos com a data de hoje
        EXIT WHEN v_event_count = 0;
        DELETE FROM evento WHERE TRUNC(data_evento) = TRUNC(SYSDATE);
        COMMIT;
    END LOOP;
END;
/
-------------------------------------------------------------------------
-- FOR IN LOOP  
-- Para cada supervisor, atualiza o salário com um bônus de 100 reais por funcionário que ele supervisiona
DECLARE
    v_supervisor funcionario.cpf%TYPE;
    v_num_funcionarios NUMBER;
    v_bonus_total NUMBER(10, 2);
BEGIN
    -- Cursor para selecionar todos os supervisores (onde cpf_supervisor IS NULL)
    FOR supervisor_rec IN (SELECT cpf FROM funcionario WHERE cpf_supervisor IS NULL)
    LOOP
        v_supervisor := supervisor_rec.cpf;
        SELECT COUNT(*) INTO v_num_funcionarios
        FROM funcionario
        WHERE cpf_supervisor = v_supervisor;
        v_bonus_total := v_num_funcionarios * 100;
        -- Atualiza o salário do supervisor com o bônus total calculado
        UPDATE funcionario
        SET salario = salario + v_bonus_total
        WHERE cpf = v_supervisor;
    END LOOP;
END;
/
----------------------------------------------------------------------------
-- Create Package para cadastrar visitantes
CREATE OR REPLACE PACKAGE CadastroVisitante AS
    PROCEDURE InserirVisitante(
        p_cpf visitante.cpf%TYPE,
        p_nome visitante.nome%TYPE,
        p_sobrenome visitante.sobrenome%TYPE,
        p_sexo visitante.sexo%TYPE,
        p_altura visitante.altura%TYPE,
        p_data_de_nascimento visitante.data_de_nascimento%TYPE
    );

    PROCEDURE RemoverVisitante(
        p_cpf IN visitante.cpf%TYPE
    );

    e_visitanteNaoExistente EXCEPTION;

    TYPE t_visitanteRecord IS RECORD (
        cpf visitante.cpf%TYPE,
        nome visitante.nome%TYPE,
        sobrenome visitante.sobrenome%TYPE
    );

    TYPE t_visitanteSexoTable IS TABLE OF t_visitanteRecord 
    INDEX BY BINARY_INTEGER;

    FUNCTION ListaVisitantes(
        p_sexo IN visitante.sexo%TYPE,
        p_sexoTable OUT t_visitanteSexoTable,
        p_numVisitantes IN OUT BINARY_INTEGER
    ) RETURN BINARY_INTEGER;
END CadastroVisitante;
/

---------------------------------------------------------------------------------
-- Create Package Body
CREATE OR REPLACE PACKAGE BODY CadastroVisitante AS
    PROCEDURE InserirVisitante(
        p_cpf visitante.cpf%TYPE,
        p_nome visitante.nome%TYPE,
        p_sobrenome visitante.sobrenome%TYPE,
        p_sexo visitante.sexo%TYPE,
        p_altura visitante.altura%TYPE,
        p_data_de_nascimento visitante.data_de_nascimento%TYPE
    ) IS
    BEGIN
        INSERT INTO visitante (cpf, nome, sobrenome, sexo, altura, data_de_nascimento)
        VALUES (p_cpf, p_nome, p_sobrenome, p_sexo, p_altura, p_data_de_nascimento);
        COMMIT;
    END InserirVisitante;

    PROCEDURE RemoverVisitante(
        p_cpf visitante.cpf%TYPE
    ) IS
    BEGIN
        DELETE FROM visitante WHERE cpf = p_cpf;
        IF SQL%NOTFOUND THEN
            RAISE e_visitanteNaoExistente;
        END IF;
        COMMIT;
    END RemoverVisitante;

    FUNCTION ListaVisitantes(
        p_sexo IN visitante.sexo%TYPE,
        p_sexoTable OUT t_visitanteSexoTable,
        p_numVisitantes IN OUT BINARY_INTEGER
    )  RETURN BINARY_INTEGER IS
        v_visitante t_visitanteRecord;
        CURSOR c_visitantes IS
            SELECT cpf, nome, sobrenome 
            FROM visitante
            WHERE sexo = p_sexo;
    BEGIN
        p_numVisitantes := 0;
        OPEN c_visitantes;
        LOOP
            FETCH c_visitantes INTO v_visitante;
            EXIT WHEN c_visitantes%NOTFOUND;
            p_numVisitantes := p_numVisitantes + 1;
            p_sexoTable(p_numVisitantes) := v_visitante;
        END LOOP;
        CLOSE c_visitantes;
        RETURN p_numVisitantes;
    END ListaVisitantes;
END CadastroVisitante;
/

------------------------------------------------------------------------------
-- Create Trigger - Trigger de Linha
-- Trigger para deletar operador e atualizar supervisor ao deletar uma atração
CREATE OR REPLACE TRIGGER deleta_atracao
BEFORE DELETE ON atracao
FOR EACH ROW
DECLARE
v_cpf_funcionario funcionario.cpf%TYPE;
BEGIN
    SELECT cpf_funcionario
    INTO v_cpf_funcionario
    FROM operador
    WHERE atracao = :OLD.nome_atracao;
    
	DELETE FROM operador
    WHERE atracao = :OLD.nome_atracao;

    UPDATE funcionario
    SET cpf_supervisor = NULL
    WHERE cpf = v_cpf_funcionario;
END deleta_atracao;
/

-----------------------------------------------------------------------
-- Create Trigger - Trigger de Comando 
-- Trigger para limitar o número de ingressos vendidos por dia
CREATE OR REPLACE TRIGGER limite_diario_ingresso
AFTER INSERT ON ingresso
DECLARE
    limitie_diario_atingido EXCEPTION;
    num_ingressos INT;
BEGIN
    SELECT COUNT(*)
    INTO num_ingressos
    FROM ingresso
    WHERE data_compra = SYSDATE;

    IF num_ingressos <= 3000 THEN
        DBMS_OUTPUT.PUT_LINE("Limite Máximo Ainda Não Atingido");
    ELSIF num_ingressos > 3000 THEN
        DELETE FROM ingresso
        WHERE codigo = MAX(codigo);
        RAISE limitie_diario_atingido;
    END IF;

    EXCEPTION
        WHEN limitie_diario_atingido THEN
            RAISE_APPLICATION_ERROR(-20321, 'LIMITE DIÁRIO DE INGRESSOS ATINGIDO - Não é permitido a inserção de ingressos adicionais no BD.');
END limite_diario_ingresso;
/


-- Statement para testar a função ListaVisitante do PACKAGE CadastroVisitante
DECLARE
    v_numVisitantesComSexoM BINARY_INTEGER;
    v_sexo visitante.sexo%TYPE := 'M';
	v_sexoTable CadastroVisitante.t_visitanteSexoTable;
    v_numVisitantes BINARY_INTEGER := 0;
BEGIN
	v_numVisitantesComSexoM := CadastroVisitante.ListaVisitantes(
    	p_sexo => v_sexo,
    	p_sexoTable => v_sexoTable,
    	p_numVisitantes => v_numVisitantes
    );

	DBMS_OUTPUT.PUT_LINE(v_numVisitantesComSexoM);
END;
/

-- Função para exibir informações do operador
CREATE OR REPLACE FUNCTION tp_operador.exibir_info(p_cpf IN operador.cpf%TYPE)
RETURN VARCHAR2 IS
    v_info VARCHAR2(400);
    v_ref REF operador;
BEGIN
    -- Refere-se ao operador e junta informações da tabela evento, se ele for responsável por algum
    SELECT 'Operador: ' || DEREF(v_ref).nome || ', CPF: ' || DEREF(v_ref).cpf || 
           ', Função: ' || DEREF(v_ref).funcao || ', Evento Atual: ' || NVL(e.nome_evento, 'Nenhum')
    INTO v_info
    FROM operador o
    LEFT JOIN evento e ON o.evento_atual = e.codigo_evento
    WHERE o.cpf = p_cpf;

    RETURN v_info;
END;
/

-- Função para exibir informações do recepcionista com mais detalhes
CREATE OR REPLACE FUNCTION tp_recepcionista.exibir_info(p_cpf IN recepcionista.cpf%TYPE)
RETURN VARCHAR2 IS
    v_info VARCHAR2(400);
    v_ref REF recepcionista;
BEGIN
    -- Refere-se ao recepcionista e conta o número de atendimentos que ele já realizou
    SELECT 'Recepcionista: ' || DEREF(v_ref).nome || ', CPF: ' || DEREF(v_ref).cpf || 
           ', Turno: ' || DEREF(v_ref).turno || ', Atendimentos Realizados: ' || 
           (SELECT COUNT(*) FROM atendimento a WHERE a.cpf_recepcionista = p_cpf)
    INTO v_info
    FROM recepcionista r
    WHERE r.cpf = p_cpf;

    RETURN v_info;
END;
/

-- Função para exibir informações do organizador com mais detalhes
CREATE OR REPLACE FUNCTION tp_organizador.exibir_info(p_cpf IN organizador.cpf%TYPE)
RETURN VARCHAR2 IS
    v_info VARCHAR2(400);
    v_ref REF organizador;
BEGIN
    -- Refere-se ao organizador e traz o nome do maior evento que ele organizou
    SELECT 'Organizador: ' || DEREF(v_ref).nome || ', CPF: ' || DEREF(v_ref).cpf || 
           ', Maior Evento: ' || 
           (SELECT e.nome_evento FROM evento e 
            WHERE e.organizador_cpf = p_cpf 
            ORDER BY e.participantes DESC FETCH FIRST 1 ROWS ONLY)
    INTO v_info
    FROM organizador o
    WHERE o.cpf = p_cpf;

    RETURN v_info;
END;
/

-- Função para exibir informações do vendedor com mais detalhes
CREATE OR REPLACE FUNCTION tp_vendedor.exibir_info(p_cpf IN vendedor.cpf%TYPE)
RETURN VARCHAR2 IS
    v_info VARCHAR2(400);
    v_ref REF vendedor;
BEGIN
    -- Refere-se ao vendedor e soma o total de ingressos vendidos e o valor total gerado
    SELECT 'Vendedor: ' || DEREF(v_ref).nome || ', CPF: ' || DEREF(v_ref).cpf || 
           ', Total Vendas: ' || DEREF(v_ref).total_vendas || 
           ', Total Ingressos Vendidos: ' || (SELECT COUNT(*) FROM ingresso i WHERE i.cpf_vendedor = p_cpf) || 
           ', Valor Total Gerado: ' || (SELECT SUM(i.valor) FROM ingresso i WHERE i.cpf_vendedor = p_cpf)
    INTO v_info
    FROM vendedor v
    WHERE v.cpf = p_cpf;

    RETURN v_info;
END;
/
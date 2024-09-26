-- SELECIONA O NÚMERO TOTAL E O PERCENTUAL DE VISITANTES AGRUPADOS POR SEXO
SELECT v.sexo, 
       COUNT(*) AS TOTAL_ABSOLUTO, 
       ROUND(100*(COUNT(*)/ (SELECT COUNT(*) FROM tb_visitante)), 2) AS TOTAL_PERCENTUAL
FROM tb_visitante v
GROUP BY v.sexo;

-- Porcentagem de pessoas com 25 anos ou menos (criança) que frequantou o parque no período selecionado 
SELECT
    (SELECT COUNT(*)
     FROM tb_visitante V
     INNER JOIN tb_ingresso I ON deref(I.cpf_visitante).cpf = V.cpf
     WHERE V.idade() < 25) * 100.0 / 
    (SELECT COUNT(*) 
     FROM tb_visitante V1
     INNER JOIN tb_ingresso I1 ON deref(I1.cpf_visitante).cpf = V1.cpf) AS porcentagem_menores_25
FROM dual;

-- Exibir informações dos funcionários que mais ganham separado por especialização
SELECT
    T.nome_vendedor, T.valores_totais as Valor_ganho
FROM (
    SELECT 
        V.nome_completo.nome AS nome_vendedor, SUM(C.valor_total) AS valores_totais
    FROM 
        tb_realizar R
        INNER JOIN tb_compra C ON R.id_compra = C.id
        INNER JOIN tb_vendedor V ON V.cpf = deref(R.cpf_vendedor).cpf
    GROUP BY 
        V.nome_completo.nome
) T
WHERE 
    T.valores_totais = (
        SELECT MAX(valores_totais)
        FROM (
            SELECT 
                SUM(C.valor_total) AS valores_totais
            FROM 
                tb_realizar R
                INNER JOIN tb_compra C ON R.id_compra = C.id
                INNER JOIN tb_vendedor V ON V.cpf = deref(R.cpf_vendedor).cpf
            GROUP BY 
                V.nome_completo.nome
        )
    )

-- ITEM MAIS VENDIDO NA LOJA, QUANTIDADE VENDIDA E NÚMERO DE CLIENTES QUE COMPRARAM
SELECT i.nome_item, COUNT(*) AS QTD_VENDIDA
FROM tb_itens_comprados i
GROUP BY i.nome_item
ORDER BY QTD_VENDIDA DESC
FETCH FIRST 1 ROWS ONLY;

-- FUNCIONÁRIO QUE MAIS VENDEU EM VALORES ABSOLUTOS (FUNCIONÁRIO DO MÊS, DEIXOU O PATRÃO MAIS RICO)
SELECT
    T.nome_vendedor, T.valores_totais as Valor_ganho
FROM (
    SELECT 
        V.nome_completo.nome AS nome_vendedor, SUM(C.valor_total) AS valores_totais
    FROM 
        tb_realizar R
        INNER JOIN tb_compra C ON R.id_compra = C.id
        INNER JOIN tb_vendedor V ON V.cpf = deref(R.cpf_vendedor).cpf
    GROUP BY 
        V.nome_completo.nome
) T
WHERE 
    T.valores_totais = (
        SELECT MAX(valores_totais)
        FROM (
            SELECT 
                SUM(C.valor_total) AS valores_totais
            FROM 
                tb_realizar R
                INNER JOIN tb_compra C ON R.id_compra = C.id
                INNER JOIN tb_vendedor V ON V.cpf = deref(R.cpf_vendedor).cpf
            GROUP BY 
                V.nome_completo.nome
        )
    );

-- DIA MAIS MOVIMENTADO E DIA MENOS MOVIMENTADO DE UM DETERMINADO PERÍODO / PERÍODO MAIS MOVIMENTADO DO ANO

-- QUANTIDADE DE VEZES QUE AS ATRAÇÕES FORAM USADA POR CATEGORIA POR PESSOAS ACIMA DE 35 ANOS
SELECT a.map_categoria(), COUNT(u.nome_atracao) AS QTD_USO
FROM tb_atracao a
INNER JOIN tb_utilizar u ON a.nome_atracao = u.nome_atracao
INNER JOIN tb_visitante v ON v.cpf = u.cpf_visitante
WHERE v.idade() > 35
GROUP BY a.map_categoria();

-- VISITANTE QUE MAIS USOU BRINQUEDOS / MÉDIA DE UTILIZAÇÃO DE BRINQUEDOS POR VISITANTE
SELECT v.cpf, v.nome_completo.nome AS NOME, v.nome_completo.sobrenome AS SOBRENOME
FROM tb_visitante v
INNER JOIN tb_utilizar u ON u.cpf_visitante = v.cpf
WHERE v.cpf = MAX(SELECT COUNT(*)
                  FROM tb_utilizar u
                  GROUP BY u.cpf_visitante);

-- MÉDIA DE ACOMPANHANTES POR PESSOA
SELECT AVG(COUNT(A.num_acompanhante)) as media_num_acompanhantes
FROM tb_visitante V
INNER JOIN tb_acompanhante A ON A.cpf_visitante = V.cpf
GROUP BY V.cpf, V.nome_completo.nome, V.nome_completo.sobrenome

-- ORGANIZADOR COM MAIOR SUCESSO (EVENTOS MAIS MOVIMENTADOS)

--CONSULTA VARRAY PARA DDD DE FORA DE RECIFE E DE RECIFE
SELECT 
    (SELECT COUNT(*) 
     FROM tb_visitante v
     WHERE EXISTS (
         SELECT 1 
         FROM TABLE(v.telefones) t
         WHERE t.ddd = '81'
     )) AS visitantes_recife,
     
    (SELECT COUNT(*) 
     FROM tb_visitante v
     WHERE EXISTS (
         SELECT 1 
         FROM TABLE(v.telefones) t
         WHERE t.ddd != '81'
     )) AS visitantes_fora_recife
FROM dual;


-- CHECAR SE O EVENTO MAIS CHEIO FOI MAIS RECENTE DO QUE O EVENTO MAIS VAZIO DO PERÍODO
CREATE OR REPLACE TYPE tp_categoria_evento AS OBJECT (
    publico_alvo VARCHAR2(8),
    data_evento DATE
);
/

DECLARE
    v1 tp_categoria_evento;
    v2 tp_categoria_evento;
    v3 tp_categoria_evento;
    mais_recente tp_categoria_evento;
BEGIN
    -- Obtenha as três datas de evento mais recentes de cada categoria
    SELECT tp_categoria_evento(publico_alvo, MAX(data_evento)) 
    INTO v1 
    FROM tb_evento E
    INNER JOIN tb_info_evento I ON E.info_evento = REF(I)
    WHERE I.publico_alvo = 'família'
    GROUP BY I.publico_alvo;

    SELECT tp_categoria_evento(publico_alvo, MAX(data_evento)) 
    INTO v2 
    FROM tb_evento E
    INNER JOIN tb_info_evento I ON E.info_evento = REF(I)
    WHERE I.publico_alvo = 'infantil'
    GROUP BY I.publico_alvo;

    SELECT tp_categoria_evento(publico_alvo, MAX(data_evento)) 
    INTO v3 
    FROM tb_evento E
    INNER JOIN tb_info_evento I ON E.info_evento = REF(I)
    WHERE I.publico_alvo = 'adulto'
    GROUP BY I.publico_alvo;

    -- Comparar os três valores usando o método compare_date
    mais_recente := v1;
    
    IF mais_recente.data_evento < v2.data_evento THEN
        mais_recente := v2;
    END IF;
    
    IF mais_recente.data_evento < v3.data_evento THEN
        mais_recente := v3;
    END IF;

    DBMS_OUTPUT.PUT_LINE('O evento mais recente é da categoria: ' || mais_recente.publico_alvo ||
                         ' com data: ' || mais_recente.data_evento);
END;
/

--CONSULTA PARA MOSTRAR QUAL A RECEPCIONISTA QUE MAIS VENDEU INGRESSOS 
SELECT 
    r.cpf,
    r.nome_completo.nome || ' ' || r.nome_completo.sobrenome AS nome_completo,
    COUNT(a.cod_ingresso) AS total_vendas
FROM 
    tb_recepcionista r
JOIN 
    tb_aquisicao a ON a.cpf_recepcionista = REF(r)
GROUP BY 
    r.cpf, r.nome_completo.nome, r.nome_completo.sobrenome
ORDER BY 
    total_vendas DESC
FETCH FIRST 1 ROW ONLY;
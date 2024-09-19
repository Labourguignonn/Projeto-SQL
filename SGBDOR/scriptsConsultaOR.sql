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

-- Salário médio separado por especialização de funcionário
SELECT 
(SELECT Round(AVG(Op.salario),2) 
    from tb_operador Op) as Operador_salario_medio,
(SELECT Round(AVG(R.salario),2) 
    from tb_recepcionista r) as recepcionista_salario_medio,
(SELECT Round(AVG(V.salario),2) 
    from tb_vendedor V ) as Vendedor_salario_medio,
(SELECT Round(AVG(Org.salario),2) 
    from tb_vendedor Org) as Organizador_salario_medio
from dual;

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
SELECT a.categoria, COUNT(u.nome_atracao) AS QTD_USO
FROM tb_atracao a
INNER JOIN tb_utilizar u ON a.nome_atracao = u.nome_atracao
INNER JOIN tb_visitante v ON v.cpf = u.cpf_visitante
WHERE v.idade() > 35
GROUP BY a.categoria;

-- VISITANTE QUE MAIS USOU BRINQUEDOS / MÉDIA DE UTILIZAÇÃO DE BRINQUEDOS POR VISITANTE

-- EVENTO COM MAIOR PRESENÇA DE JOVENS (<25 ANOS) OU ALGUMA OUTRA DIVISÃO

-- MÉDIA DE ACOMPANHANTES POR PESSOA

-- NÚMERO DE VISITANTES DE FORA DE PERNAMBUCO

-- ORGANIZADOR COM MAIOR SUCESSO (EVENTOS MAIS MOVIMENTADOS)

-- GERENTE COM MELHORES NÚMEROS


/*🏆 Desafio 01: O Ranking das Cidades Faturistas
O Objetivo: Identificar quais cidades geram mais receita para a empresa.
Enunciado: Crie uma análise que mostre o faturamento total por cidade do cliente. Use uma CTE para primeiro calcular o valor total de cada pedido (unindo a tabela de pagamentos) e depois cruze com a localização do cliente para ver o total por cidade. Ordene do maior para o menor faturamento.*/

WITH tabela_pedido AS(

    SELECT
        t2.customer_id,
        sum(t1.payment_value) AS Soma_Pedido
        
    FROM 
        `projeto-base-olist.olistBR.payments` AS t1

    LEFT JOIN 
        `projeto-base-olist.olistBR.orders` AS t2

    ON
        t1.order_id = t2.order_id

    GROUP BY
        t2.customer_id

),

tabela_cidades AS(

    SELECT 
        t2.customer_city,
        FORMAT('R$ %.2f', sum(t1.Soma_Pedido)) AS Soma_Pedido_Cidade


    FROM tabela_pedido as t1

    LEFT JOIN 
        `projeto-base-olist.olistBR.customers` AS t2

    ON
        t1.customer_id = t2.customer_id

    GROUP BY
        t2.customer_city

    ORDER BY
        sum(t1.Soma_Pedido) DESC
)

SELECT
    *

FROM 
    tabela_cidades

    
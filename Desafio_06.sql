/*Desafio 06: Ticket Médio por Estado
Objetivo: Identificar qual estado gasta mais, em média, por pedido. 
O Enunciado: Calcule o valor médio gasto pelos clientes de cada estado. O relatório deve mostrar a sigla do estado e o valor médio (ticket médio) dos pedidos, ordenado do maior valor para o menor.*/

WITH tabela_estado AS (
  
    SELECT
        t1.customer_state,
        t2.order_id
        
    FROM 
        `projeto-base-olist.olistBR.customers` AS t1

    LEFT JOIN 
        `projeto-base-olist.olistBR.orders` AS t2
    ON
        t1.customer_id = t2.customer_id

    WHERE
        t2.order_status IN('delivered', 'approved', 'shipped')
    
),

tabela_ticket_medio AS (

    SELECT
        t1.customer_state,
        SUM(t2.payment_value) / COUNT(DISTINCT(t1.order_id)) AS valor_bruto_medio


    FROM
        tabela_estado AS t1

    LEFT JOIN
        `projeto-base-olist.olistBR.payments` AS t2
    ON
        t1.order_id = t2.order_id

    GROUP BY
        t1.customer_state

)

SELECT
    customer_state,
    CONCAT('R$ ',
            FORMAT('%.0f',
                ROUND(valor_bruto_medio)
                )
            )      
                    AS ticket_medio
    
FROM
    tabela_ticket_medio

ORDER BY
   valor_bruto_medio DESC
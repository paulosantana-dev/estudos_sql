/*🚚 Desafio 02: Eficiência Logística
O objetivo é descobrir quais categorias de produtos demoram mais (ou menos) para chegar na casa do cliente.

O Enunciado: Calcule o tempo médio de entrega (em dias) para cada categoria de produto. Considere apenas pedidos com status "delivered" (entregue).*/


WITH tabela_categorias AS (
  

    SELECT
        t1.order_id,
        t2.product_category_name
        
    FROM `projeto-base-olist.olistBR.items` AS t1

    LEFT JOIN 
        `projeto-base-olist.olistBR.products` AS t2
    ON
        t1.product_id = t2.product_id
),

tabela_data_entrega AS (
   
    SELECT
    t1.order_id,
    t1.product_category_name AS Categoria,
    date(t2.order_purchase_timestamp) AS data_compra,
    date(t2.order_delivered_customer_date) AS data_entrega,
    DATE_DIFF( date(t2.order_delivered_customer_date), date(t2.order_purchase_timestamp),DAY) AS tempo_entrega

    FROM
        tabela_categorias as t1

    LEFT JOIN 
        `projeto-base-olist.olistBR.orders` as t2
    ON
        t1.order_id = t2.order_id

    WHERE
        t2.order_status = 'delivered'
)

SELECT
    Categoria,
    round(avg(tempo_entrega)) AS tempo_medio_entrega

FROM
    tabela_data_entrega
   
GROUP BY
    categoria
ORDER BY
    tempo_medio_entrega DESC
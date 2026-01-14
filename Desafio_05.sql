/*Desafio 05: Sazonalidade (Dia da Semana)
Objetivo: Descobrir qual é o melhor dia para lançar promoções.
O Enunciado: Analise os dados de compra e descubra qual dia da semana tem o maior número de pedidos realizados. O relatório deve mostrar o dia (ex: Domingo, Segunda) e a quantidade total de pedidos naquele dia.*/

WITH DiaSemana AS (

SELECT
    order_id,
    CASE
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 1 THEN 'Domingo'
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 2 THEN 'Segunda-Feira'  
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 3 THEN 'Terça-Feira'
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 4 THEN 'Quarta-Feira'
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 5 THEN 'Quinta-Feira'
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 6 THEN 'Sexta-Feira'
        WHEN EXTRACT(DAYOFWEEK FROM order_purchase_timestamp) = 7 THEN 'Sábado'
    END AS Dia_Semana
    
FROM 
    `projeto-base-olist.olistBR.orders`
)

SELECT
    Dia_Semana,
    COUNT(DISTINCT(order_id)) AS Quantidade_Pedidos
        
FROM
    DiaSemana

GROUP BY
    Dia_Semana
    
ORDER BY
    COUNT(DISTINCT(order_id)) DESC
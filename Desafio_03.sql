/*💳 Desafio 03: Comportamento de Crédito
O objetivo é comparar o faturamento e a quantidade de pedidos entre compras feitas à vista e compras parceladas.*/

WITH tabela_tipo_pagamento AS (

    SELECT
        DISTINCT(t1.order_id),
        t1.payment_type,
        t1.payment_installments,
        t1.payment_value,
        CASE 
            WHEN t1.payment_installments > 1 THEN 'parcelado'
            WHEN t1.payment_installments = 1 THEN 'à vista'
        END AS tipo_pagamento

    FROM
        `projeto-base-olist.olistBR.payments` AS t1

),

tabela_geral AS (
SELECT
    tipo_pagamento,
    CONCAT(
        'R$ ', 
        FORMAT( "%'.2f", 
        SUM(payment_value))) AS Valor_total_pagamento ,
    COUNT(DISTINCT(order_id)) AS Qtde_Pedidos

FROM
    tabela_tipo_pagamento

WHERE
    tipo_pagamento IS NOT NULL

GROUP BY
    tipo_pagamento

ORDER BY
    SUM(payment_value) DESC
   
)

SELECT
    tipo_pagamento,
    Valor_total_pagamento,
    Qtde_Pedidos
FROM tabela_geral


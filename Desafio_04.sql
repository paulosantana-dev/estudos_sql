/*Desafio 04: O Mapa do Consumo
Objetivo: Entender onde estão concentrados os clientes da Olist para direcionar campanhas de marketing. O Enunciado: Crie um ranking dos 5 estados (UF) que possuem a maior quantidade de clientes. Queremos saber a sigla do estado e o número total de clientes em cada um.*/

SELECT
    customer_state,
    COUNT(DISTINCT(customer_unique_id)) AS Qtde_Clientes

FROM 
    `projeto-base-olist.olistBR.customers`

GROUP BY
    customer_state

ORDER BY
    COUNT(DISTINCT(customer_unique_id)) DESC

LIMIT 5
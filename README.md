# Análise de Dados E-commerce (Olist) - SQL & BigQuery

Este repositório contém meus estudos e projetos de análise de dados utilizando a base pública da **Olist** no **Google BigQuery**.

## 🛠️ Ambiente e Ferramentas
Diferente de uma configuração padrão, este projeto foi desenvolvido em ambiente **Linux (Ubuntu)** com as seguintes integrações:
* **Google Cloud SDK (gcloud):** Configurado para autenticação via terminal.
* **VS Code + BigQuery Runner:** Extensão utilizada para executar queries SQL diretamente no editor.
* **SQL Standard:** Consultas otimizadas para o motor do BigQuery.

## 📊 Estrutura dos Dados
A base de dados é composta por tabelas relacionais que cobrem todo o ciclo de vida de um pedido:
* `customers`: Localização e identificação dos clientes.
* `orders`: Status e datas de processamento dos pedidos.
* `payments`: Detalhes sobre formas de pagamento e parcelamento.
* `products`: Categorias e dimensões dos itens vendidos.

## 🚀 Desafios Implementados
Atualmente, o projeto foca em resolver problemas de negócio utilizando técnicas como **CTEs (Common Table Expressions)**, **Joins** e **Agregações**:

1. **Ranking de Faturamento por Cidade:** Identificação de polos comerciais com maior receita.
2. **Eficiência Logística:** Cálculo do tempo médio de entrega por categoria.
3. **Comportamento de Crédito:** Análise comparativa entre compras à vista e parceladas.
4. **Mapa do Consumo**: Identificação dos 5 estados com maior concentração de clientes.
5. **Sazonalidade (Dia da Semana)**: Análise de qual dia da semana registra o maior volume de pedidos.
6. **Ticket Médio por Estado**: Cálculo do valor médio gasto por pedido em cada estado.

---
*Configurado e mantido por Paulo.*
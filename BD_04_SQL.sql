-- 1. Qual a venda de maior valor: Max
select preco
FROM vw_relatorio
order by preco DESC
LIMIT 1;

select Max(preco) maior_valor_venda
from vw_relatorio;

-- 2. Qual a venda de menor valor: Min
select preco
FROM vw_relatorio
order by preco ASC
LIMIT 1;

select MIN(preco) menor_valor_venda
from vw_relatorio;

-- 3. Quantas vendas foram realizadas: Count
SELECT * FROM Venda;
SELECT * FROM vw_relatorio;

SELECT COUNT(*) contagem_vendas
FROM vw_relatorio;

-- 4. Quantos revendedores venderam produtos
SELECT COUNT(DISTINCT revendedor) contagem_revendedores
FROM vw_relatorio;

-- 5. Quantos clientes compraram produtos
SELECT COUNT(DISTINCT Cliente) contagem_clientes
FROM vw_relatorio;

-- 6. Quantos produtos distintos foram vendidos
SELECT COUNT(DISTINCT produto) contagem_produtos
FROM vw_relatorio;

-- 7. Quantos preços diferentes tem os produtos
SELECT COUNT(DISTINCT preco) contagem_clientes
FROM vw_relatorio;

-- 8. Quantos reais foram vendidos no total
SELECT SUM(preco) contagem_clientes
FROM vw_relatorio;

-- 9. Valor de Vendas por Vendedor
SELECT * 
FROM vw_relatorio
Order by revendedor;

SELECT Sum(preco) vendas_joao
FROM vw_relatorio
where revendedor = 'João'
UNION
SELECT Sum(preco) vendas_paulo
FROM vw_relatorio
where revendedor = 'Paulo';

SELECT
	revendedor,
	SUM(preco) soma_vendas
from vw_relatorio
group by revendedor;

-- 10. Quantidade de Vendas por Vendedor
SELECT
	revendedor,
	COUNT(*) quantidade_vendas
from vw_relatorio
group by revendedor;

-- 11. Quantidade de clientes por vendedor
SELECT
	revendedor,
	COUNT(DISTINCT cliente) quantidade_clientes
from vw_relatorio
group by revendedor;

-- 12. Quanto cada produto vendeu (quantidade)
select * from Venda order by produto;

SELECT produto, count(produto)
FROM Venda
group by produto;

-- 13. Quanto cada produto vendeu (valor)
select * from Venda order by produto;

SELECT produto, SUM(preco), avg(preco), preco
FROM Venda
group by produto
order by SUM(preco) DESC;

-- 14. Produtos que venderam mais de 3 unidades
SELECT
	produto,
    count(produto),
    CASE
    	WHEN count(produto) >= 3 THEN 'Vendeu mais que 3'
        ELSE 'Vendeu menos que 3'
    END
FROM Venda
group by produto
HAVING COUNT(produto) >= 3
ORDER BY COUNT(produto) DESC;

-- 15. Vendas do paulo por produto
SELECT produto, count(produto)
FROM vw_relatorio
where revendedor = 'Paulo'
group by produto

-- 15. Vendas do paulo por produto maior ou igual a 3
SELECT produto, count(produto)
FROM vw_relatorio
where revendedor = 'Paulo'
group by produto
HAVING count(produto) > 3;

/* Union */
SELECT produto, sum(preco)
FROM vw_relatorio
where revendedor = 'Paulo'
group by produto
UNION
SELECT 'Total', sum(preco)
FROM vw_relatorio
where revendedor = 'Paulo'
UNION ALL
SELECT 'shampoo', 21.9

/* Média */
SELECT avg(preco) from vw_relatorio;

SELECT
  sum(preco) soma,
  count(preco) quantidade,
  sum(preco)/COUNT(preco) média,
  avg(preco) media
FROM vw_relatorio;

/* Operações Matemáticas */
SELECT preco + 5
FROM vw_relatorio;

SELECT preco * 2
FROM vw_relatorio;

SELECT (preco * 2) * 0.50
FROM vw_relatorio;

SELECT (preco * 2)/2
FROM vw_relatorio;

SELECT preco/2
FROM vw_relatorio;

select 120/2 resultado, 121%2 resto
select 15978621585%100

/* Tratamento de Nulos */
CREATE VIEW vw_teste AS
select 1 id, null laboratorio, 'dorflex' remedio
UNION
select 2, 'labX', 'dorflex'
UNION
select 3, 'labY', 'dorflex'
UNION
select 4, null, null
UNION
select 5, 'labX', null
UNION
select 6, 'labY', null
;

select *
from vw_teste

select
  id,
  laboratorio,
  remedio,
  -- IFNULL(laboratorio, 0) laboratorio_trata_nulo,
  -- IFNULL(laboratorio, 'desconhecido') laboratorio_trata_nulo,
  IFNULL(laboratorio, remedio) laboratorio_trata_nulo,
  COALESCE(laboratorio, remedio) laboratorio_trata_nulo
from vw_teste

select *
from (
  select 1 id, null laboratorio, 'dorflex' remedio
  UNION
  select 2, 'labX', 'dorflex'
  UNION
  select 3, 'labY', 'dorflex'
  UNION
  select 4, null, null
  UNION
  select 5, 'labX', null
  UNION
  select 6, 'labY', null
) as teste

/* Sub-Select*/
select produto, preco
from vw_relatorio
where preco = (select max(preco) /*11*/ from vw_relatorio)
SELECT
	r.nome revendedor,
    c.nome cliente,
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
;

-- 1. Quais são os produtos vendidos?

SELECT DISTINCT
    v.produto produto
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
;

-- 2. Quais foram minhas últimas 3 vendas
SELECT
	v.id_venda nu_pedido,
	r.nome revendedor,
    c.nome cliente,
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
ORDER BY nu_pedido DESC
LIMIT 3
;

SELECT
	v.id_venda nu_pedido,
	r.nome revendedor,
    c.nome cliente,
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
WHERE v.id_venda > 10
ORDER BY nu_pedido DESC
;

-- 3. Quais são os produtos que começa com "s"
SELECT DISTINCT
    v.produto produto
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
WHERE v.produto LIKE 's%'
;

-- 4. Todos os produto e seus preços em ordem decrescente

SELECT DISTINCT
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
ORDER BY produto, preco DESC
;

-- 5. Todos os produto com preço entre 6 e 9 reais

SELECT DISTINCT
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
WHERE v.preco BETWEEN 6 and 8.9
order BY v.preco DESC
;

-- 6. Quero minhas vendas de shampoo e condicionador

SELECT
	r.nome revendedor,
    c.nome cliente,
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
where v.produto IN ('shampoo', 'condicionador')
;

-- 7. Quais produtos eu consigo comprar com 7 reais
SELECT DISTINCT
    v.produto produto,
    v.preco preco,
    CASE
    	WHEN v.preco > 7 THEN 'Não'
        -- WHEN v.preco <= 7 THEN 'Consigo comprar'
        ELSE 'Sim'
    END consigo_comprar
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
order by v.preco DESC
;

-- 8. Crie uma view que tenha o relatório de vendas 
/* CTA */
CREATE Table tb_relatorio AS
SELECT
	r.nome revendedor,
    c.nome cliente,
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
;

SELECT * FROM tb_relatorio;

/* View */
CREATE VIEW vw_relatorio AS
SELECT
	r.nome revendedor,
    c.nome cliente,
    v.produto produto,
    v.preco preco
FROM Cliente c
RIGHT JOIN Venda v
	ON v.id_cliente = c.id_cliente
LEFT JOIN Revendedor r
	on r.id_revendedor = v.id_revendedor
;

SELECT * FROM vw_relatorio;

INSERT INTO Venda (id_revendedor,id_cliente,produto,preco) VALUES
('2','2','desodorante','11.00'); 

SELECT * FROM Venda WHERE produto = 'desodorante';
SELECT * FROM vw_relatorio WHERE produto = 'desodorante';
SELECT * FROM tb_relatorio WHERE produto = 'desodorante';

SELECT * FROM tb_relatorio;
SELECT * FROM vw_relatorio;
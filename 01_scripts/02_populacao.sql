/* Tabela de Cliente */
INSERT INTO Cliente (nome) VALUES
('Matheus'),
('Marcos');

SELECT * FROM Cliente;

-- Tabela de Revendedor
INSERT INTO Revendedor (nome) VALUES
('Paulo'),
('João');

SELECT * FROM Revendedor;

/*Tabela de Vendas */
INSERT INTO Venda (id_revendedor,id_cliente,produto,preco) VALUES
(1,1,'sabonete',1.00),
(1,1,'sabonete',1.00 ),
(1,1,'shampoo',7.00 ),
(1,1,'condicionador',8.00 ),
(1,1,'sabonete',1.10 ),
(1,1,'shampoo',7.30 ),
(1,1,'condicionador',8.50 ),
(2,1,'sabonete',1.50 ),
(2,1,'shampoo',7.60 ),
(2,1,'condicionador',9.00 ),
(1,2,'sabonete',1.50 ),
(1,2,'shampoo',7.60 ),
(1,2,'condicionador',9.00 );

SELECT * FROM Venda;

CREATE TABLE `Revendedor` (
	`id_revendedor` INT NOT NULL UNIQUE AUTO_INCREMENT,
	`nome` varchar(50) NOT NULL,
	CONSTRAINT PK_Revendedor PRIMARY KEY (`id_revendedor`)
);

CREATE TABLE `Cliente` (
	`id_cliente` INT NOT NULL UNIQUE AUTO_INCREMENT,
	`nome` varchar(50) NOT NULL,
	CONSTRAINT PK_Cliente PRIMARY KEY (`id_cliente`)
);

CREATE TABLE `Venda` (
	`id_venda` INT NOT NULL UNIQUE AUTO_INCREMENT,
	`id_revendedor` INT NOT NULL,
	`id_cliente` INT NOT NULL,
	`produto` varchar(50) NOT NULL,
	`preco` DECIMAL(4,2) NOT NULL DEFAULT 0.00,
	CONSTRAINT PK_Venda PRIMARY KEY (`id_venda`) 
);

ALTER TABLE `Venda` ADD CONSTRAINT `FK_Revendedor` FOREIGN KEY (`id_revendedor`) REFERENCES `Revendedor`(`id_revendedor`);
ALTER TABLE `Venda` ADD CONSTRAINT `FK_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Cliente`(`id_cliente`);
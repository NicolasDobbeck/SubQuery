-- Cria a tabela "Clientes"
CREATE TABLE Clientes (
    ID NUMBER(5) PRIMARY KEY,
    Nome VARCHAR2(255),
    Cidade VARCHAR2(255),
    Sexo VARCHAR2(1),
    idade int
);

-- Insercao de dados na tabela "Clientes"
 INSERT INTO Clientes VALUES (1, 'Jo?o', 'Sao Paulo','M',20);
 INSERT INTO Clientes VALUES (2, 'Maria', 'Rio de Janeiro','F',30);
 INSERT INTO Clientes VALUES (3, 'Carlos', 'Belo Horizonte','M',20);
 INSERT INTO Clientes VALUES (4, 'Ana', 'Sao Paulo','F',25);
 INSERT INTO Clientes VALUES (5, 'Rafael', 'Rio de Janeiro','M',50);

-- Cria a tabela "Pedidos"
CREATE TABLE Pedidos (
    id NUMBER(5) PRIMARY KEY,
    cliente_id NUMBER(5),
    ds_produto VARCHAR2(255),
    vl_pedido Number (6,2),
	FOREIGN KEY (cliente_id) REFERENCES 
		Clientes (id)
);


-- Insercao de dados na tabela "Pedidos"
INSERT INTO Pedidos VALUES(101, 1, 'Celular', 1100.00);
INSERT INTO Pedidos VALUES(102, 2, 'Laptop', 4000.00);
INSERT INTO Pedidos VALUES(103, 3, 'Tablet', 3500.00);
INSERT INTO Pedidos VALUES(104, 1, 'TV', 5000.00);
INSERT INTO Pedidos VALUES(105, 4, 'Geladeira', 3000.00);


CREATE TABLE Funcionarios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Supervisor_ID INT
);


INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES (1, 'Joao', NULL); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (2, 'Maria', 1); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (3, 'Carlos', 1); 
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (4, 'Ana', 2);    
INSERT INTO Funcionarios (ID, Nome, Supervisor_ID) VALUES  (5, 'Rafael', 2); 


--Subquery

--IN
SELECT nome FROM Clientes WHERE id IN(SELECT cliente_id FROM Pedidos WHERE vl_pedido > 3000);

SELECT nome FROM Clientes WHERE id IN(SELECT cliente_id FROM Pedidos);

--NOT IN
SELECT nome FROM Clientes WHERE id NOT IN(SELECT cliente_id FROM Pedidos);

--EXISTS
SELECT nome FROM Clientes C WHERE EXISTS (SELECT 1 FROM Pedidos P WHERE P.cliente_id= C.ID);

-- NOT EXISTS
SELECT nome FROM Clientes C WHERE NOT EXISTS (SELECT 1 FROM Pedidos P WHERE P.cliente_id= C.ID);

--ANY
SELECT nome FROM Clientes WHERE idade > ANY (SELECT idade FROM Clientes WHERE Cidade = 'Sao Paulo');

--ALL
SELECT nome FROM Clientes WHERE idade > ALL (SELECT idade FROM Clientes WHERE Cidade = 'Sao Paulo');

--Inner Join
SELECT nome
FROM Clientes c INNER JOIN Pedidos p ON c.id=p.cliente_id
WHERE vl_pedido > 3000;

SELECT nome, idade FROM Clientes;





-- SELECT FUNCTIONS E GROUP BY
SELECT * FROM Clientes ORDER BY nome ASC;
SELECT * FROM Clientes ORDER BY nome DESC;

SELECT AVG(idade), COUNT(nome), MIN(idade), MAX(idade), STDDEV(idade), VARIANCE(idade) FROM Clientes;
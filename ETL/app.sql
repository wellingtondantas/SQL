CREATE TABLE vendas (
  id integer,
  data date,
  loja VARCHAR,
  cliente varchar,
  valor double precision
)

INSERT INTO vendas VALUES (1,'2010-10-03','Loja 1', 'Cliente 1', 1000);
INSERT INTO vendas VALUES (2,'2010-10-03','Loja 1', 'Cliente 2', 900);
INSERT INTO vendas VALUES (3,'2010-10-03','Loja 1', 'Cliente 3', 800);
INSERT INTO vendas VALUES (4,'2010-10-03','Loja 1', 'Cliente 4', 700);
INSERT INTO vendas VALUES (5,'2010-10-03','Loja 1', 'Cliente 5', 500);

INSERT INTO vendas VALUES (6,'2010-10-03','Loja 2', 'Cliente 1', 2000);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 2', 'Cliente 2', 1900);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 2', 'Cliente 3', 1800);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 2', 'Cliente 4', 1700);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 2', 'Cliente 5', 1500);

INSERT INTO vendas VALUES (6,'2010-10-03','Loja 3', 'Cliente 1', 3000);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 3', 'Cliente 2', 2900);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 3', 'Cliente 3', 2800);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 3', 'Cliente 4', 2700);
INSERT INTO vendas VALUES (6,'2010-10-03','Loja 3', 'Cliente 5', 2500);

SELECT * FROM vendas;

SELECT MAX(valor) FROM vendas WHERE loja='Loja 3';

select * from vendas where loja = 'Loja 1' order by loja DESC LIMIT 3


WITH vendas AS (
SELECT loja, cliente, MAX(valor) AS valor, 
ROW_NUMBER() OVER 
    (PARTITION BY loja ORDER BY MAX(valor) DESC)  RANK_cliente
    FROM vendas
GROUP BY loja, cliente, valor
 )
SELECT * FROM vendas
WHERE RANK_cliente <= 3 
ORDER BY 1 ASC



/* CRIAR TABELA SIMPLES (Forma errada)*/ 

CREATE TABLE CLIENTE(
CODIGO INTEGER,
NOME VARCHAR2(30),
CIDADE VARCHAR(20)
);

/* CRIAR TABELA COM PRIMARY KEY (Formar certa)*/ 
CREATE TABLE PRODUTO(
pro_codigo INTEGER NOT NULL,
pro_nome VARCHAR2(30) NOT NULL,
pro_preco NUMERIC(4,2) NOT NULL,
CONSTRAINT pk_pro_codigo PRIMARY KEY (pro_codigo)
);

/* INSERIR INFORMAÇÕES NA TABELA */ 
INSERT INTO cliente(codigo, nome, cidade) VALUES (1,'Carlos', 'Fortaleza');
INSERT INTO cliente VALUES (3,'Maiara', 'Ocara');

/* SELECIONAR INFORMAÇÕES NA TABELA */ 
SELECT * FROM cliente; /* Seleciona tudo */ 
SELECT codigo, nome FROM cliente; /* Seleciona somente colunas selecionadas */ 

/* SELECT (ORDER BY) */ 
SELECT * FROM cliente ORDER BY nome; /* Seleciona em ordem alfabetica por nome */ 
SELECT * FROM cliente ORDER BY nome DESC; /* Seleciona em decrescentemente em ordem por nome */ 
SELECT codigo,nome FROM cliente ORDER BY nome ASC; /* Seleciona em crescentemente em ordem por codigo,nome */ 
SELECT * FROM cliente ORDER BY codigo,cidade ASC; /* Organizar por código e por cidade */
SELECT * FROM cliente ORDER BY 3 DESC; /* Organizar pelo número da coluna */

/* SELECT (WHERE) */
SELECT * FROM cliente WHERE codigo=2; /* Seleciona pelo número do código*/ 
SELECT * FROM cliente WHERE codigo>1; /* Seleciona todas as linhas acima do número do código digitado*/ 
SELECT * FROM cliente WHERE codigo<>2; /*Diferente*/
SELECT * FROM cliente WHERE codigo=1 OR codigo=3; /*Seleciona as duas linhas de código 1 e 3*/
SELECT * FROM cliente WHERE cidade='Fortaleza';  /*Seleciona somente quem está na cidade de Fortaleza */

/* SELECT (LIKE) */
SELECT * FROM cliente WHERE nome LIKE '%arl%'; /* Seleciona linhas que tenham caracteres semelhantes ao informado [Procura informações]*/ 
SELECT * FROM cliente WHERE nome NOT LIKE '%arl%'; /* Seleciona linhas que NÂO tenham caracteres semelhantes ao informado [Procura informações]*/

/* SELECT (BETWEEN) */
SELECT * FROM cliente WHERE codigo=4 OR codigo=5 OR codigo=6; /*Mau prática*/
SELECT * FROM cliente WHERE codigo BETWEEN 4 AND 6; /*Boa prática*/
SELECT cidade, nome FROM cliente WHERE codigo BETWEEN 1 AND 8 AND cidade LIKE '%ort%'; /*Unido LIKE, BETWEEN, WHERE*/

/* SELECT (IN) */
SELECT * FROM cliente WHERE codigo=4 OR codigo=5 OR codigo=6; /*Mau prática*/
SELECT * FROM cliente WHERE codigo IN (4,5,6); /*Boa prática*/
SELECT * FROM cliente WHERE cidade IN ('Fortaleza','Caucaia'); 
SELECT * FROM cliente WHERE cidade NOT IN ('Fortaleza','Caucaia'); 

/* SELECT (DISTINCT) */
SELECT DISTINCT (cidade) FROM cliente; /*Seleciona os campos diferentes*/

/* APAGAR TABELA (DROP) */ 
DROP TABLE CLIENTE;

/* DESCRIÇÃO DA TABELA (DESCRIBE) OU (DESC) */ 
DESCRIBE PRODUTO;
DESC PRODUTO;

CREATE TABLE CLIENTE(
    CLI_CODIGO INTEGER NOT NULL,
    CLI_NOME VARCHAR2(30) NOT NULL,
    CLI_CIDADE VARCHAR2(30), 
    CONSTRAINT PK_CLI_CODIGO PRIMARY KEY (CLI_CODIGO)
);

/* ADICIONAR CAMPOS (ADD)  */ 
ALTER TABLE CLIENTE ADD CLI_UF CHAR(2);
ALTER TABLE CLIENTE ADD CLI_SEXO CHAR(2);
ALTER TABLE CLIENTE ADD (CLI_SEXO CHAR(2), CLI_UF CHAR(2));

/* ALTERAR CAMPOS (MODIFY)  */ 
ALTER TABLE CLIENTE MODIFY CLI_SEXO CHAR(1);
DESCRIBE CLIENTE;

/* EXCLUIR CAMPOS DA TABELA (DROP)  */ 
ALTER TABLE CLIENTE DROP (CLI_SEXO);

INSERT INTO CLIENTE VALUES (1,'WELLINGTON DANTAS','FORTALEZA', 'CE', 'M');
INSERT INTO CLIENTE VALUES (2,'MIRLÂNIA DANTAS','EUSEBIO', 'CE', 'F');
INSERT INTO CLIENTE VALUES (3,'ROGERIO DANTAS','BELO HORIZONTE', 'MG', 'M');
INSERT INTO CLIENTE VALUES (4,'RAFAEL DANTAS','MARACANAU', 'CE', 'M');
INSERT INTO CLIENTE VALUES (5,'MAIARA DANTAS','SÃO PAULO', 'SP', 'F');
INSERT INTO CLIENTE VALUES (6,'RAKEL DANTAS','CURITIBA', 'PR', 'F');

/* ATUALIZAR CAMPO (UPDATE)  */ 
UPDATE CLIENTE SET CLI_CIDADE='FORTALEZA'; /*atualiza todos os campos [MAU PRÁTICA] [CUIDADO]*/
UPDATE CLIENTE SET CLI_CIDADE='SÃO PAULO' WHERE CLI_CODIGO =1;

/* DELETAR REGISTROS (DELETE)  */ 
DELETE FROM CLIENTE; /*Deleta todos os campos [MAU PRÁTICA] [CUIDADO]*/
DELETE FROM CLIENTE WHERE CLI_CODIGO=3;
DELETE FROM CLIENTE WHERE CLI_CODIGO IN (1,4);
DELETE FROM CLIENTE WHERE CLI_CODIGO BETWEEN 2 AND 3;

/* DELETAR REGISTROS SEM VOLTA (TRUNCATE) */ 
TRUNCATE TABLE CLIENTE;

INSERT INTO PRODUTO VALUES (1, 'TOMATE', '2,50');
INSERT INTO PRODUTO VALUES (2, 'BATATA', '3,20');
INSERT INTO PRODUTO VALUES (3, 'CEBOLA', '5,00');
INSERT INTO PRODUTO VALUES (4, 'LARANJA', '0,20');
INSERT INTO PRODUTO VALUES (5, 'BANANA', '0,15');
INSERT INTO PRODUTO VALUES (6, 'COENTRO', '1,50');

/* MÉDIA DE UM CAMPO (AVG) */ 
SELECT AVG (PRO_PRECO) FROM PRODUTO;
SELECT AVG (PRO_PRECO) FROM PRODUTO WHERE PRO_CODIGO BETWEEN 4 AND 6;

/* SOMA DE UM CAMPO (SUM) */ 




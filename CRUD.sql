
/* CREATE ***************************     INSERIR INFORMAÇÕES NA TABELA       **************************/ 

/* Forma de inserção de dados na tabela */ 
INSERT INTO nome_da_tabela(campos1, compo2 ...,campoN) VALUES ('','',..,'');
/* ou */ 
INSERT INTO nome_da_tabela VALUES ('','',..,'');

/*exemplo de inserção de dados na tabela */ 
INSERT INTO PRODUTO(PRO_CODIGO, PRO_NOME, PRO_PRECO) VALUES (1,'CAJÚ', 0.50);
INSERT INTO PRODUTO VALUES (1,'CAJÚ', 0.50);


/* READ *****************************    SELECIONAR INFORMAÇÕES NA TABELA    ***************************/ 

/* Seleciona todas as linhas da tabela */ 
SELECT * FROM nome_da_tabela;
SELECT * FROM PRODUTO;

/* Seleciona somente colunas selecionadas */ 
SELECT campo1, campo2 FROM nome_da_tabela;


/* UPDATE ***************************      ATUALIZAR CAMPO (UPDATE)        *****************************/ 
UPDATE nome_da_tabela SET campo2='valor que vai ser alterado' WHERE compo1=1;
UPDATE PRODUTO SET PRO_NOME='TOMATE' WHERE PRO_CODIGO=1;


/* DELETE ***************************         DELETAR DADOS DA TABELA        ****************************/ 


/*Exemplo de exclusão de um registro de dados na tabela */
DELETE FROM nome_da_tabela WHERE campo1=1;
DELETE FROM PRODUTO WHERE PRO_CODIGO=1;


/* **********************************         CRIAÇÃO DE TABELAS        ********************************/ 

/* Exemplo de tabela (Formar não correta)*/ 
CREATE TABLE nome_da_tabela(
	campo1 INTEGER,
	campo2 VARCHAR2(30),
	campo3 VARCHAR(20)
);

/* Exemplo de Tabela com campos não nulo e chave primaria (Formar certa)*/ 
CREATE TABLE PRODUTO(
	PRO_CODIGO INTEGER NOT NULL,
	PRO_NOME VARCHAR2(30) NOT NULL,
	PRO_PRECO NUMERIC(4,2) NOT NULL,
	CONSTRAINT PK_PRO_CODIGO PRIMARY KEY (PRO_CODIGO)
);


/* ******************************* EXCLUSÃO DE TODOS OS REGISTRO DA TABELAS ***************************/ 
DROP TABLE nome_da_tabela;
DROP TABLE PRODUTO;



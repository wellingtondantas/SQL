/*

Considerando uma tabela com o nome: CLIENTE
E campos: CODIGO, NOME, CIDADE.

*/

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


/* DESCRIÇÃO DA TABELA (DESCRIBE) OU (DESC) */ 
DESCRIBE cliente;
DESC cliente;


/* ADICIONAR CAMPOS NA TABELA (ADD) */ 
ALTER TABLE cliente ADD cli_uf CHAR(2);
ALTER TABLE cliente ADD cli_sexo CHAR(2);
/* ou */
ALTER TABLE cliente ADD (cli_sexo CHAR(1), cli_uf CHAR(2));

/* ALTERAR CAMPOS (MODIFY)  */ 
ALTER TABLE cliente MODIFY cli_sexo CHAR(1);

/* EXCLUIR CAMPOS DA TABELA (DROP)  */ 
ALTER TABLE cliente DROP (cli_sexo);


/*

Considerando uma tabela com o nome: PRODUTO
E campos: PRO_CODIGO, PRO_NOME, PRO_PRECO.

*/


/* MÉDIA DE UM CAMPO (AVG) */ 
SELECT AVG (pro_preco) FROM produto;
SELECT AVG (pro_preco) FROM produto WHERE pro_codigo BETWEEN 4 AND 6;

/* SOMA DE UM CAMPO (SUM) */ 
SELECT SUM(pro_preco) FROM produto;
SELECT SUM(pro_preco) AS "Total Preço" FROM produto; /*coloca o título*/
SELECT SUM(pro_preco) AS "Total Preço", SUM(pro_codigo) FROM produto; /*somatório de mais de uma coluna*/

/* QUANTIDADE DE REGISTRO (COUNT) */ 
SELECT COUNT (*) FROM produto;
SELECT COUNT (pro_preco) FROM produto;

/* (MIN) e (MAX) */ 
SELECT MAX(pro_preco) FROM produto;
SELECT MIN(pro_preco) FROM produto;
SELECT MAX(pro_preco) AS "Preço mais baixo" FROM produto;
SELECT MAX(pro_nome) FROM produto;
SELECT MAX(pro_nome), MIN(pro_preco) FROM produto;

/* MAIÚSCULO (UPPER) e MINUSCULO (LOWER) */ 
SELECT LOWER(pro_nome) FROM produto;
SELECT UPPER(pro_nome) FROM produto;

/* CONCATENAR (||) */ 
SELECT pro_codigo || pro_nome || pro_preco FROM produto;
SELECT pro_codigo || pro_nome || pro_preco AS "Palavras juntas" FROM produto;
SELECT pro_codigo || '-' || pro_nome || '-' || pro_preco AS "Palavras juntas" FROM produto; /*Separa com um traço*/
SELECT pro_codigo || ' ' || pro_nome || ' ' || pro_preco AS "Palavras juntas" FROM produto; /*Separa com um espaço*/



/*

Considerando uma tabela com o nome: FUNCIONARIO
E campos: FUN_CIDADE, FUN_NOME, FUN_SALARIO.

*/


/* AGUPAMENTO (GROUP BY) */ 

SELECT COUNT(*),cli_cidade FROM cliente GROUP BY cli_cidade; /*Faz o agrupamento por cidade, ou seja, vai contar a ocorrência de cada cidade*/
SELECT COUNT(*) AS "Quantidade",cli_cidade FROM cliente GROUP BY cli_cidade;
SELECT fun_cidade, SUM(fun_salario) FROM funcionario GROUP BY fun_cidade ORDER BY 1;


/*

Considerando uma tabela com o nome: CIDADES
E campos: CID_CODIGO,CID_NOME.

*/


/* CHAVES ESTRANGEIRAS (FOREIGN KEY) */ 
CREATE TABLE cidades(
cid_codigo INTEGER NOT NULL,
cid_nome VARCHAR2(30) NOT NULL,
CONSTRAINT PK_cid_codigo PRIMARY KEY (cid_codigo));

ALTER TABLE cliente ADD CONSTRAINT FR_CLI_CIDCOD FOREIGN KEY (cli_codcid) REFERENCES cidades (cid_codigo); /*Faz a foreigh key*/


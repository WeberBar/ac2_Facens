/* Cria uma tabela chamada `Produtos` com os seguintes campos:
id_produto: chave primária auto-incrementada
nome: nome do produto
preco: preço do produto
estoque: quantidade em estoque
perecivel: indica se o produto é perecível
marca: marca do produto
nacionalidade: nacionalidade do produto */
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    preco DECIMAL(5 , 2 ) NOT NULL,
    estoque INT NOT NULL,
    perecivel CHAR(3) NOT NULL,
    marca VARCHAR(45),
    nacionalidade VARCHAR(45) 
);

/*Insere cinco registros na tabela `Produtos`, com todas colunas prenchidas: (A coluna do id é 'null' porque ela se auto-incrementa,
assim preenchendo esse campo sozinho)
-- Nescau
-- Bolinho de chocolate
-- Salgadinho de queijo
-- Cerveja
-- Vinho tinto
*/
INSERT INTO Produtos values 
(null, "Nescau", 8.74, 10, "não", "nestle", "brasileiro"),
(null, "Bolinho de chocolate", 6.00, 18, "sim", "Ana Maria", "brasileiro"),
(null, "Salgadinho de queijo", 10.99, 25, "sim", "Cheetos", "norte-americano"),
(null, "Cerveja", 9.50, 9, "não", "heineken", "holandesa"),
(null, "Vinho tinto", 30.00, 12, "não", "vinícola goes", "brasileiro");

-- Retorna todos os registros da tabela `Produtos`.
SELECT * FROM Produtos;

-- Retorna o número total de registros na tabela `Produtos`.
SELECT COUNT(*) AS Total_produtos_cadastrados FROM Produtos;

-- Retorna o preço médio dos produtos na tabela `Produtos`.
SELECT AVG(preco) AS Preco_medio_produtos FROM Produtos;

-- Retorna o preço médio dos produtos perecíveis e não perecíveis.
SELECT perecivel, AVG(preco) AS Preco_medio FROM Produtos GROUP BY perecivel;

-- Retorna o preço médio de cada produto.
SELECT nome, AVG(preco) AS Preco_medio FROM Produtos GROUP BY nome;

-- Retorna o preço médio e a quantidade total em estoque dos produtos.
SELECT AVG(preco) AS media_preco, SUM(estoque) AS quantidade_estoque FROM Produtos;

-- Retorna o nome, a marca e o estoque do produto com o preço mais alto.
SELECT nome, marca, estoque FROM Produtos WHERE preco = (SELECT MAX(preco) FROM Produtos);

-- Retorna todos os produtos com preço acima da média.
SELECT * FROM Produtos WHERE preco > (SELECT AVG(preco) FROM Produtos);

-- Retorna a quantidade de produtos por nacionalidade.
SELECT nacionalidade, COUNT(*) AS Quantidade_de_produtos FROM Produtos GROUP BY nacionalidade;

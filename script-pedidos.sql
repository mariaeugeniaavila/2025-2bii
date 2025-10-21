DROP TABLE IF EXISTS ItensPedido;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Categorias;
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
  id_cliente   INT PRIMARY KEY,
  nome         VARCHAR(100) NOT NULL,
  cidade       VARCHAR(60) NOT NULL
);

CREATE TABLE Pedidos (
  id_pedido    INT PRIMARY KEY,
  id_cliente   INT NOT NULL,
  data_pedido  DATE NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Categorias (
  id_categoria   INT PRIMARY KEY,
  nome_categoria VARCHAR(60) NOT NULL
);

CREATE TABLE Produtos (
  id_produto     INT PRIMARY KEY,
  nome_produto   VARCHAR(100) NOT NULL,
  id_categoria   INT NOT NULL,
  preco          DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

CREATE TABLE ItensPedido (
  id_pedido   INT NOT NULL,
  id_produto  INT NOT NULL,
  quantidade  INT NOT NULL,
  PRIMARY KEY (id_pedido, id_produto),
  FOREIGN KEY (id_pedido)  REFERENCES Pedidos(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);


INSERT INTO Clientes VALUES
 (1,'Ana Souza','Salvador'),
 (2,'Bruno Lima','Guanambi'),
 (3,'Carla Nunes','Vitória da Conquista'),
 (4,'Daniel Amorim','Guanambi'),
 (5,'Elisa Prado','Feira de Santana');

INSERT INTO Pedidos VALUES
 (101, 1, DATE '2025-08-01'),
 (102, 2, DATE '2025-08-02'),
 (103, 2, DATE '2025-08-05'),
 (104, 3, DATE '2025-08-06');

INSERT INTO Categorias VALUES
 (10,'Livros'),
 (20,'Eletrônicos'),
 (30,'Papelaria'),
 (40,'Sem Produtos');

INSERT INTO Produtos VALUES
 (1001,'Livro SQL',          10, 79.90),
 (1002,'Teclado Mecânico',   20, 259.00),
 (1003,'Caderno 96f',        30, 19.50),
 (1004,'Mouse Óptico',       20, 89.00),
 (1005,'Livro Kubernetes',   10, 119.90);

INSERT INTO ItensPedido VALUES
 (101, 1001, 1),
 (102, 1002, 1),
 (102, 1003, 3),
 (103, 1004, 2),
 (104, 1003, 2);

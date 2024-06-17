CREATE DATABASE loja_virtual;
USE loja_virtual;

-- Criação da Tabela Cliente
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Criação da Tabela Administrador
CREATE TABLE Administrador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

-- Criação da Tabela Produto
CREATE TABLE Produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(100),
    qtdeEmEstoque INT NOT NULL,
    imagem VARCHAR(255)
);

-- Criação da Tabela CarrinhoDeCompras
CREATE TABLE CarrinhoDeCompras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clienteId INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (clienteId) REFERENCES Cliente(id)
);

-- Criação da Tabela ItemDoCarrinho
CREATE TABLE ItemDoCarrinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrinhoId INT,
    produtoId INT,
    quantidade INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (carrinhoId) REFERENCES CarrinhoDeCompras(id),
    FOREIGN KEY (produtoId) REFERENCES Produto(id)
);

-- Criação da Tabela Pedido
CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    clienteId INT,
    data DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (clienteId) REFERENCES Cliente(id)
);

-- Criação da Tabela Promocao
CREATE TABLE Promocao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT,
    dataInicio DATE,
    dataFim DATE,
    tipoDesconto VARCHAR(50),
    valorDesconto DECIMAL(10, 2)
);

-- Criação da Tabela Conteudo
CREATE TABLE Conteudo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    corpo TEXT,
    dataPub DATE,
    autor VARCHAR(100) NOT NULL
);

-- Criação da Tabela Comentario
CREATE TABLE Comentario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    conteudoId INT,
    autor VARCHAR(100) NOT NULL,
    texto TEXT,
    data DATE,
    FOREIGN KEY (conteudoId) REFERENCES Conteudo(id)
);

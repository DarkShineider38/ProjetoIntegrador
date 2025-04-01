CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco TEXT
);

CREATE TABLE Veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    modelo VARCHAR(100) NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    ano INT,
    historico TEXT
);

CREATE TABLE Orcamento (
    id_orcamento SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES Cliente(id_cliente),
    id_veiculo INT REFERENCES Veiculo(id_veiculo),
    data_orcamento DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(10,2)
);

CREATE TABLE OrdemServico (
    id_os SERIAL PRIMARY KEY,
    id_orcamento INT REFERENCES Orcamento(id_orcamento),
    status VARCHAR(50) CHECK (status IN ('Aberto', 'Em Andamento', 'Concluído', 'Cancelado')),
    data_inicio DATE,
    data_fim DATE
);

CREATE TABLE Produto (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE Estoque (
    id_estoque SERIAL PRIMARY KEY,
    id_produto INT REFERENCES Produto(id_produto),
    quantidade INT NOT NULL,
    alerta_reposicao INT DEFAULT 5
);

CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_os INT REFERENCES OrdemServico(id_os),
    valor_pago DECIMAL(10,2),
    data_pagamento DATE DEFAULT CURRENT_DATE,
    metodo_pagamento VARCHAR(50)
);

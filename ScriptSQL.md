-- Tabela para os planos de internet oferecidos
CREATE TABLE IF NOT EXISTS planos (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(100) NOT NULL,              -- Ex: "Fibra 300 Mega"
    velocidade_download_mbps INT NOT NULL,         -- Velocidade de download em Megabits
    velocidade_upload_mbps INT NOT NULL,           -- Velocidade de upload em Megabits
    preco_mensal DECIMAL(10, 2) NOT NULL,          -- Valor da mensalidade
    tipo_conexao ENUM('Fibra', 'Radio', 'Cabo') NOT NULL -- Tecnologia usada
);
CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    sexo ENUM('M', 'F'),
    email VARCHAR(150) NOT NULL
);
alter table users add column password varchar(255);

CREATE TABLE IF NOT EXISTS assinaturas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_assinatura DATE NOT NULL,                         
    status ENUM('ATIVA', 'CANCELADA', 'SUSPENSA') NOT NULL, 
    endereco_instalacao TEXT NOT NULL,                    
    user_id INT NOT NULL,                                  
    plano_id INT NOT NULL,                                 
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (plano_id) REFERENCES planos(id)
);

CREATE TABLE IF NOT EXISTS faturas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,                 
    data_vencimento DATE NOT NULL,                 
    data_pagamento DATE,                           
    status ENUM('PENDENTE', 'PAGA', 'ATRASADA') NOT NULL,
    assinatura_id INT NOT NULL,                   

    FOREIGN KEY (assinatura_id) REFERENCES assinaturas(id)
);
create database provedor;
INSERT INTO users (nome, sexo, email, password) 
VALUE ('Pierre Cauê', 'M', 'pierrecaue82@gmail.com', 'pmWGoVBC/51Bfkhn79xPuKBB/z//+n6Zjofn96J64w==');
use provedor;
select * from users;
use provedor;

-- Insere alguns planos de internet para teste
-- Insere alguns planos de internet para teste
INSERT INTO planos (nome_plano, velocidade_download_mbps, velocidade_upload_mbps, preco_mensal, tipo_conexao) VALUES
('Fibra Essencial', 200, 100, 99.90, 'Fibra'),
('Fibra Gamer Pro', 500, 250, 149.90, 'Fibra');

-- Cria uma assinatura para o seu usuário (assumindo que o ID do usuário 'pierrecaue82@gmail.com' é 1)
-- e vincula ao plano 'Fibra Essencial' (ID 1)
INSERT INTO assinaturas (data_assinatura, status, endereco_instalacao, user_id, plano_id) VALUES
('2024-01-15', 'ATIVA', 'Rua das Flores, 123, Centro, Machado/MG', 1, 1);

-- Cria várias faturas para a mesma assinatura (ID 1)
-- Fatura de Janeiro (Atrasada)
INSERT INTO faturas (valor, data_vencimento, data_pagamento, status, assinatura_id) VALUES
(99.90, '2025-01-10', NULL, 'ATRASADA', 1);

-- Fatura de Fevereiro (Atrasada)
INSERT INTO faturas (valor, data_vencimento, data_pagamento, status, assinatura_id) VALUES
(99.90, '2025-02-10', NULL, 'ATRASADA', 1);

-- Fatura de Março (Paga)
INSERT INTO faturas (valor, data_vencimento, data_pagamento, status, assinatura_id) VALUES
(99.90, '2025-03-10', '2025-03-08', 'PAGA', 1);

-- Fatura de Abril (Paga)
INSERT INTO faturas (valor, data_vencimento, data_pagamento, status, assinatura_id) VALUES
(99.90, '2025-04-10', '2025-04-10', 'PAGA', 1);

-- Fatura de Maio (Atrasada)
INSERT INTO faturas (valor, data_vencimento, data_pagamento, status, assinatura_id) VALUES
(99.90, '2025-05-10', NULL, 'ATRASADA', 1);

-- Fatura de Junho (Atrasada)
INSERT INTO faturas (valor, data_vencimento, data_pagamento, status, assinatura_id) VALUES
(99.90, '2025-06-10', NULL, 'ATRASADA', 1);

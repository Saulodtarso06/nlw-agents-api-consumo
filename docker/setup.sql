
-- Ativa a extensão PGVector
CREATE EXTENSION IF NOT EXISTS vector;

-- Criação da tabela de agentes
CREATE TABLE IF NOT EXISTS agents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Criação da tabela de mensagens
CREATE TABLE IF NOT EXISTS messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_id UUID REFERENCES agents(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    embedding VECTOR(1536), -- exemplo comum com embeddings OpenAI
    created_at TIMESTAMP DEFAULT NOW()
);

-- Dados iniciais (opcional)
INSERT INTO agents (name, email) VALUES 
('Saulo de Tarso', 'saulodtarso@empresa.com'),
('Natalie Renee', 'natalie_renee@empresa.com');

INSERT INTO messages (agent_id, content)
SELECT id, 'Primeira mensagem do agente.'
FROM agents
WHERE email = 'saulodtarso@empresa.com';

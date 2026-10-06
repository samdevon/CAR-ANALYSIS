-- ============================================================
-- CAR-ANALYSIS
-- Estrutura inicial do banco de dados
-- Banco: SQLite
-- ============================================================


-- ============================================================
-- 1. MARCAS
-- ============================================================

CREATE TABLE marcas (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);


-- ============================================================
-- 2. CATEGORIAS
-- ============================================================

CREATE TABLE categorias (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);


-- ============================================================
-- 3. TIPOS DE MOTORIZAÇÃO
-- ============================================================

CREATE TABLE tipos_motorizacao (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);


-- ============================================================
-- 4. MODELOS
-- ============================================================

CREATE TABLE modelos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    marca_id INTEGER NOT NULL,

    FOREIGN KEY (marca_id)
        REFERENCES marcas(id),

    UNIQUE (marca_id, nome)
);


-- ============================================================
-- 5. VEÍCULOS / VERSÕES
-- ============================================================

CREATE TABLE veiculos (
    id INTEGER PRIMARY KEY,
    modelo_id INTEGER NOT NULL,
    categoria_id INTEGER NOT NULL,
    motorizacao_id INTEGER NOT NULL,
    ano INTEGER NOT NULL,
    versao TEXT NOT NULL,

    FOREIGN KEY (modelo_id)
        REFERENCES modelos(id),

    FOREIGN KEY (categoria_id)
        REFERENCES categorias(id),

    FOREIGN KEY (motorizacao_id)
        REFERENCES tipos_motorizacao(id),

    UNIQUE (modelo_id, ano, versao)
);


-- ============================================================
-- 6. DESEMPENHO
-- ============================================================

CREATE TABLE desempenho (
    id INTEGER PRIMARY KEY,
    veiculo_id INTEGER NOT NULL,

    potencia_cv REAL,
    torque_nm REAL,
    peso_kg REAL,
    aceleracao_0_100 REAL,
    velocidade_maxima_kmh REAL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id),

    UNIQUE (veiculo_id)
);


-- ============================================================
-- 7. EFICIÊNCIA ENERGÉTICA
-- ============================================================

CREATE TABLE eficiencia (
    id INTEGER PRIMARY KEY,
    veiculo_id INTEGER NOT NULL,

    consumo_urbano REAL,
    consumo_rodoviario REAL,
    consumo_energia_mj_km REAL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id),

    UNIQUE (veiculo_id)
);


-- ============================================================
-- 8. AUTONOMIA
-- ============================================================

CREATE TABLE autonomia (
    id INTEGER PRIMARY KEY,
    veiculo_id INTEGER NOT NULL,

    autonomia_km REAL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id),

    UNIQUE (veiculo_id)
);


-- ============================================================
-- 9. CONFORTO E CAPACIDADE
-- ============================================================

CREATE TABLE conforto_capacidade (
    id INTEGER PRIMARY KEY,
    veiculo_id INTEGER NOT NULL,

    porta_malas_litros REAL,
    ocupantes INTEGER,

    conforto_bancos REAL,
    conforto_suspensao REAL,
    isolamento_acustico REAL,
    vibracoes_internas REAL,
    climatizacao REAL,
    ergonomia REAL,
    qualidade_materiais REAL,
    acabamento REAL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id),

    UNIQUE (veiculo_id)
);


-- ============================================================
-- 10. RECURSOS DE TECNOLOGIA E SEGURANÇA
-- ============================================================

CREATE TABLE recursos (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    tipo TEXT NOT NULL
);


-- ============================================================
-- 11. RECURSOS DISPONÍVEIS EM CADA VEÍCULO
-- ============================================================

CREATE TABLE veiculo_recursos (
    veiculo_id INTEGER NOT NULL,
    recurso_id INTEGER NOT NULL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id),

    FOREIGN KEY (recurso_id)
        REFERENCES recursos(id),

    PRIMARY KEY (veiculo_id, recurso_id)
);


-- ============================================================
-- 12. PREÇOS
-- ============================================================

CREATE TABLE precos (
    id INTEGER PRIMARY KEY,
    veiculo_id INTEGER NOT NULL,

    valor REAL NOT NULL,
    data_referencia TEXT NOT NULL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id)
);


-- ============================================================
-- 13. MERCADOS
-- ============================================================

CREATE TABLE mercados (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    pais TEXT NOT NULL
);


-- ============================================================
-- 14. FONTES
-- ============================================================

CREATE TABLE fontes (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    url TEXT
);


-- ============================================================
-- 15. FONTES DOS DADOS DOS VEÍCULOS
-- ============================================================

CREATE TABLE fontes_veiculos (
    veiculo_id INTEGER NOT NULL,
    fonte_id INTEGER NOT NULL,
    mercado_id INTEGER NOT NULL,

    FOREIGN KEY (veiculo_id)
        REFERENCES veiculos(id),

    FOREIGN KEY (fonte_id)
        REFERENCES fontes(id),

    FOREIGN KEY (mercado_id)
        REFERENCES mercados(id),

    PRIMARY KEY (veiculo_id, fonte_id, mercado_id)
);
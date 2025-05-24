-- Primeiro apagamos se já existir
DROP TABLE IF EXISTS Joga cascade;
DROP TABLE IF EXISTS Participa cascade;
DROP TABLE IF EXISTS Jogador cascade;
DROP TABLE IF EXISTS Arbitro cascade;
DROP TABLE IF EXISTS Partida cascade;
DROP TABLE IF EXISTS Campeonato cascade;
DROP TABLE IF EXISTS Time cascade;
DROP TABLE IF EXISTS Tabela cascade;

-- Criação das tabelas

CREATE TABLE Time (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estadio VARCHAR(100) NOT NULL
);

CREATE TABLE Campeonato (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ano INT NOT NULL
);

CREATE TABLE Partida (
    id SERIAL PRIMARY KEY,
    campeonato_id INT REFERENCES Campeonato(id),
    rodada INT NOT NULL,
    time1_id INT REFERENCES Time(id),
    time2_id INT REFERENCES Time(id),
    data VARCHAR(15) NOT NULL,
    placar_time1 INT NOT NULL,
    placar_time2 INT NOT NULL
);

CREATE TABLE Arbitro (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    federacao VARCHAR(100) NOT NULL
);

CREATE TABLE Jogador (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL,
    time VARCHAR(50) NOT NULL,
    posicao VARCHAR(30) NOT NULL
);

CREATE TABLE Participa (
    campeonato_id INT REFERENCES Campeonato(id),
    time_id INT REFERENCES Time(id),
    PRIMARY KEY (campeonato_id, time_id)
);

CREATE TABLE Joga (
    partida_id INT REFERENCES Partida(id),
    arbitro_id INT REFERENCES Arbitro(id),
    PRIMARY KEY (partida_id, arbitro_id)
);

CREATE TABLE Tabela (
    campeonato_id INT REFERENCES Campeonato(id),
    time_id INT REFERENCES Time(id),
    pontos INT NOT NULL,
    vitorias INT NOT NULL,
    empates INT NOT NULL,
    derrotas INT NOT NULL,
    gols_pro INT NOT NULL,
    gols_contra INT NOT NULL,
    saldo_gols INT NOT NULL,
    PRIMARY KEY (time_id,campeonato_id)
);

-- Executar em uma instância MySQL sem a base POKEDEX.
-- O script não apaga bancos existentes.

CREATE DATABASE POKEDEX CHARACTER SET utf8mb4;
USE POKEDEX;


CREATE TABLE TIPO(
	id_tipo INT AUTO_INCREMENT,
    nome VARCHAR(8) NOT NULL UNIQUE,

    primary key(id_tipo)
) ENGINE=InnoDB;


CREATE TABLE HABILIDADE(
	id_habilidade INT AUTO_INCREMENT,
    nome VARCHAR(16) not null UNIQUE,

    primary key(id_habilidade)
) ENGINE=InnoDB;


CREATE TABLE POKEMON(
	numero_pokedex INT,
    nome VARCHAR(12) NOT NULL UNIQUE,
    altura DECIMAL(10,2) NOT NULL,
    peso DECIMAL(10,2) NOT NULL,
    num_pre_evolucao INT,

    primary key (numero_pokedex),
    foreign key(num_pre_evolucao) references POKEMON(numero_pokedex)
) ENGINE=InnoDB;


CREATE TABLE MOVIMENTO(
	id_movimento INT AUTO_INCREMENT,
    nome varchar(27) NOT NULL UNIQUE,
    poder INT NOT NULL,
    precisao INT NOT NULL,
    id_tipo INT NOT NULL,

    primary key(id_movimento),
    foreign key(id_tipo) references TIPO(id_tipo)
) ENGINE=InnoDB;



CREATE TABLE POKEMON_TIPO(
	numero_pokedex INT,
	id_tipo INT,

	primary key(numero_pokedex, id_tipo),
	foreign key(numero_pokedex) references POKEMON(numero_pokedex),
	foreign key(id_tipo) references TIPO(id_tipo)
) ENGINE=InnoDB;


CREATE TABLE POKEMON_MOVIMENTO(
	numero_pokedex INT,
    id_movimento INT,

    primary key(numero_pokedex, id_movimento),
    foreign key(numero_pokedex) references POKEMON(numero_pokedex),
    foreign key(id_movimento) references MOVIMENTO(id_movimento)
) ENGINE=InnoDB;


CREATE TABLE POKEMON_HABILIDADE(
	numero_pokedex INT,
    id_habilidade INT,

    primary key(numero_pokedex, id_habilidade),
    foreign key(numero_pokedex) references POKEMON(numero_pokedex),
    foreign key(id_habilidade) references HABILIDADE(id_habilidade)
) ENGINE=InnoDB;


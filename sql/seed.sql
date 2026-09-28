-- Executar uma vez, após schema.sql, com as tabelas vazias.
-- Os IDs AUTO_INCREMENT referenciados abaixo seguem a ordem de inserção.
USE POKEDEX;

INSERT INTO TIPO(nome) VALUES ('Grass');
INSERT INTO TIPO(nome) VALUES ('Poison');
INSERT INTO TIPO(nome) VALUES ('Normal');
INSERT INTO TIPO(nome) VALUES ('Water');
INSERT INTO TIPO(nome) VALUES ('Electric');


INSERT INTO HABILIDADE(nome) VALUES ('Overgrow');
INSERT INTO HABILIDADE(nome) VALUES ('Chlorophyll');
INSERT INTO HABILIDADE(nome) VALUES ('Run Away');
INSERT INTO HABILIDADE(nome) VALUES ('Adaptability');
INSERT INTO HABILIDADE(nome) VALUES ('Anticipation');
INSERT INTO HABILIDADE(nome) VALUES ('Water Absorb');
INSERT INTO HABILIDADE(nome) VALUES ('Hydration');
INSERT INTO HABILIDADE(nome) VALUES ('Volt Absorb');
INSERT INTO HABILIDADE(nome) VALUES ('Quick Feet');


INSERT INTO POKEMON(numero_pokedex, nome,altura,peso) VALUES(1,'Bulbasaur',0.7,6.9);
INSERT INTO POKEMON(numero_pokedex, nome, altura, peso, num_pre_evolucao) VALUES(2,'Ivysaur', 1.0, 13.0, 1);
INSERT INTO POKEMON(numero_pokedex, nome, altura, peso, num_pre_evolucao) VALUES(3,'Venusaur', 2, 100,2);
INSERT INTO POKEMON(numero_pokedex, nome, altura, peso) VALUES (133, 'Eevee', .3, 6.5);
INSERT INTO POKEMON(numero_pokedex, nome, altura, peso, num_pre_evolucao) VALUES (134, 'Vaporeon', 1.0, 29.0, 133);
INSERT INTO POKEMON(numero_pokedex, nome, altura, peso, num_pre_evolucao) VALUES (135, 'Jolteon', 0.8, 24.5, 133);


INSERT INTO MOVIMENTO(nome,poder,precisao, id_tipo) VALUES('Vine Whip', 45, 100, 1);
INSERT INTO MOVIMENTO(nome,poder,precisao, id_tipo) VALUES('Water Pulse', 60, 100, 4);
INSERT INTO MOVIMENTO(nome,poder,precisao, id_tipo) VALUES('Thunderbolt', 90, 100, 5);
INSERT INTO MOVIMENTO(nome,poder,precisao, id_tipo) VALUES('Take Down', 90, 85, 3);
INSERT INTO MOVIMENTO(nome,poder,precisao, id_tipo) VALUES('Sludge Bomb', 90, 100, 2);


INSERT INTO POKEMON_TIPO (numero_pokedex, id_tipo)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(133, 3),
(134, 4),
(135, 5);

INSERT INTO POKEMON_HABILIDADE (numero_pokedex, id_habilidade)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(133, 3),
(133, 4),
(133, 5),
(134, 6),
(134, 7),
(135, 8),
(135, 9);

INSERT INTO POKEMON_MOVIMENTO(numero_pokedex, id_movimento) Values
(1,1),
(1,5),
(2,1),
(2,5),
(3,1),
(3,5),
(133,4),
(134,2),
(135,3);

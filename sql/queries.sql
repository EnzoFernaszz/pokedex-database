USE POKEDEX;

-- 1. Listar número da Pokédex e nome de todos os Pokémon, ordenados pelo número.
SELECT numero_pokedex, nome from POKEMON
order by numero_pokedex;

-- 2. Listar cada Pokémon e cada tipo associado a ele.
SELECT POKEMON.nome, TIPO.nome from POKEMON_TIPO
JOIN POKEMON on POKEMON.numero_pokedex = POKEMON_TIPO.numero_pokedex
JOIN TIPO on TIPO.id_tipo = POKEMON_TIPO.id_tipo;

-- 3. Listar Pokémon e habilidades, ordenando por número da Pokédex e nome da habilidade.
SELECT POKEMON.nome, HABILIDADE.nome from POKEMON_HABILIDADE
join POKEMON on POKEMON.numero_pokedex = POKEMON_HABILIDADE.numero_pokedex
join HABILIDADE on HABILIDADE.id_habilidade = POKEMON_HABILIDADE.id_habilidade
order by POKEMON.numero_pokedex, HABILIDADE.nome;

-- 4. Listar Pokémon, movimento e tipo do movimento, ordenando por número e movimento.
SELECT POKEMON.nome, MOVIMENTO.nome, TIPO.nome from POKEMON_MOVIMENTO
join POKEMON on POKEMON.numero_pokedex = POKEMON_MOVIMENTO.numero_pokedex
join MOVIMENTO on MOVIMENTO.id_movimento = POKEMON_MOVIMENTO.id_movimento
join TIPO on MOVIMENTO.id_tipo = TIPO.id_tipo
ORDER BY POKEMON.numero_pokedex, MOVIMENTO.nome;

-- 5. Listar Pokémon e movimentos do tipo Poison, ordenados pelo número da Pokédex.
-- Mantida também a coluna de tipo presente na solução original.
SELECT POKEMON.nome, MOVIMENTO.nome, TIPO.nome from POKEMON_MOVIMENTO
join POKEMON on POKEMON.numero_pokedex = POKEMON_MOVIMENTO.numero_pokedex
join MOVIMENTO on MOVIMENTO.id_movimento = POKEMON_MOVIMENTO.id_movimento
join TIPO on MOVIMENTO.id_tipo = TIPO.id_tipo
WHERE TIPO.nome = 'Poison'
order by POKEMON.numero_pokedex;

-- 6. Contar movimentos cadastrados por Pokémon, do maior total para o menor.
-- O INNER JOIN original inclui apenas Pokémon com movimentos cadastrados.
SELECT POKEMON.nome, count(MOVIMENTO.nome) from POKEMON_MOVIMENTO
join POKEMON on POKEMON.numero_pokedex = POKEMON_MOVIMENTO.numero_pokedex
join MOVIMENTO on MOVIMENTO.id_movimento = POKEMON_MOVIMENTO.id_movimento
Group by POKEMON.numero_pokedex
ORDER BY COUNT(MOVIMENTO.nome) DESC;

-- 7. Mostrar Pokémon com pelo menos dois movimentos, do maior total para o menor.
SELECT POKEMON.nome, count(MOVIMENTO.id_movimento) from POKEMON_MOVIMENTO
join POKEMON on POKEMON.numero_pokedex = POKEMON_MOVIMENTO.numero_pokedex
join MOVIMENTO on MOVIMENTO.id_movimento = POKEMON_MOVIMENTO.id_movimento
GROUP BY POKEMON.numero_pokedex, POKEMON.nome
HAVING count(MOVIMENTO.id_movimento) >= 2
order by count(MOVIMENTO.id_movimento) DESC;

-- 8. Contar habilidades de todos os Pokémon, incluindo zero para quem não tem associações.
SELECT POKEMON.nome, count(HABILIDADE.id_habilidade) from POKEMON
LEFT JOIN POKEMON_HABILIDADE on POKEMON_HABILIDADE.numero_pokedex = POKEMON.numero_pokedex
LEFT JOIN HABILIDADE on HABILIDADE.id_habilidade = POKEMON_HABILIDADE.id_habilidade
GROUP BY POKEMON.numero_pokedex, POKEMON.nome;

-- 9. Mostrar todos os Pokémon e suas pré-evoluções; ausência aparece como NULL.
SELECT atual.nome AS pokemon, anterior.nome AS pre_evolucao FROM POKEMON AS atual
LEFT JOIN POKEMON as anterior on atual.num_pre_evolucao = anterior.numero_pokedex;

-- 10. Listar Pokémon do tipo Grass usando subquery.
-- Na amostra de seed.sql, Grass recebe id_tipo = 1.
SELECT nome from POKEMON
where numero_pokedex IN (
	SELECT numero_pokedex
    FROM POKEMON_TIPO
    WHERE id_tipo = 1
);

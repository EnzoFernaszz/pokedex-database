# Escopo e regras de negócio

Registro retrospectivo do escopo definido durante o exercício. O desenvolvimento partiu de um briefing e de esclarecimentos incrementais sobre cardinalidades e regras; este documento foi organizado depois da implementação.

- Representar espécies de Pokémon, identificadas pelo número da Pokédex, com nome, altura e peso.
- Cada Pokémon deve possuir pelo menos um tipo, um movimento e uma habilidade possível. As três relações são N:N: cada tipo, movimento ou habilidade pode estar associado a várias espécies.
- Tipos, movimentos e habilidades podem ser cadastrados sem associações com Pokémon.
- Cada movimento possui nome, poder, precisão e exatamente um tipo. Um tipo pode existir sem movimentos associados.
- Cada espécie possui no máximo uma pré-evolução e pode originar várias evoluções, permitindo ramificações como Eevee para Vaporeon e Jolteon.
- O banco representa espécies, não indivíduos. Treinadores, métodos de evolução, níveis, IV/EV e outros atributos individuais ficam fora do escopo.

## Implementação e limites

As relações N:N usam tabelas associativas com chaves primárias compostas. A evolução usa `POKEMON.num_pre_evolucao`, uma FK opcional para `POKEMON.numero_pokedex`. Os nomes de Pokémon, tipos, habilidades e movimentos são únicos na implementação.

O schema permite inserir um Pokémon antes de suas associações: as FKs não impõem a participação mínima de uma associação por espécie. A amostra fornecida satisfaz essa regra de negócio. A consulta com `LEFT JOIN` permite identificar espécies sem habilidades cadastradas.

A FK de evolução exige que a espécie referenciada exista, mas não impede ciclos ou uma espécie apontar para si mesma. A amostra não contém esses casos. Validações adicionais ficam como possibilidade futura.

## Consultas do exercício

As dez consultas originais estão em `sql/queries.sql`, com seus enunciados: listagem básica, tipos, habilidades, movimentos e seus tipos, filtro por Poison, contagem de movimentos, filtro com HAVING, contagem com LEFT JOIN, pré-evolução com self join e filtro por Grass com subquery.

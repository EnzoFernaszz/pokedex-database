# Pokédex relacional

Projeto de estudo para consolidar os fundamentos de MySQL ao concluir um curso de banco de dados. O trabalho percorreu a definição incremental de regras de negócio, DER conceitual, modelo relacional, implementação, população e dez exercícios de consulta SQL.

## Modelo e tecnologias

O banco representa espécies de Pokémon. `POKEMON` se relaciona com `TIPO`, `HABILIDADE` e `MOVIMENTO` por tabelas associativas com PKs compostas. Cada movimento pertence a um tipo. Uma FK autorreferenciada registra a pré-evolução e permite evolução ramificada.

Tecnologias: MySQL e SQL, com tabelas InnoDB. Execução validada em MySQL 8.4.7 com modo estrito e `ONLY_FULL_GROUP_BY`.

A amostra contém Bulbasaur, Ivysaur, Venusaur, Eevee, Vaporeon e Jolteon, além de 5 tipos, 9 habilidades e 5 movimentos.

## Estrutura

```text
pokedex-database/
├── README.md
├── docs/
│   ├── requirements.md
│   ├── der.pdf
│   └── modelo-relacional.pdf
└── sql/
    ├── schema.sql
    ├── seed.sql
    └── queries.sql
```

Consulte o [DER conceitual](docs/der.pdf), o [modelo relacional](docs/modelo-relacional.pdf) e as [regras e limitações](docs/requirements.md). Os requisitos foram documentados retrospectivamente a partir do escopo adotado durante o exercício. O modelo relacional preserva o desenho do Lucidchart e acrescenta uma legenda de cardinalidades.

## Como executar

Use MySQL 8.4 e uma conta com permissão para criar bancos e tabelas. Abra o cliente MySQL a partir da pasta do repositório:

```text
mysql -u seu_usuario -p
```

No cliente, execute nesta ordem:

```sql
SOURCE sql/schema.sql;
SOURCE sql/seed.sql;
SOURCE sql/queries.sql;
```

Também é possível abrir e executar os três arquivos nessa ordem no MySQL Workbench.

O schema cria a base `POKEDEX` e deve ser executado onde ela ainda não exista. Ele não apaga uma base anterior. O seed deve ser executado uma única vez, com as tabelas vazias; os IDs gerados seguem a ordem dos cadastros. A consulta de Grass usa o ID 1 definido por essa amostra.

## Conceitos praticados

Chaves primárias e estrangeiras, `NOT NULL`, `UNIQUE`, relações N:N, PKs compostas e autorreferência. Nas consultas: `SELECT`, `WHERE`, `ORDER BY`, `INNER JOIN`, múltiplos JOINs, `COUNT`, `GROUP BY`, `HAVING`, `LEFT JOIN`, self join e subquery.

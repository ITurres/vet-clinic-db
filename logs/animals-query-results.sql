--?> (--*) = output-log
---
SELECT
    animals.name
FROM
    animals
WHERE
    name LIKE '%mon';

--*  name
--* -------
--* Agumon
--* Gabumon
--* Devimon
---
SELECT
    animals.name
FROM
    animals
WHERE
    animals.date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

--*  name
--* -------
--* Gabumon
--* Devimon
---
SELECT
    animals.name
FROM
    animals
WHERE
    animals.neutered = TRUE
    AND animals.escape_attempts < 3;

--*  name
--* -------
--* Agumon
--* Gabumon
---
SELECT
    animals.date_of_birth
FROM
    animals
WHERE
    animals.name IN ('Agumon', 'Pikachu');

--* date_of_birth
--* -------------
--* 2020-02-03
--* 2021-01-07
---
SELECT
    animals.name,
    animals.escape_attempts
FROM
    animals
WHERE
    animals.weight_kg > 10.5;

--*  name   | escape_attempts
--* ---------+-----------------
--*  Pikachu |               1
--*  Devimon |               5
---
SELECT
    *
FROM
    animals
WHERE
    animals.neutered = TRUE;

--* id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
--* ----+---------+---------------+-----------------+----------+-----------
--*  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--*  2 | Gabumon | 2018-11-15    |               2 | t        |      8.00
--*  4 | Devimon | 2017-04-12    |               5 | t        |     11.00
---
SELECT
    *
FROM
    animals
WHERE
    animals.name NOT IN ('Gabumon');

--* id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
--* ----+---------+---------------+-----------------+----------+-----------
--*  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
--*  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
--*  4 | Devimon | 2017-04-12    |               5 | t        |     11.00
---
SELECT
    *
FROM
    animals
WHERE
    animals.weight_kg >= 10.4
    AND animals.weight_kg <= 17.3;

--* id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
--* ----+---------+---------------+-----------------+----------+-----------
--*  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
--*  4 | Devimon | 2017-04-12    |               5 | t        |     11.00
---
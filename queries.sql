SELECT
    animals.name
FROM
    animals
WHERE
    animals.name LIKE '%mon';

SELECT
    animals.name
FROM
    animals
WHERE
    animals.date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

SELECT
    animals.name
FROM
    animals
WHERE
    animals.neutered = TRUE
    AND animals.escape_attempts < 3;

SELECT
    animals.date_of_birth
FROM
    animals
WHERE
    animals.name IN ('Agumon', 'Pikachu');

SELECT
    animals.name,
    animals.escape_attempts
FROM
    animals
WHERE
    animals.weight_kg > 10.5;

SELECT
    *
FROM
    animals
WHERE
    animals.neutered = TRUE;

SELECT
    *
FROM
    animals
WHERE
    animals.name NOT IN ('Gabumon');

SELECT
    *
FROM
    animals
WHERE
    animals.weight_kg >= 10.4
    AND animals.weight_kg <= 17.3;
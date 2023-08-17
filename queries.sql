-- * START OF project 1 queries * --
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

--  * END OF project 1 queries * --
--!--
-- * START OF project 2 queries * --
BEGIN TRANSACTION;

UPDATE animals
SET
    species = 'unspecified'
WHERE
    species IS NULL;

ROLLBACK;

--*--
BEGIN TRANSACTION;

UPDATE animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

UPDATE animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

COMMIT;

--*--
BEGIN TRANSACTION;

DELETE FROM animals;

ROLLBACK;

--*--
BEGIN TRANSACTION;

DELETE FROM animals
WHERE
    date_of_birth > '2022-01-01';

SAVEPOINT update_animals_weight;

UPDATE animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO update_animals_weight;

UPDATE animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

--*--
--! Write queries to answer the following questions:
--? How many animals are there?
--? How many animals have never tried to escape?
--? What is the average weight of animals?
--? Who escapes the most, neutered or not neutered animals?
--? What is the minimum and maximum weight of each type of animal?
--? What is the average number of escape attempts per animal type of those born between 1990 and 2000?
--*--
SELECT
    COUNT(*) AS number_of_animals
FROM
    animals;

SELECT
    COUNT(*) AS animals_who_escaped
FROM
    animals
WHERE
    animals.escape_attempts = 0;

SELECT
    AVG(animals.weight_kg) AS average_weight_kg
FROM
    animals;

SELECT
    animals.name
FROM
    animals
ORDER BY
    escape_attempts DESC
LIMIT
    1;

SELECT
    MIN(animals.weight_kg),
    MAX(animals.weight_kg),
    animals.species
FROM
    animals
GROUP BY
    animals.species;

SELECT
    AVG(animals.escape_attempts) AS average_escape_attempts,
    animals.species
FROM
    animals
WHERE
    animals.date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY
    animals.species;

-- * END OF project 2 queries * --
--!--
-- * START OF project 3 queries * --
SELECT
    animals.name AS animals_owned_by_melody_pond
FROM
    animals
    JOIN owners ON owners.id = animals.owner_id
WHERE
    owners.full_name = 'Melody Pond';

SELECT
    animals.name AS pokemons
FROM
    animals
    JOIN species ON species.id = animals.species_id
WHERE
    species.name = 'Pokemon';

SELECT
    animals.name AS animal,
    owners.full_name AS owner
FROM
    animals
    FULL OUTER JOIN owners ON owners.id = animals.owner_id
ORDER BY
    owner;

SELECT
    COUNT(*) AS number_of_animals,
    species.name AS species
FROM
    animals
    JOIN species ON species.id = animals.species_id
GROUP BY
    species.name;

SELECT
    animals.name AS digimons_owned_by_jennifer_orwell
FROM
    animals
    JOIN owners ON owners.id = animals.owner_id
WHERE
    animals.species_id = (
        SELECT
            id
        FROM
            species
        WHERE
            species.name = 'Digimon'
    )
    AND owners.full_name = 'Jennifer Orwell';

SELECT
    animals.name AS animals_owned_by_dean_winchester
FROM
    animals
    JOIN owners ON owners.id = animals.owner_id
WHERE
    owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

SELECT
    owners.full_name AS owner_with_most_animals,
    COUNT(animals.owner_id) AS animals_owned
FROM
    owners
    JOIN animals ON animals.owner_id = owners.id
GROUP BY
    owners.full_name
ORDER BY
    animals_owned DESC
LIMIT
    1;
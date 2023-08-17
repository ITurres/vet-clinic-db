CREATE TABLE
    animals (
        id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        date_of_birth DATE NOT NULL,
        escape_attempts SMALLINT NOT NULL,
        neutered BOOLEAN NOT NULL,
        weight_kg NUMERIC(10, 2) NOT NULL,
        species VARCHAR(50) NULL
    );

CREATE TABLE
    species (
        id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    owners (
        id INT GENERATED ALWAYS AS IDENTITY,
        full_name VARCHAR(50) NOT NULL,
        age SMALLINT NOT NULL,
        PRIMARY KEY (id)
    );

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owner FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE CASCADE;
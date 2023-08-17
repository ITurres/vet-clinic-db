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

CREATE TABLE
    vets (
        id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        age SMALLINT NOT NULL,
        date_of_graduation DATE NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    specializations (
        species_id INT,
        vet_id INT,
        PRIMARY KEY (species_id, vet_id),
        CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE,
        CONSTRAINT fk_vet FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE
    );

--? animals was missing its primary key. 
--? PostgreSQL won't automatically set the column id as the primary key when it's added as a foreign key.
--! thus the ERROR: there is no unique constraint matching given keys for referenced table -animals-.
--? the error will occur when trying to reference the table animals in another table.
ALTER TABLE animals ADD PRIMARY KEY (id);

--* then:
CREATE TABLE
    visits (
        visits_id INT GENERATED ALWAYS AS IDENTITY,
        animal_id INT,
        vet_id INT,
        date_of_visit DATE NOT NULL,
        CONSTRAINT fk_animal FOREIGN KEY (animal_id) REFERENCES animals (id) ON DELETE CASCADE,
        CONSTRAINT fk_vet FOREIGN KEY (vet_id) REFERENCES vets (id) ON DELETE CASCADE,
        PRIMARY KEY (visits_id)
    );

--*
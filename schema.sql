CREATE TABLE
    animals (
        id INT GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        date_of_birth DATE NOT NULL,
        escape_attempts SMALLINT NOT NULL,
        neutered BOOLEAN NOT NULL,
        weight_kg NUMERIC(10, 2) NOT NULL,
        species_id INT,
        owner_id INT,
        CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE CASCADE,
        CONSTRAINT fk_owners FOREIGN KEY (owner_id) REFERENCES owners (id) ON DELETE CASCADE
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
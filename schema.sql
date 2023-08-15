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
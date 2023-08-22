CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP NOT NULL,
    STATUS VARCHAR(20) NOT NULL,
    patient_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE;


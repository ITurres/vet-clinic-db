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

CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  paid_at TIMESTAMP NOT NULL,
  medical_history_id INT,
  CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  invoice_id INT,
  CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE CASCADE,
  treatment_id INT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE treatments_history (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    medical_history_id INT,
    CONSTRAINT fk_medical_history_id FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE,
    treatment_id INT,
    CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE CASCADE
);
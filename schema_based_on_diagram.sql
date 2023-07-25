CREATE TABLE patients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    admitted_at TIMESTAMP(6),
    patient_id INT,
    status VARCHAR(50),
    CONSTRAINT fk_patient
    FOREIGN KEY (patient_id)
    REFERENCES patients (id)
    ON DELETE SET NULL
);

CREATE TABLE invoices (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    total_amount DECIMAL(10,2),
    generated_at TIMESTAMP(6),
    payed_at TIMESTAMP(6),
    medical_history_id INTEGER,
    CONSTRAINT fk_medical_history
    FOREIGN KEY (medical_history_id)
    REFERENCES medical_histories (id)
    ON DELETE SET NULL
);

CREATE TABLE invoice_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    unit_price DECIMAL(10,2),
    quantity INTEGER,
    total_price DECIMAL(10,2),
    invoice_id INTEGER,
    treatment_id INTEGER,
    CONSTRAINT fk_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id)
    ON DELETE SET NULL,
    CONSTRAINT fk_treatment
    FOREIGN KEY (treatment_id)
    REFERENCES treatments (id)
    ON DELETE SET NULL
);

CREATE TABLE treatments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type VARCHAR(55),
    name VARCHAR(100)
);

CREATE TABLE medical_histories_treatments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    medical_history_id INTEGER,
    treatment_id INTEGER,
    FOREIGN KEY (medical_history_id) 
    REFERENCES medical_histories (id) 
    ON DELETE SET NULL,
    FOREIGN KEY (treatment_id) 
    REFERENCES treatments (id) 
    ON DELETE SET NULL
);

CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);
CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);
CREATE INDEX idx_medical_histories_treatments_medical_history_id ON medical_histories_treatments (medical_history_id);
CREATE INDEX idx_medical_histories_treatments_treatment_id ON medical_histories_treatments (treatment_id);

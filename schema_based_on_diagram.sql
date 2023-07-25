Create TABLE patients(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255),
    date_of_birth DATE,
    patient_id INTEGER,
    
);

CREATE TABLE medical_histories(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    addmited_at TIMESTAMP(6),
    patient_id INT,
    PRIMARY KEY(patient_id), 
    CONSTRAINT fk_patient, 
    FOREIGN KEY(patient_id) 
    REFERENCES patients(patient_id),
    status VARCHAR(50)
    ON DELETE SET NULL,
    medical_history_id INTEGER,
);

CREATE TABLE invoices(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    total_amount DECIMAL(10,2),
    generated_at TIMESTAMP(6),
    payed_at TIMESTAMP(6),
    medical_historie_id INTEGER,
    PRIMARY KEY(medical_history_id), 
    CONSTRAINT fk_medical_history, 
    FOREIGN KEY(medical_history_id) 
    REFERENCES medical_histories(medical_history_id)
    ON DELETE SET NULL,
    invoice_id INTEGER,
);

CREATE TABLE invoices_items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    unit_price DECIMAL(10,2),
    quantity INTEGER,
    total_price DECIMAL(10,2),
    invoice_id INTEGER,
    PRIMARY KEY(invoice_id), 
    CONSTRAINT fk_invoice, 
    FOREIGN KEY(invoice_id) 
    REFERENCES invoices(invoice_id)
    ON DELETE SET NULL,
    treatment_id INTEGER,
    PRIMARY KEY(treatment_id), 
    CONSTRAINT fk_invoice, 
    FOREIGN KEY(treatment_id) 
    REFERENCES treatments(treatment_id)
     ON DELETE SET NULL
);

CREATE TABLE treatments(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type VARCHAR(55),
    name VARCHAR(100),
    treatment_id INTEGER,
);


CREATE TABLE medical_histories_treatments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    medical_history_id INTEGER,
    treatment_id INTEGER,
    PRIMARY KEY (medical_history_id, treatment_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id) 
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(medical_history_id) 
    ON DELETE SET NULL
)
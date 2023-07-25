/* Database schema to keep the structure of entire database. */

-- CREATE TABLE medical_histories_treatments (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     medical_history_id INTEGER,
--     treatment_id INTEGER,
--     PRIMARY KEY (medical_history_id, treatment_id),
--     FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id) 
--     FOREIGN KEY (medical_history_id) REFERENCES medical_histories(medical_history_id) 
--     ON DELETE SET NULL
-- )
-- CREATE INDEX idx_medical_history_id ON medical_histories_treatments(medical_history_id);
-- CREATE INDEX idx_treatment_id ON medical_histories_treatments (treatment_id);
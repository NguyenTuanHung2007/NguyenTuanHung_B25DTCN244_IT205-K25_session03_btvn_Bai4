DROP TABLE IF EXISTS Pharmacy_Inventory;

CREATE TABLE Pharmacy_Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name VARCHAR(255),
    Batch_Number VARCHAR(50),
    Expiry_Date DATE,
    Quantity INT
);

INSERT INTO Pharmacy_Inventory (Drug_Name, Batch_Number, Expiry_Date, Quantity)
VALUES 
('Paracetamol', 'BATCH001', '2025-12-01', 1000),
('Amoxicillin', 'BATCH002', '2024-06-15', 500),
('Ibuprofen', 'BATCH003', '2026-01-20', 2000),
('Cefalexin', 'BATCH004', '2024-11-30', 750);

CREATE INDEX idx_drug_expiry ON Pharmacy_Inventory(Drug_Name, Expiry_Date);

EXPLAIN SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name = 'Paracetamol' 
AND Expiry_Date < '2025-01-01';

EXPLAIN SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name LIKE 'Para%';

EXPLAIN SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name LIKE '%amol%';

ALTER TABLE Pharmacy_Inventory ADD FULLTEXT(Drug_Name);

EXPLAIN SELECT * FROM Pharmacy_Inventory 
WHERE MATCH(Drug_Name) AGAINST('Paracetamol');
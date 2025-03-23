CREATE DATABASE PharmacyDB;
USE PharmacyDB;
Show tables;
CREATE TABLE PharmacyUsers (
    id INT PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE  Categories (
    id INT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Medicines (
    id INT PRIMARY KEY ,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    manufacturer VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    expiry_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE
);
CREATE TABLE Suppliers (
    id INT PRIMARY KEY ,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    address TEXT,
    payment_status VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE Purchases (
    id INT PRIMARY KEY ,
    supplier_id INT NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id) ON DELETE CASCADE
);
CREATE TABLE PurchaseDetails (
    id INT PRIMARY KEY,
    purchase_id INT NOT NULL,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (purchase_id) REFERENCES Purchases(id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(id) ON DELETE CASCADE
);

-- Sales Table
CREATE TABLE Sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES PharmacyUsers(id) ON DELETE CASCADE
);
CREATE TABLE SaleDetails (
    id INT PRIMARY KEY ,
    sale_id INT NOT NULL,
    medicine_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sale_id) REFERENCES Sales(id) ON DELETE CASCADE,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(id) ON DELETE CASCADE
);
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    address TEXT);

INSERT INTO PharmacyUsers ( id,name, email, password, role)
VALUES
(1,'Alice John', 'alice@example.com', 'hashedpass1', 'Admin'),
(2,'Bob Smith', 'bob@example.com', 'hashedpass2', 'Pharmacist'),
(3,'Carol White', 'carol@example.com', 'hashedpass3', 'Cashier'),
(4,'David Green', 'david@example.com', 'hashedpass4', 'Pharmacist'),
(5,'Eve Black', 'eve@example.com', 'hashedpass5', 'Cashier'),
(6,'Frank Lee', 'frank@example.com', 'hashedpass6', 'Admin'),
(7,'Grace Kim', 'grace@example.com', 'hashedpass7', 'Pharmacist'),
(8,'Hank Patel', 'hank@example.com', 'hashedpass8', 'Cashier'),
(9,'Ivy Chen', 'ivy@example.com', 'hashedpass9', 'Admin'),
(10,'Jack Ray', 'jack@example.com', 'hashedpass10', 'Pharmacist'),
(11,'Kate Lin', 'kate@example.com', 'hashedpass11', 'Cashier'),
(12,'Leo Singh', 'leo@example.com', 'hashedpass12', 'Pharmacist'),
(13,'Mia Wong', 'mia@example.com', 'hashedpass13', 'Cashier'),
(14,'Nina Roy', 'nina@example.com', 'hashedpass14', 'Pharmacist'),
(15,'Omar Zed', 'omar@example.com', 'hashedpass15', 'Cashier');
INSERT INTO Categories (id,name, description)
VALUES
(1,'Antibiotics', 'Medicines to treat infections'),
(2,'Painkillers', 'Relieves pain'),
(3,'Vitamins', 'Supplements for vitamins'),
(4,'Antiseptics', 'Prevent infections in wounds'),
(5,'Antacids', 'Reduce stomach acid'),
(6,'Cough Syrups', 'For cough relief'),
(7,'Antifungal', 'Treats fungal infections'),
(8,'Cardiovascular', 'Heart-related medicines'),
(9,'Diabetes', 'Blood sugar control'),
(10,'Allergy', 'Anti-allergy medications'),
(11,'Eye Drops', 'Eye care products'),
(12,'Skin Creams', 'Topical skin treatments'),
(13,'Cold & Flu', 'Flu and fever relief'),
(14,'Laxatives', 'Constipation treatment'),
(15,'Hormones', 'Hormonal treatments');
INSERT INTO Medicines ( id,name, category_id, manufacturer, price, stock, expiry_date)
VALUES
(1,'Amoxicillin 500mg', 1, 'MediCare Ltd.', 50.00, 200, '2025-12-31'),
(2,'Paracetamol 650mg', 2, 'HealWell Pharma', 20.00, 300, '2026-06-30'),
(3,'Vitamin C Tablets', 3, 'NutraPlus', 15.00, 500, '2027-01-15'),
(4,'Savlon Liquid', 4, 'Reckitt', 35.00, 150, '2026-03-20'),
(5,'Gelusil', 5, 'Pfizer', 22.00, 100, '2025-10-10'),
(6,'Benadryl Syrup', 6, 'J&J', 30.00, 80, '2026-08-08'),
(7,'Clotrimazole Cream', 7, 'Bayer', 40.00, 60, '2025-07-12'),
(8,'Aspirin', 8, 'Cipla', 18.00, 200, '2026-12-25'),
(9,'Metformin 500mg', 9, 'Sun Pharma', 28.00, 220, '2026-11-11'),
(10,'Cetirizine', 10, 'Dr Reddy', 10.00, 300, '2026-09-19'),
(11,'Refresh Tears', 11, 'Allergan', 60.00, 50, '2026-01-01'),
(12,'Betnovate Cream', 12, 'GSK', 25.00, 40, '2025-05-05'),
(13,'Coldact', 13, 'Abbott', 35.00, 70, '2026-10-10'),
(14,'Dulcolax', 14, 'Sanofi', 20.00, 90, '2026-04-04'),
(15,'Thyronorm 50mcg', 15, 'Abbott', 18.00, 150, '2026-03-03');
INSERT INTO Suppliers (id, name, contact, email, address, payment_status)
VALUES
(1, 'MedSupplier Inc.', '9876543210', 'medsupplier@example.com', 'Chennai', 'Paid'),
(2, 'PharmaZone', '9888888888', 'pharmazone@example.com', 'Coimbatore', 'Pending'),
(3, 'CureMart', '9123456789', 'curemart@example.com', 'Madurai', 'Paid'),
(4, 'Global Health', '9345678901', 'global@example.com', 'Trichy', 'Pending'),
(5, 'HealFast', '9234567890', 'healfast@example.com', 'Salem', 'Paid'),
(6, 'Sun Pharma Dist.', '9012345678', 'sunpharma@example.com', 'Bangalore', 'Pending'),
(7, 'LifeSaver Ltd.', '9087654321', 'lifesaver@example.com', 'Hyderabad', 'Paid'),
(8, 'MediCare Agency', '9871234567', 'medicare@example.com', 'Kochi', 'Paid'),
(9, 'Care Distribution', '9765432109', 'caredist@example.com', 'Pune', 'Paid'),
(10, 'GoodHealth Supply', '9898989898', 'goodhealth@example.com', 'Mumbai', 'Pending'),
(11, 'PharmaPlus', '9900112233', 'pharmaplus@example.com', 'Delhi', 'Paid'),
(12, 'EverWell Co.', '9445566778', 'everwell@example.com', 'Vizag', 'Pending'),
(13, 'Zen Pharma', '9556677889', 'zen@example.com', 'Nagpur', 'Paid'),
(14, 'QuickMeds', '9111223344', 'quickmeds@example.com', 'Ahmedabad', 'Pending'),
(15, 'VitalMeds Ltd.', '9009988776', 'vitalmeds@example.com', 'Lucknow', 'Paid');
INSERT INTO Customers (id,name, contact, email, address)
VALUES
(1,'Arun Kumar', '9876543210', 'arun@example.com', 'Chennai'),
(2,'Bhuvana R', '9888777666', 'bhuvana@example.com', 'Madurai'),
(3,'Charles D', '9765432198', 'charles@example.com', 'Coimbatore'),
(4,'Deepika M', '9123456780', 'deepika@example.com', 'Trichy'),
(5,'Eshwar P', '9234567812', 'eshwar@example.com', 'Salem'),
(6,'Farzana B', '9012345609', 'farzana@example.com', 'Tirunelveli'),
(7,'Gopal R', '9876501234', 'gopal@example.com', 'Tanjore'),
(8,'Harini K', '9345678999', 'harini@example.com', 'Erode'),
(9,'Irfan S', '9443322110', 'irfan@example.com', 'Kanchipuram'),
(10,'Janani V', '9087654320', 'janani@example.com', 'Cuddalore'),
(11,'Karthik S', '9765432188', 'karthik@example.com', 'Tiruppur'),
(12,'Lavanya N', '9445678901', 'lavanya@example.com', 'Theni'),
(13,'Muthu R', '9234567892', 'muthu@example.com', 'Vellore'),
(14,'Nandhini S', '9090909090', 'nandhini@example.com', 'Karur'),
(15,'Om Prakash', '9876123450', 'omprakash@example.com', 'Dindigul');
INSERT INTO Purchases (id,supplier_id, total_cost)
VALUES
(1,1, 5000.00),
(2,2, 4200.00),
(3,3, 3800.00),
(4,4, 5600.00),
(5,5, 4700.00),
(6,6, 6100.00),
(7,7, 4500.00),
(8,8, 3900.00),
(9,9, 5200.00),
(10,10, 4800.00),
(11,11, 4950.00),
(12,12, 4100.00),
(13,13, 3700.00),
(14,14, 6000.00),
(15,15, 5300.00);
INSERT INTO PurchaseDetails (id,purchase_id, medicine_id, quantity, unit_price)
VALUES
(1, 1,1, 100, 45.00),
(2, 2,2, 150, 18.00),
(3, 3,3, 200, 12.00),
(4, 4,4, 80, 30.00),
(5, 5,5, 60, 20.00),
(6, 6,6, 90, 27.00),
(7, 7,7, 50, 35.00),
(8, 8,8, 120, 15.00),
(9, 9,9, 130, 25.00),
(10, 10,10, 140, 9.00),
(11, 11,11, 70, 55.00),
(12, 12,12, 45, 20.00),
(13, 13,13, 65, 30.00),
(14, 14,14, 75, 17.00),
(15, 15,15, 85, 14.00);
INSERT INTO Sales (id, user_id, total_price, sale_date)
VALUES
(1, 3, 450.00, '2024-09-01'),
(2, 5, 780.00, '2024-09-10'),
(3, 7, 900.00, '2024-10-15'),
(4, 9, 350.00, '2024-11-05'),
(5, 11, 670.00, '2024-11-20'),
(6, 13, 720.00, '2024-12-01'),
(7, 15, 410.00, '2025-01-08'),
(8, 2, 500.00, '2025-01-25'),
(9, 4, 625.00, '2025-02-10'),
(10, 6, 830.00, '2025-02-28'),
(11, 8, 710.00, '2025-03-05'),
(12, 10, 940.00, '2025-03-10'),
(13, 12, 610.00, '2025-03-12'),
(14, 14, 390.00, '2025-03-15'),
(15, 1, 875.00, '2025-03-18');
INSERT INTO SaleDetails (id,sale_id, medicine_id, quantity, unit_price)
VALUES
(1,1, 1, 5, 50.00),
(2,2, 2, 10, 20.00),
(3,3, 3, 15, 15.00),
(4,4, 4, 4, 35.00),
(5,5, 5, 3, 22.00),
(6,6, 6, 6, 30.00),
(7,7, 7, 2, 40.00),
(8, 8,8, 8, 18.00),
(9,9, 9, 7, 28.00),
(10,10, 10, 9, 10.00),
(11,11, 11, 3, 60.00),
(12, 12,12, 1, 25.00),
(13, 13,13, 4, 35.00),
(14, 14,14, 5, 20.00),
(15, 15,15, 6, 18.00);
 -- UPDATE THE ROLE OF A SPECIFIC USER IN THE PHARMACYUSERS TABLE
DELIMITER //
CREATE PROCEDURE UpdateUserRole (
    IN S1 INT,
    IN S2 VARCHAR(50)
)
BEGIN
    UPDATE PharmacyUsers
    SET role =S2,
        updated_at = NOW()
    WHERE id = S1;
END //
DELIMITER ;
CALL UpdateUserRole(6,'Admin');


-- RETRIVE ALL SALES MADE BY A SPECIFIC USER
DELIMITER //
CREATE PROCEDURE GetSales (
    IN A1 INT
)
BEGIN
    SELECT *
    FROM Sales
    WHERE user_id = A1;
END // 
DELIMITER ; 
CALL GetSales (4);

-- FIND THE NAME OF MEDICINES THAT HAVE EXACTLY 150 UNITS IN STOCK
DELIMITER //
CREATE PROCEDURE FindMedi (
    IN S1 INT
)
BEGIN
    SELECT *
    FROM Medicines
    WHERE id = S1;
END //
DELIMITER ; 
CALL FindMedi (4);


-- FIND ALL MEDICINES THAT WILL EXPIRE WITHIN THE NEXT YEAR
DELIMITER //
CREATE PROCEDURE GetMedicinesExpiringSoon()
BEGIN
    SELECT *
    FROM Medicines
    WHERE expiry_date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 1 YEAR);
END //
DELIMITER ;
CALL GetMedicinesExpiringSoon();

-- GET THE TOTAL SALES GROUPED BY EACH SALE DATE
DELIMITER //
CREATE PROCEDURE GetTotalSalesByDate()
BEGIN
    SELECT 
        S.sale_date, 
        SUM(sd.quantity * sd.unit_price) AS total_sales
    FROM 
        Sales S
    JOIN 
        SaleDetails sd ON S.id = sd.sale_id
    GROUP BY 
        S.sale_date
    ORDER BY 
        S.sale_date;
END //
DELIMITER ;
CALL GetTotalSalesByDate(); 

-- GET THE TOTAL PURCHASE COST GROUPED BY EACH PURCHASE DATE
DELIMITER //
CREATE PROCEDURE GetTotalPurchaseCostByDate()
BEGIN
    SELECT 
        P.id, 
        SUM(pd.quantity * pd.unit_price) AS total_purchase_cost
    FROM 
        Purchases P
    JOIN 
        PurchaseDetails pd ON P.id = pd.purchase_id
    GROUP BY 
        P.id
    ORDER BY 
        P.id;
END //
DELIMITER ;
CALL GetTotalPurchaseCostByDate();

-- DISPLAY THE TOP THREE SELLING MEDICINES
DELIMITER //
CREATE PROCEDURE GetTopThreeSellingMedicines()
BEGIN
    SELECT 
        m.id AS medicine_id,
        m.name AS medicine_name,
        SUM(sd.quantity) AS total_quantity_sold
    FROM 
        Medicines m
    JOIN 
        SaleDetails sd ON m.id = sd.medicine_id
    GROUP BY 
        m.id, m.name
    ORDER BY 
        total_quantity_sold DESC
    LIMIT 3;
END //
DELIMITER ;
CALL GetTopThreeSellingMedicines();

-- GET CUSTOMER PURCHASE HISTORY
DELIMITER // 
CREATE PROCEDURE GetCustomerPurchaseHistory(
    IN customer_id INT
)
BEGIN
    SELECT 
        s.id AS sale_id,
        sd.medicine_id,
        sd.quantity,
        sd.unit_price
    FROM Sales s
    JOIN SaleDetails sd ON s.id = sd.sale_id
    WHERE s.user_id = customer_id;
END //
DELIMITER ;
CALL GetCustomerPurchaseHistory(7);

-- IDENTIFY CUSTOMERS WHO HAVEN'T PURCHASED IN THE LAST 6 MONTHS
DELIMITER //
CREATE PROCEDURE InactiveCustomers()
BEGIN
    SELECT c.id, c.name, c.email
    FROM Customers c
    LEFT JOIN Sales s 
        ON c.id = s.user_id 
        AND s.sale_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    WHERE s.id IS NULL;
END //
DELIMITER ;
CALL InactiveCustomers();

-- GET SUPPLIER DETAILS BY ID
DELIMITER //
CREATE PROCEDURE SupplierDetails(
    IN S1 INT
)
BEGIN
    SELECT 
        id,
        name,
        contact,
        email,
        address
    FROM Suppliers
    WHERE id = S1;
END //
DELIMITER ;
CALL SupplierDetails(2);













    



    
















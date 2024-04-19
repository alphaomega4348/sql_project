INSERT INTO company VALUES
('C00001', 'Dell'),
('C00002', 'Asus'),
('C00003', 'Apple'),
('C00004', 'Lenovo');


INSERT INTO product VALUES
('P00001', 'C00001', 'Inspiron 15', 'Laptop', 54999.00),
('P00002', 'C00001', 'XPS 13', 'Laptop', 79999.00),
('P00003', 'C00002', 'ROG Strix G15', 'Laptop', 89999.00),
('P00004', 'C00002', 'TUF Gaming A15', 'Laptop', 72999.00),
('P00005', 'C00003', 'MacBook Air', 'Laptop', 92990.00),
('P00006', 'C00003', 'MacBook Pro', 'Laptop', 122990.00),
('P00007', 'C00004', 'IdeaPad Slim 3i', 'Laptop', 41990.00),
('P00008', 'C00004', 'ThinkPad X1 Carbon', 'Laptop', 159990.00),
('P00009', 'C00004', 'Yoga Slim 7i', 'Laptop', 72990.00);

INSERT INTO manufacturer VALUES
('M00001', 'P00001', 'Dell India Pvt. Ltd.'),
('M00002', 'P00002', 'Dell India Pvt. Ltd.'),
('M00003', 'P00003', 'AsusTek Computer Inc.'),
('M00004', 'P00004', 'AsusTek Computer Inc.'),
('M00005', 'P00005', 'Apple India Pvt. Ltd.'),
('M00006', 'P00006', 'Apple India Pvt. Ltd.'),
('M00007', 'P00007', 'Lenovo India Pvt. Ltd.'),
('M00008', 'P00008', 'Lenovo India Pvt. Ltd.'),
('M00009', 'P00009', 'Lenovo India Pvt. Ltd.');

INSERT INTO store VALUES
('S00001', 'Shivam Electronics', 'Offline', 'Mumbai'),
('S00002', 'Harsh Computers', 'Offline', 'Delhi'),
('S00003', 'Amarjeet Gadgets', 'Online', NULL);

INSERT INTO storeprod (StoreID, ProductID, Quantity, ManufacturerID) VALUES
-- Sample data for store S00001 (Shivam Electronics) in Mumbai
('S00001', 'P00001', 20, 'M00001'), -- Inspiron 15
('S00001', 'P00002', 15, 'M00002'), -- XPS 13
('S00001', 'P00003', 25, 'M00003'), -- ROG Strix G15
('S00001', 'P00004', 30, 'M00004'), -- TUF Gaming A15
('S00001', 'P00005', 10, 'M00005'), -- MacBook Air

-- Sample data for store S00002 (Harsh Computers) in Delhi
('S00002', 'P00006', 20, 'M00006'), -- MacBook Pro
('S00002', 'P00007', 18, 'M00007'), -- IdeaPad Slim 3i
('S00002', 'P00008', 25, 'M00008'), -- ThinkPad X1 Carbon
('S00002', 'P00009', 12, 'M00009'), -- Yoga Slim 7i

-- Sample data for store S00003 (Amarjeet Gadgets) online store
('S00003', 'P00001', 5, 'M00001'), -- Inspiron 15
('S00003', 'P00002', 3, 'M00002'), -- XPS 13
('S00003', 'P00003', 8, 'M00003'), -- ROG Strix G15
('S00003', 'P00007', 6, 'M00007'), -- IdeaPad Slim 3i
('S00003', 'P00008', 7, 'M00008'); -- ThinkPad X1 Carbon

-- Inserting data into the 'cart' table
INSERT INTO cart (CartID, StoreID, ProductID, Quantity) VALUES
('CRT001', 'S00001', 'P00001', 3),
('CRT001', 'S00001', 'P00002', 1),
('CRT001', 'S00001', 'P00003', 2);

-- Carts for store S00002 (Harsh Computers) in Delhi
INSERT INTO cart (CartID, StoreID, ProductID, Quantity) VALUES
('CRT002', 'S00002', 'P00006', 1),
('CRT002', 'S00002', 'P00007', 2),
('CRT002', 'S00002', 'P00008', 3);

-- Carts for store S00003 (Amarjeet Gadgets) online store
INSERT INTO cart (CartID, StoreID, ProductID, Quantity) VALUES
('CRT003', 'S00003', 'P00001', 2),
('CRT003', 'S00003', 'P00007', 1),
('CRT004', 'S00003', 'P00002', 1);

INSERT INTO customer (CustomerID, Name, Phone, Address) VALUES
('CUS001', 'Shivam', '1234567890', '123 Main St, Mumbai, India'),
('CUS002', 'Harsh', '9876543210', '456 Elm St, Delhi, India'),
('CUS003', 'Amarjeet', '5551234567', '789 Oak St, Bangalore, India'),
('CUS004', 'Amit', '9998887777', '101 Pine St, Chennai, India'),
('CUS005', 'Anish', '3334445555', '202 Maple St, Kolkata, India');


INSERT INTO contract (ContractID, CustomerID, AccountNumber) VALUES
('CON001', 'CUS001', 'ACCT123456'),
('CON002', 'CUS002', 'ACCT987654');

INSERT INTO customerinstance VALUES
('ORD001', 'CUS001', 'CRT001'),
('ORD002', 'CUS001', 'CRT004'),
('ORD003', 'CUS002', 'CRT002'),
('ORD004', 'CUS004', 'CRT003');

INSERT INTO booking VALUES
('B00001', 'ORD001', '2024-04-17'),
('B00002', 'ORD002', '2024-03-12'),
('B00003', 'ORD004', '2024-03-28');

INSERT INTO shipping VALUES
('123456', 'B00002', 'USPS', 'Strait of Panama', NULL, '2024-05-12'),
('SHIP001', 'B00003', 'UPS', 'Alabama', '2024-04-14', '2024-04-12');

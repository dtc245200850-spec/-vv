-- 1. Tạo và sử dụng cơ sở dữ liệu tạm thời
CREATE DATABASE IF NOT EXISTS classicmodels;
USE classicmodels;

-- 2. Tạo bảng customers mẫu
CREATE TABLE IF NOT EXISTS customers (
    customerNumber INT PRIMARY KEY,
    customerName VARCHAR(50),
    contactLastName VARCHAR(50),
    contactFirstName VARCHAR(50),
    phone VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- 3. Thêm dữ liệu mẫu vào bảng
INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, city, country)
VALUES 
(103, 'Atelier graphique', 'Schmitt', 'Carine', '40.32.2555', 'Nantes', 'France'),
(112, 'Signal Gift Stores', 'King', 'Jean', '7025551838', 'Las Vegas', 'USA'),
(175, 'Gift Depot Inc.', 'King', 'Julie', '2125557000', 'Boston', 'USA')
ON DUPLICATE KEY UPDATE customerName=VALUES(customerName);


-- =========================================================
-- BÀI TẬP STORED PROCEDURE
-- =========================================================

-- Bước 1: Tạo Stored Procedure lấy toàn bộ khách hàng
DELIMITER //

DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //

DELIMITER ;

-- Gọi thử thủ tục lần 1 (Sẽ ra 3 khách hàng)
CALL findAllCustomers();


-- Bước 2: Sửa Stored Procedure (Xóa và Tạo lại với lọc customerNumber = 175)
DELIMITER //

DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers WHERE customerNumber = 175;
END //

DELIMITER ;

-- Gọi thử thủ tục lần 2 (Sẽ chỉ ra 1 khách hàng mã 175)
CALL findAllCustomers();
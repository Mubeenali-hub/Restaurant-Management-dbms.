-- ========================================================
-- Master Schema Build Script for Restaurant Management DBMS
-- ========================================================

DROP DATABASE IF EXISTS restaurant_db;
CREATE DATABASE restaurant_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE restaurant_db;

-- 1. Base Entities
CREATE TABLE dining_tables (
    table_id INT AUTO_INCREMENT PRIMARY KEY,
    table_number INT NOT NULL UNIQUE,
    seating_capacity INT NOT NULL CHECK (seating_capacity > 0),
    status ENUM('available', 'occupied', 'reserved') DEFAULT 'available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    role ENUM('manager', 'chef', 'waiter', 'cashier') NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    salary DECIMAL(10, 2) NOT NULL CHECK (salary >= 0),
    hire_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    loyalty_points INT DEFAULT 0 CHECK (loyalty_points >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE menu_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(8, 2) NOT NULL CHECK (price > 0),
    preparation_time_mins INT DEFAULT 15 CHECK (preparation_time_mins >= 0),
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES menu_categories(category_id) ON DELETE CASCADE
);

-- 2. Transaction Entities
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NULL,
    table_id INT NULL,
    staff_id INT NOT NULL,
    order_status ENUM('pending', 'in_progress', 'served', 'completed', 'cancelled') DEFAULT 'pending',
    special_instructions TEXT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL,
    FOREIGN KEY (table_id) REFERENCES dining_tables(table_id) ON DELETE SET NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),
    unit_price DECIMAL(8, 2) NOT NULL CHECK (unit_price >= 0),
    subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- 3. Core Lookups and Performance Indexes
CREATE INDEX idx_customers_phone ON customers(phone);
CREATE INDEX idx_menu_items_name ON menu_items(item_name);
CREATE INDEX idx_menu_items_category ON menu_items(category_id);
CREATE INDEX idx_staff_role ON staff(role);
CREATE INDEX idx_orders_status ON orders(order_status);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_table ON orders(table_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_item ON order_items(item_id);

USE restaurant_db;

-- Customer Profiles & Contact Details
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    loyalty_points INT DEFAULT 0 CHECK (loyalty_points >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE restaurant_db;

-- Table Reservations Management
CREATE TABLE table_reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    table_id INT NOT NULL,
    reservation_time DATETIME NOT NULL,
    party_size INT NOT NULL CHECK (party_size > 0),
    status ENUM('confirmed', 'seated', 'cancelled', 'completed') DEFAULT 'confirmed',
    special_requests VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (table_id) REFERENCES dining_tables(table_id) ON DELETE CASCADE
);

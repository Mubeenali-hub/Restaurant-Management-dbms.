USE restaurant_db;

-- Payments Table to track transaction settlement
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT NOT NULL,
    payment_method ENUM('cash', 'credit_card', 'debit_card', 'online', 'wallet') NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL CHECK (amount_paid > 0),
    transaction_reference VARCHAR(100) UNIQUE NULL,
    payment_status ENUM('successful', 'pending', 'failed', 'refunded') DEFAULT 'successful',
    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (invoice_id) REFERENCES invoices(invoice_id) ON DELETE CASCADE
);

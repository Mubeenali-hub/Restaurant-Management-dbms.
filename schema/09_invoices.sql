USE restaurant_db;

-- Invoices Table for Billing Breakdown & Tax Calculations
CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    subtotal DECIMAL(10, 2) NOT NULL CHECK (subtotal >= 0),
    tax_rate DECIMAL(4, 2) DEFAULT 0.16 CHECK (tax_rate >= 0),
    tax_amount DECIMAL(10, 2) GENERATED ALWAYS AS (subtotal * tax_rate) STORED,
    discount_amount DECIMAL(10, 2) DEFAULT 0.00 CHECK (discount_amount >= 0),
    total_amount DECIMAL(10, 2) GENERATED ALWAYS AS ((subtotal + (subtotal * tax_rate)) - discount_amount) STORED,
    invoice_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

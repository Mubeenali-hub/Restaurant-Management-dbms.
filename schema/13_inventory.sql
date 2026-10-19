USE restaurant_db;

-- Inventory & Stock Tracking Module
CREATE TABLE inventory_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    current_stock DECIMAL(10, 2) NOT NULL CHECK (current_stock >= 0),
    unit_of_measure VARCHAR(20) NOT NULL,
    reorder_threshold DECIMAL(10, 2) NOT NULL CHECK (reorder_threshold >= 0),
    cost_per_unit DECIMAL(8, 2) NOT NULL CHECK (cost_per_unit >= 0),
    last_restocked TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

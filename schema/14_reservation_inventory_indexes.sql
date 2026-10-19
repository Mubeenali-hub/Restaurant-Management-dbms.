USE restaurant_db;

-- Indexes for fast reservation lookups and stock audits
CREATE INDEX idx_reservations_customer ON table_reservations(customer_id);
CREATE INDEX idx_reservations_table ON table_reservations(table_id);
CREATE INDEX idx_reservations_time ON table_reservations(reservation_time);
CREATE INDEX idx_reservations_status ON table_reservations(status);
CREATE INDEX idx_inventory_name ON inventory_items(item_name);
CREATE INDEX idx_inventory_category ON inventory_items(category);

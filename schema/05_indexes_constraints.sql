USE restaurant_db;

-- Indexes for fast query lookup
CREATE INDEX idx_customers_phone ON customers(phone);
CREATE INDEX idx_menu_items_name ON menu_items(item_name);
CREATE INDEX idx_menu_items_category ON menu_items(category_id);
CREATE INDEX idx_staff_role ON staff(role);

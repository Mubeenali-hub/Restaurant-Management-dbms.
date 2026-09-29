USE restaurant_db;

-- Indexes for fast billing audit and settlement checks
CREATE INDEX idx_invoices_order ON invoices(order_id);
CREATE INDEX idx_invoices_date ON invoices(invoice_date);
CREATE INDEX idx_payments_invoice ON payments(invoice_id);
CREATE INDEX idx_payments_method ON payments(payment_method);
CREATE INDEX idx_payments_status ON payments(payment_status);

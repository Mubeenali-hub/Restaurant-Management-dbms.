# 🍽️ Restaurant Management Database System (DBMS)

A robust, normalized relational database management system designed for complete restaurant operations, table bookings, staff tracking, order lifecycle, and sales analytics.

## 🎯 30-Day Development Roadmap
- [x] **Day 1:** Project initialization, directory structure, base tables (`dining_tables`, `staff`).
- [x] **Day 2:** Normalized schema expansion (`customers`, `menu_categories`, `menu_items`, lookup indexes).
- [x] **Day 3:** Core order lifecycle (`orders`, `order_items`), generated columns, and master schema consolidation.
- [ ] **Days 4–7:** Billing, payments, discount tracking, and relational integrity constraints.
- [ ] **Days 8–14:** Mock production seed data insertion & relational validation.
- [ ] **Days 15–21:** Complex joins, revenue analytics, and SQL views.
- [ ] **Days 22–28:** Stored procedures, automated status triggers, and indexing.
- [ ] **Days 29–30:** Final documentation, ER diagram, and testing suites.

## 🛠️ Quick Database Setup
Run the consolidated script directly into MySQL/MariaDB:
\`\`\`bash
mysql -u <username> -p < schema/master_schema.sql
\`\`\`

## 📂 Project Structure
\`\`\`text
├── schema/
│   ├── 00_init_database.sql
│   ├── 01_base_tables.sql
│   ├── 02_customers.sql
│   ├── 03_menu_categories.sql
│   ├── 04_menu_items.sql
│   ├── 05_indexes_constraints.sql
│   ├── 06_orders.sql
│   ├── 07_order_items.sql
│   ├── 08_order_indexes.sql
│   └── master_schema.sql
├── data/
├── queries/
├── procedures/
└── docs/
\`\`\`

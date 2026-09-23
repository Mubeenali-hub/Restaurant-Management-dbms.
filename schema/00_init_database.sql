-- Drop existing database if needed (fresh dev setup)
DROP DATABASE IF EXISTS restaurant_db;

-- Create Database with UTF-8 character encoding
CREATE DATABASE restaurant_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE restaurant_db;

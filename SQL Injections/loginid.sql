CREATE DATABASE lab_db;
USE lab_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

-- Insert a test user for login
INSERT INTO users (username, password) VALUES ('admin', 'password123');
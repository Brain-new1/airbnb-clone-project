CREATE DATABASE airbnb_db;
USE airbnb_db;

CREATE TABLE User (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  phone_number VARCHAR(15),
  password VARCHAR(255),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
  property_id INT AUTO_INCREMENT PRIMARY KEY,
  owner_id INT,
  title VARCHAR(100),
  description TEXT,
  location VARCHAR(100),
  price_per_night DECIMAL(10,2),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (owner_id) REFERENCES User(user_id)
);

CREATE TABLE Booking (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  property_id INT,
  check_in_date DATE,
  check_out_date DATE,
  total_price DECIMAL(10,2),
  status VARCHAR(20) DEFAULT 'Pending',
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

CREATE TABLE Payment (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT UNIQUE,
  payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  amount DECIMAL(10,2),
  method VARCHAR(30),
  status VARCHAR(20),
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review (
  review_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT UNIQUE,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

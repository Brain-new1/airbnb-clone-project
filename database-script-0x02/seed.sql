USE airbnb_db;

INSERT INTO User (first_name, last_name, email, phone_number, password)
VALUES
('Alice', 'Johnson', 'alice@example.com', '9876543210', 'pwd1'),
('Bob', 'Smith', 'bob@example.com', '8765432109', 'pwd2');

INSERT INTO Property (owner_id, title, description, location, price_per_night)
VALUES
(1, 'Sea View Apartment', 'Nice beach apartment', 'Goa', 3500.00),
(2, 'Hill Cottage', 'Beautiful mountain view', 'Manali', 4000.00);

INSERT INTO Booking (user_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES
(2, 1, '2025-11-01', '2025-11-05', 14000.00, 'Confirmed');

INSERT INTO Payment (booking_id, amount, method, status)
VALUES
(1, 14000.00, 'Credit Card', 'Success');

INSERT INTO Review (booking_id, rating, comment)
VALUES
(1, 5, 'Wonderful stay!');

-- Seed data for the User table
INSERT INTO User (user_id, first_name, last_name, email, phone_number, created_at, updated_at) VALUES
(1, 'Alice', 'Smith', 'alice.smith@example.com', '+256 777 123456', NOW(), NOW()),
(2, 'Bob', 'Johnson', 'bob.johnson@example.com', '+256 788 987654', NOW(), NOW()),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com', '+256 755 555555', NOW(), NOW());

-- Seed data for the Property table
INSERT INTO Property (property_id, owner_id, property_name, property_type, address, city, country, latitude, longitude, description, price_per_night, availability_start, availability_end, number_of_guests, number_of_bedrooms, number_of_bathrooms, amenities, created_at, updated_at) VALUES
(101, 1, 'Cozy Apartment in Kampala', 'Apartment', 'Plot 123 Makerere Road', 'Kampala', 'Uganda', 0.31628, 32.58135, 'A comfortable apartment with city views.', 50.00, '2025-06-01', '2025-08-31', 2, 1, 1, 'Wifi, Kitchen, TV', NOW(), NOW()),
(102, 2, 'Luxury Villa near Entebbe', 'Villa', 'Plot 456 Kitooro', 'Entebbe', 'Uganda', 0.05177, 32.50582, 'Spacious villa with a private garden and lake access.', 120.00, '2025-07-15', '2025-12-31', 6, 4, 3, 'Pool, Wifi, Parking, AC', NOW(), NOW()),
(103, 1, 'Budget Studio in Nakasero', 'Studio', 'Plot 789 Nakasero Hill', 'Kampala', 'Uganda', 0.31357, 32.58637, 'A small but convenient studio for solo travelers.', 30.00, '2025-05-15', '2025-07-31', 1, 1, 1, 'Wifi, Kitchenette', NOW(), NOW());

-- Seed data for the Booking table
INSERT INTO Booking (booking_id, property_id, guest_id, check_in_date, check_out_date, number_of_guests, total_price, booking_status, created_at, updated_at) VALUES
(201, 101, 2, '2025-06-10', '2025-06-15', 2, 250.00, 'Confirmed', NOW(), NOW()),
(202, 102, 3, '2025-07-20', '2025-07-27', 4, 840.00, 'Confirmed', NOW(), NOW()),
(203, 101, 3, '2025-08-01', '2025-08-05', 1, 200.00, 'Pending', NOW(), NOW());

-- Seed data for the Payment table
INSERT INTO Payment (payment_id, booking_id, payment_date, payment_method, amount, payment_status, transaction_id, created_at, updated_at) VALUES
(301, 201, '2025-06-05', 'Credit Card', 250.00, 'Paid', 'CC12345', NOW(), NOW()),
(302, 202, '2025-07-15', 'PayPal', 840.00, 'Paid', 'PP98765', NOW(), NOW()),
(303, 203, '2025-07-25', 'Credit Card', 100.00, 'Partial', 'CC67890', NOW(), NOW());

-- You would continue this for any other tables in your schema,
-- such as reviews, property_amenities (if you have a separate table), etc.

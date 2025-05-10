-- Create User table
CREATE TABLE IF NOT EXISTS User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Index on User email
CREATE INDEX IF NOT EXISTS idx_user_email ON User (email);

-- Create Property table
CREATE TABLE IF NOT EXISTS Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id)
);

-- Create Index on Property host_id
CREATE INDEX IF NOT EXISTS idx_property_host_id ON Property (host_id);
-- Create Index on Property property_id (already primary key, but explicitly adding for clarity)
CREATE INDEX IF NOT EXISTS idx_property_property_id ON Property (property_id);

-- Create Booking table
CREATE TABLE IF NOT EXISTS Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Index on Booking property_id
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON Booking (property_id);
-- Create Index on Booking user_id
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON Booking (user_id);
-- Create Index on Booking booking_id (already primary key)
CREATE INDEX IF NOT EXISTS idx_booking_booking_id ON Booking (booking_id);

-- Create Payment table
CREATE TABLE IF NOT EXISTS Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Create Index on Payment booking_id
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON Payment (booking_id);
-- Create Index on Payment payment_id (already primary key)
CREATE INDEX IF NOT EXISTS idx_payment_payment_id ON Payment (payment_id);

-- Create Review table
CREATE TABLE IF NOT EXISTS Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create Index on Review property_id
CREATE INDEX IF NOT EXISTS idx_review_property_id ON Review (property_id);
-- Create Index on Review user_id
CREATE INDEX IF NOT EXISTS idx_review_user_id ON Review (user_id);
-- Create Index on Review review_id (already primary key)
CREATE INDEX IF NOT EXISTS idx_review_review_id ON Review (review_id);

-- Create Message table
CREATE TABLE IF NOT EXISTS Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);

-- Create Index on Message sender_id
CREATE INDEX IF NOT EXISTS idx_message_sender_id ON Message (sender_id);
-- Create Index on Message recipient_id
CREATE INDEX IF NOT EXISTS idx_message_recipient_id ON Message (recipient_id);
-- Create Index on Message message_id (already primary key)
CREATE INDEX IF NOT EXISTS idx_message_message_id ON Message (message_id);

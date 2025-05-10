# Database Schema for ALX Airbnb Project

This `schema.sql` file contains the SQL Data Definition Language (DDL) statements used to create the database schema for the ALX Airbnb project. The schema is designed to model an Airbnb-like application, capturing entities such as users, properties, bookings, payments, reviews, and messages.

The database schema is designed for a relational database system and was written for PostgreSQL.

## File Description

* **`schema.sql`**:
    * Contains SQL `CREATE TABLE` statements for all entities.
    * Defines the structure of each table, including columns, data types, primary keys, foreign keys, and constraints.
    * Includes `CREATE INDEX` statements to optimize query performance.

## Database Design Considerations

* The schema adheres to the Third Normal Form (3NF) to minimize data redundancy and ensure data integrity.
* The `User` table stores user information, including roles (guest, host, admin).
* The `Property` table stores property details, with a foreign key referencing the host user in the `User` table.
* The `Booking` table manages booking information, with foreign keys referencing both `Property` and `User` tables.
* The `Payment` table stores payment details for each booking.
* The `Review` table stores user reviews for properties.
* The `Message` table stores messages between users.
* Indexes are created on frequently queried columns, such as `email` in the `User` table, `property_id` in the `Property` and `Booking` tables, and `booking_id` in the `Payment` tables, to improve query performance.

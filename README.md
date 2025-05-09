Let's clearly define the relationships between the entities in the ProDev Backend (AirBnB) database based on the foreign key constraints you provided:

* **User and Property:**
    * **One-to-Many:** One `User` can host many `Property` listings. The `Property` table has a foreign key `host_id` that references the `user_id` in the `User` table.

* **User and Booking:**
    * **One-to-Many:** One `User` can make many `Booking` records. The `Booking` table has a foreign key `user_id` that references the `user_id` in the `User` table.

* **Property and Booking:**
    * **One-to-Many:** One `Property` can have many `Booking` records. The `Booking` table has a foreign key `property_id` that references the `property_id` in the `Property` table.

* **Booking and Payment:**
    * **One-to-One or One-to-Many (Typically One-to-One):** One `Booking` can have one `Payment` record (in most standard scenarios). The `Payment` table has a foreign key `booking_id` that references the `booking_id` in the `Booking` table. While technically a booking could have multiple payments (e.g., for modifications), in a basic setup, it's often a one-to-one relationship.

* **User and Review (as Reviewer):**
    * **One-to-Many:** One `User` can write many `Review` records. The `Review` table has a foreign key `user_id` that references the `user_id` in the `User` table, indicating who wrote the review.

* **Property and Review:**
    * **One-to-Many:** One `Property` can receive many `Review` records. The `Review` table has a foreign key `property_id` that references the `property_id` in the `Property` table, indicating which property is being reviewed.

* **User and Message (as Sender):**
    * **One-to-Many:** One `User` can send many `Message` records. The `Message` table has a foreign key `sender_id` that references the `user_id` in the `User` table.

* **User and Message (as Recipient):**
    * **One-to-Many:** One `User` can receive many `Message` records. The `Message` table has a foreign key `recipient_id` that references the `user_id` in the `User` table.

**In Summary:**

* A **User** can host multiple **Properties**.
* A **User** can make multiple **Bookings**.
* A **Property** can have multiple **Bookings**.
* A **Booking** typically has one **Payment**.
* A **User** can write multiple **Reviews** for different **Properties**.
* A **Property** can receive multiple **Reviews** from different **Users**.
* A **User** can send multiple **Messages** to other **Users**.
* A **User** can receive multiple **Messages** from other **Users**.

These relationships define how the data in your database is connected and how you can retrieve and manage information across different entities.

ProDev Backend
Average: 10.08%
Database Specification - AirBnB
Entities and Attributes
User
user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (guest, host, admin), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Property
property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
location: VARCHAR, NOT NULL
pricepernight: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
Booking
booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
total_price: DECIMAL, NOT NULL
status: ENUM (pending, confirmed, canceled), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Payment
payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
Review
review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Message
message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
Constraints
User Table
Unique constraint on email.
Non-null constraints on required fields.
Property Table
Foreign key constraint on host_id.
Non-null constraints on essential attributes.
Booking Table
Foreign key constraints on property_id and user_id.
status must be one of pending, confirmed, or canceled.
Payment Table
Foreign key constraint on booking_id, ensuring payment is linked to valid bookings.
Review Table
Constraints on rating values (1-5).
Foreign key constraints on property_id and user_id.
Message Table
Foreign key constraints on sender_id and recipient_id.
Indexing
Primary Keys: Indexed automatically.
Additional Indexes:
email in the User table.
property_id in the Property and Booking tables.
booking_id in the Booking and Payment tables.
Copyright © 2025 ALX, All rights reserved.

## Database Normalization Steps for ALX Airbnb Database

The initial database schema for the ALX Airbnb project was reviewed to ensure adherence to the Third Normal Form (3NF). 3NF aims to eliminate data redundancy and ensure data integrity by requiring that all non-key attributes are directly dependent on the primary key and there are no transitive dependencies.

**Analysis of Entities:**

* **User:** The `User` entity with attributes `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, and `created_at` is in 3NF. All non-key attributes are directly dependent on the primary key `user_id`.

* **Property:** The `Property` entity with attributes `property_id`, `host_id`, `name`, `description`, `location`, `pricepernight`, `created_at`, and `updated_at` is in 3NF. All non-key attributes are directly dependent on the primary key `property_id`.

* **Booking:** The `Booking` entity with attributes `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, and `created_at` is in 3NF. All non-key attributes are directly dependent on the primary key `booking_id`.

* **Payment:** The `Payment` entity with attributes `payment_id`, `booking_id`, `amount`, `payment_date`, and `payment_method` is in 3NF. All non-key attributes are directly dependent on the primary key `payment_id`.

* **Review:** The `Review` entity with attributes `review_id`, `property_id`, `user_id`, `rating`, `comment`, and `created_at` is in 3NF. All non-key attributes are directly dependent on the primary key `review_id`.

* **Message:** The `Message` entity with attributes `message_id`, `sender_id`, `recipient_id`, `message_body`, and `sent_at` is in 3NF. All non-key attributes are directly dependent on the primary key `message_id`.

**Conclusion:**

Based on this initial analysis, the provided database schema appears to be well-normalized and already in the Third Normal Form. No immediate normalization steps involving splitting tables or moving attributes seem necessary at this stage. The design effectively avoids redundancy and ensures that each attribute directly relates to the primary key of its respective entity.

It's important to note that as requirements evolve, further normalization or denormalization might be considered for performance optimization or to accommodate new data relationships. However, the current design provides a solid foundation adhering to 3NF principles.

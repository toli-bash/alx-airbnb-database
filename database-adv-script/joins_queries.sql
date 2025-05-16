-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings.
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM
    Booking AS b
INNER JOIN
    User AS u ON b.user_id = u.user_id;

-- Explanation:
-- This query joins the Booking and User tables using the user_id column, which is the foreign key in the Booking table and the primary key in the User table.
-- It returns a result set that includes columns from both tables, showing the details of each booking along with the information of the user who made the booking.
-- Only bookings that have a corresponding user and users that have made a booking will be included in the result.

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM
    Property AS p
LEFT JOIN
    Review AS r ON p.property_id = r.property_id;

-- Explanation:
-- This query joins the Property and Review tables using the property_id column.
-- It returns all properties from the Property table, and for each property, it returns the corresponding reviews from the Review table.
-- If a property has no reviews, the columns from the Review table (review_id, rating, comment) will contain NULL values, but the property will still be included in the result.
-- This ensures that all properties are listed, regardless of whether they have any reviews.

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM
    User AS u
FULL OUTER JOIN
    Booking AS b ON u.user_id = b.user_id;

-- Explanation:
-- This query joins the User and Booking tables using the user_id column.
-- It returns all rows from both tables, combining them where the user_id values match.
-- If a user has no bookings, the booking-related columns (booking_id, property_id, start_date, end_date) will be NULL for that user.
-- Similarly, if a booking is not associated with any user (which ideally shouldn't happen in a well-designed database, but this query handles such cases), the user-related columns (user_id, first_name, last_name) will be NULL for that booking.
-- This ensures that all users and all bookings are included in the result, regardless of whether they have a match in the other table.


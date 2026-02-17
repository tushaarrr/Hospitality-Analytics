/* =====================================================
   Hospitality Revenue Analysis Queries
   ===================================================== */

-- 1️⃣ Total Revenue Generated

SELECT 
    SUM(revenue_generated) AS total_revenue_generated,
    SUM(revenue_realized) AS total_revenue_realized
FROM fact_bookings;


-- 2️⃣ Revenue Realization %

SELECT 
    ROUND(
        SUM(revenue_realized) / SUM(revenue_generated) * 100, 2
    ) AS realization_percentage
FROM fact_bookings;


-- 3️⃣ Revenue by Booking Platform

SELECT 
    booking_platform,
    SUM(revenue_realized) AS total_revenue
FROM fact_bookings
GROUP BY booking_platform
ORDER BY total_revenue DESC;


-- 4️⃣ Revenue by Hotel

SELECT 
    h.hotel_name,
    h.city,
    SUM(f.revenue_realized) AS total_revenue
FROM fact_bookings f
JOIN dim_hotels h ON f.property_id = h.hotel_id
GROUP BY h.hotel_name, h.city
ORDER BY total_revenue DESC;


-- 5️⃣ Monthly Revenue Trend

SELECT 
    d.year,
    d.month,
    SUM(f.revenue_realized) AS monthly_revenue
FROM fact_bookings f
JOIN dim_date d ON f.booking_date = d.date
GROUP BY d.year, d.month
ORDER BY d.year, d.month;


-- 6️⃣ Occupancy Rate

SELECT 
    SUM(successful_bookings) / SUM(capacity) * 100 AS occupancy_rate
FROM fact_aggregated_bookings;


-- 7️⃣ Average Rating by Platform

SELECT 
    booking_platform,
    ROUND(AVG(ratings_given),2) AS avg_rating
FROM fact_bookings
GROUP BY booking_platform
ORDER BY avg_rating DESC;


-- 8️⃣ Cancelled Revenue Loss

SELECT 
    SUM(revenue_generated - revenue_realized) AS revenue_loss
FROM fact_bookings
WHERE booking_status = 'Cancelled';


-- 9️⃣ Top Performing Cities

SELECT 
    h.city,
    SUM(f.revenue_realized) AS total_revenue
FROM fact_bookings f
JOIN dim_hotels h ON f.property_id = h.hotel_id
GROUP BY h.city
ORDER BY total_revenue DESC;

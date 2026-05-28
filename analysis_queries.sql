-- ============================================================
-- Customer Purchase Behavior Analysis
-- Author: Abhimitra Reddy
-- Database: ecommerce_db | Table: orders
-- Dataset: 7,79,425 rows | Online Retail Store
-- Tool: MySQL Workbench
-- ============================================================

USE ecommerce_db;

-- ============================================================
-- QUERY 1: Top 20 Highest Spending Customers
-- Goal: Identify the most valuable customers by total revenue.
-- Business Use: Helps businesses prioritize retention efforts
-- and offer loyalty rewards to their best customers.
-- ============================================================

SELECT customer_id, 
       ROUND(SUM(revenue), 2) AS total_spent,
       COUNT(DISTINCT invoice_id) AS total_orders
FROM orders
WHERE customer_id IS NOT NULL AND customer_id != ''
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 20;

-- ============================================================
-- QUERY 2: Pareto Analysis (Top 30% vs Bottom 70%)
-- Goal: Test whether the Pareto principle holds in this dataset.
-- Business Use: If a small group of customers drives most revenue,
-- the business should focus heavily on retaining them.
-- Result: Top 30% of customers generate 85% of total revenue.
-- ============================================================

WITH customer_revenue AS (
    SELECT customer_id,
           SUM(revenue) AS total_spent
    FROM orders
    WHERE customer_id IS NOT NULL AND customer_id != ''
    GROUP BY customer_id
),
ranked AS (
    SELECT customer_id, total_spent,
           NTILE(10) OVER (ORDER BY total_spent DESC) AS decile
    FROM customer_revenue
)
SELECT 
    CASE WHEN decile <= 3 THEN 'Top 30%' ELSE 'Bottom 70%' END AS customer_group,
    ROUND(SUM(total_spent), 2) AS total_revenue,
    ROUND(SUM(total_spent) * 100.0 / SUM(SUM(total_spent)) OVER(), 2) AS revenue_percentage
FROM ranked
GROUP BY customer_group;

-- ============================================================
-- QUERY 3: Customer Segmentation
-- Goal: Segment customers by purchase frequency into 3 groups:
--       One-time Buyers, Occasional Buyers, and Loyal Buyers.
-- Business Use: Helps design targeted marketing campaigns.
-- Example: Re-engagement emails for one-time buyers,
--          loyalty programs for loyal buyers.
-- ============================================================

SELECT 
    CASE 
        WHEN total_orders = 1 THEN 'One-time Buyer'
        WHEN total_orders BETWEEN 2 AND 5 THEN 'Occasional Buyer'
        ELSE 'Loyal Buyer'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM orders WHERE customer_id != ''), 2) AS percentage
FROM (
    SELECT customer_id, COUNT(DISTINCT invoice_id) AS total_orders
    FROM orders
    WHERE customer_id IS NOT NULL AND customer_id != ''
    GROUP BY customer_id
) AS customer_data
GROUP BY customer_segment
ORDER BY customer_segment;

-- ============================================================
-- QUERY 4: Top 10 Best Selling Products by Revenue
-- Goal: Find the highest revenue generating products.
-- Business Use: Helps with inventory planning and identifying
-- which products to promote or stock more of.
-- Note: High units sold does not always mean high revenue,
-- as seen with the T-Light Holder vs Cakestand.
-- ============================================================

SELECT stock_code,
       description,
       ROUND(SUM(revenue), 2) AS total_revenue,
       SUM(quantity) AS total_quantity_sold
FROM orders
WHERE description IS NOT NULL AND description != ''
GROUP BY stock_code, description
ORDER BY total_revenue DESC
LIMIT 10;

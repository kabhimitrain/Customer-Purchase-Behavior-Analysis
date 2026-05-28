![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?logo=mysql&logoColor=white)
![Excel](https://img.shields.io/badge/Microsoft_Excel-Data_Cleaning-217346?logo=microsoft-excel&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

# Customer Purchase Behavior Analysis

This project demonstrates my SQL, data cleaning, and business analysis skills using a real-world e-commerce dataset with **779,425 transaction records**.

---

## Project Structure

```
Customer-Purchase-Behavior-Analysis/
│── screenshots/          → Query result images
│── analysis_queries.sql  → All 4 SQL queries with comments
│── README.md             → Project documentation
```

---

## Why This Project

Most beginner SQL projects use small, clean, unrealistic datasets. I wanted to work on something closer to what analysts actually deal with — messy data, real business questions, and insights that drive decisions. This project is my attempt at that.

---

## Dataset

| Property | Details |
|---|---|
| Source | Online Retail Dataset (Kaggle) |
| Total Records | 779,425 transactions |
| Database | MySQL (ecommerce_db) |
| Table | orders |

**Columns:** invoice_id, stock_code, description, quantity, invoice_date, unit_price, customer_id, country, year, month, month_name, day_of_week, revenue

---

## Data Cleaning (Excel)

The raw dataset was messy and needed significant cleaning before any analysis. I used Microsoft Excel for this step.

| Issue Found | Action Taken | Rows Removed |
|---|---|---|
| Missing Customer ID | Removed rows with no customer | 243,007 rows |
| Cancelled invoices (C prefix) | Removed all cancellations | 18,744 rows |
| Zero price rows | Removed invalid transactions | 71 rows |
| Duplicate rows | Removed exact duplicates | 26,124 rows |
| **Final clean dataset** | | **779,425 rows** |

New calculated columns added:
- **revenue** — Quantity × Unit Price
- **year** — extracted from invoice date
- **month & month_name** — for trend analysis
- **day_of_week** — for pattern analysis

After cleaning, there were zero null values remaining in any column.

---

## Business Questions Answered

### 1. Who are the top 20 highest spending customers?

I wanted to see which customers bring in the most revenue. Customer 18102 turned out to be the top spender at £580,987 across 145 orders — almost double the second highest.

### 2. Do the top 30% of customers generate 70% of revenue?

This is based on the Pareto principle (the 80/20 rule). I was curious whether it holds true here. Turns out it does — and then some. The top 30% of customers generate **85% of total revenue**, which is stronger than expected.

| Customer Group | Revenue | Share |
|---|---|---|
| Top 30% | £14,772,354 | 85.02% |
| Bottom 70% | £2,602,450 | 14.98% |

### 3. How many customers bought only once vs multiple times?

I segmented customers into three groups based on how many times they ordered.

| Segment | Customers | % |
|---|---|---|
| Loyal Buyer (6+ orders) | 1,801 | 30.64% |
| Occasional Buyer (2–5 orders) | 2,454 | 41.75% |
| One-time Buyer (1 order) | 1,623 | 27.61% |

Almost 28% of customers never came back after their first purchase. That stood out to me — retaining even a fraction of them could significantly boost revenue.

### 4. What are the top 10 best selling products by revenue?

| Product | Revenue | Units Sold |
|---|---|---|
| Regency Cakestand 3 Tier | £277,656 | 24,124 |
| White Hanging Heart T-Light Holder | £247,048 | 91,757 |
| Paper Craft, Little Birdie | £168,469 | 80,995 |
| Jumbo Bag Red Retrospot | £134,307 | 74,224 |
| Assorted Colour Bird Ornament | £124,351 | 78,234 |

The Cakestand generates the most revenue but the T-Light Holder sells nearly 4x more units — so high volume doesn't always mean high revenue.

---

## Key Insights Summary

- Top 30% of customers drive **85% of revenue** — stronger than the Pareto principle predicts
- **27.61% of customers are one-time buyers** — a major retention opportunity for the business
- Regency Cakestand is #1 in revenue but T-Light Holder outsells it nearly 4x in units
- Customer 18102 alone spent £580,987 — nearly double the second highest spender

---

## SQL Concepts Used

- CTEs (Common Table Expressions)
- Window Functions (NTILE, OVER)
- CASE WHEN
- GROUP BY and ORDER BY
- Aggregate Functions (SUM, COUNT, ROUND)
- Subqueries
- Customer Segmentation Logic
- Revenue Analysis

---

## Project Screenshots

### Query 1 — Top 20 Highest Spending Customers
![Query 1](screenshots/query1_top_customers.png)

### Query 2 — Pareto Analysis
![Query 2](screenshots/query2_pareto_analysis.png)

### Query 3 — Customer Segmentation
![Query 3](screenshots/query3_segmentation.png)

### Query 4 — Top 10 Best Selling Products
![Query 4](screenshots/query4_top_products.png)

---

## What I Learned

- Writing CTEs and window functions like NTILE() and OVER() in real scenarios
- How to clean and filter messy real-world data in Excel before importing into MySQL
- The Pareto principle holds strongly here — meaning businesses should invest heavily in retaining their top 30% customers rather than spending equally across all customers
- One-time buyers are a significant retention problem for e-commerce businesses
- High unit sales does not always mean high revenue — pricing strategy matters

---

## Tools Used

- **Microsoft Excel** — Data cleaning and preparation
- **MySQL & MySQL Workbench** — Data analysis and querying
- **Git & GitHub** — Version control and portfolio

---

## About Me

I am Abhimitra Reddy, a CSE & Data Science graduate who enjoys working with real datasets to find patterns that matter to businesses. This project is part of my portfolio where I focus on SQL, Excel, and business analysis. I am currently open to entry-level Data Analyst opportunities.

---

## Connect With Me

- 🔗 LinkedIn: [Katipally Abhimitra Reddy](https://www.linkedin.com/in/katipally-abhimitra-reddy-8bab142b9/)
- 🐙 GitHub: [kabhimitrain](https://github.com/kabhimitrain)
- 📧 Email: kabhimitrareddy@gmail.com

\# PL/SQL Assignment 1 - Sunrise Supermarket



\- \*\*Student Name:\*\* senga aphrodis

\- \*\*Student ID:\*\* 20251SEN137

\- \*\*DBMS Used:\*\* Oracle Database 10g Express Edition (Oracle SQL Developer)

\- \*\*Submission Date:\*\* September 2026



\---



\## 1. Business Scenario Summary

Sunrise Supermarket sells products across multiple categories (Dairy, Bakery, and Beverages) to registered customers\[cite: 1]. The database system is designed to track customer details, inventory items, orders, and individual line items\[cite: 1]. Management requested an analytical breakdown of customer purchasing behavior, sales performance, revenue patterns over time, and retention intervals using SQL JOINs, Common Table Expressions (CTEs), and Window Functions\[cite: 1].



\---



\## 2. Database Schema Overview

The database consists of four core tables\[cite: 1]:

1\. \*\*`customers`\*\*: Stores customer demographic information (`customer\_id`, `customer\_name`, `email`, `city`)\[cite: 1].

2\. \*\*`products`\*\*: Catalog of items sold (`product\_id`, `product\_name`, `category`, `price`)\[cite: 1].

3\. \*\*`orders`\*\*: Header logs for purchase transactions (`order\_id`, `customer\_id`, `order\_date`)\[cite: 1].

4\. \*\*`order\_items`\*\*: Line-item details connecting products to specific orders (`order\_item\_id`, `order\_id`, `product\_id`, `quantity`)\[cite: 1].



\---



\## 3. Query Explanations \& Answers



\### Query 1: Order Details with Customer Demographics (INNER JOIN)

\- \*\*Query Type:\*\* `INNER JOIN` (orders + customers)\[cite: 1].

\- \*\*Purpose:\*\* Combines order transaction records with customer names and locations\[cite: 1].

\- \*\*Explanation:\*\* Ensures that management can see who placed each order and where they are located\[cite: 1].



\### Query 2: Product Performance Line Items (JOIN)

\- \*\*Query Type:\*\* `JOIN` (order\_items + products)\[cite: 1].

\- \*\*Purpose:\*\* Connects each line item to its respective product details, categories, and unit pricing\[cite: 1].

\- \*\*Explanation:\*\* Displays quantity breakdown per product to evaluate inventory movements\[cite: 1].



\### Query 3: Complete Customer Audit (LEFT JOIN)

\- \*\*Query Type:\*\* `LEFT JOIN` (customers + orders)\[cite: 1].

\- \*\*Purpose:\*\* Lists all registered customers regardless of whether they have placed an order\[cite: 1].

\- \*\*Explanation:\*\* Retains inactive registered accounts (e.g., Mugisha Jean) to identify non-converting leads.



\### Query 4: Above-Average Customer Spend (CTE \& Subquery)

\- \*\*Query Type:\*\* Common Table Expression (`WITH` clause)\[cite: 1].

\- \*\*Purpose:\*\* Calculates aggregate spending per customer and filters out those who spend above the overall customer average\[cite: 1].

\- \*\*Explanation:\*\* Isolate high-value transactions to recognize top revenue contributors.



\### Query 5: Customer Spend Ranking (DENSE\_RANK)

\- \*\*Query Type:\*\* Window Function (`DENSE\_RANK() OVER`)\[cite: 1].

\- \*\*Purpose:\*\* Ranks customers sequentially based on their total spend\[cite: 1].

\- \*\*Explanation:\*\* Ranks total monetary contribution from highest to lowest without skipping rank indices for ties.



\### Query 6: Chronological Customer Order Sequencing (ROW\_NUMBER)

\- \*\*Query Type:\*\* Window Function (`ROW\_NUMBER() OVER`)\[cite: 1].

\- \*\*Purpose:\*\* Numbers orders sequentially for each specific customer ordered by purchase date\[cite: 1].

\- \*\*Explanation:\*\* Enables tracking of order progression per customer (Order #1, Order #2, etc.).



\### Query 7: Running Revenue Trend (SUM OVER)

\- \*\*Query Type:\*\* Window Function (`SUM() OVER`)\[cite: 1].

\- \*\*Purpose:\*\* Calculates cumulative revenue over time sorted chronologically by order date\[cite: 1].

\- \*\*Explanation:\*\* Tracks financial trajectory and daily revenue growth patterns across September 2026.



\### Query 8: Purchase Interval Days (LAG)

\- \*\*Query Type:\*\* Window Function (`LAG() OVER`)\[cite: 1].

\- \*\*Purpose:\*\* Calculates days elapsed between a customer's current order and their previous order\[cite: 1].

\- \*\*Explanation:\*\* Measures customer re-engagement rate and purchase frequency interval.



\---



\## 4. Business Interpretation for Management

1\. \*\*High-Value Customer Base:\*\* High-spending customers demonstrate strong demand for bakery items (e.g., Chocolate Cake) and beverages. Marketing strategies should focus on cross-selling these categories.

2\. \*\*Customer Retention Frequency:\*\* The `LAG` function analysis reveals repeat orders occurring within intervals of 2 to 6 days, demonstrating strong customer loyalty among active accounts.

3\. \*\*Inactive Lead Conversion:\*\* The `LEFT JOIN` audit identifies registered customers without orders. Targeted promotional vouchers can be directed to these accounts to encourage initial purchases.



\---



\## 5. Setup \& Execution Instructions

1\. Execute `solution.sql` in Oracle SQL Developer or SQL\*Plus\[cite: 1].

2\. The script builds tables, populates sample data, commits transactions, and executes queries 1 through 8\[cite: 1].


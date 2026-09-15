<div align="center">
  <h1 style="color: #1a5276; font-family: Arial, sans-serif;">Sunrise Supermarket — PL/SQL Assignment Report</h1>
  <p style="font-size: 15px; color: #5d6d7e;">
    <b>Student Name:</b> Senga Aphrodis &nbsp;|&nbsp; 
    <b>Student ID:</b> 20251SEN137 &nbsp;|&nbsp; 
    <b>DBMS:</b> Oracle Database 10g Express Edition/reported via HTML AND CSS.
  </p>
  <hr style="border: 1px solid #d6dbdf; width: 80%;">
</div>

<h2 style="color: #21618c; font-family: Arial, sans-serif;">1. Business Scenario</h2>
<p style="font-size: 14px; line-height: 1.6; color: #2c3e50;">
  Sunrise Supermarket is a local retail store operating in Rwanda that manages sales across different product lines such as Dairy, Bakery, and Beverages. The management required a clear database design to track customer profiles, order history, and product details. This project focuses on analyzing sales performance, identifying customer trends, and computing running revenue over time using JOINs, CTEs, and Window Functions.
</p>

<h2 style="color: #21618c; font-family: Arial, sans-serif;">2. Database Schema</h2>
<p style="font-size: 14px; color: #2c3e50;">The database is structured into four primary tables:</p>
<ul style="font-size: 14px; color: #2c3e50; line-height: 1.6;">
  <li><b>customers:</b> Stores customer details (<code>customer_id</code>, <code>customer_name</code>, <code>email</code>, <code>city</code>).</li>
  <li><b>products:</b> Catalog of items (<code>product_id</code>, <code>product_name</code>, <code>category</code>, <code>price</code>).</li>
  <li><b>orders:</b> General transaction headers (<code>order_id</code>, <code>customer_id</code>, <code>order_date</code>).</li>
  <li><b>order_items:</b> Specific product details per order (<code>order_item_id</code>, <code>order_id</code>, <code>product_id</code>, <code>quantity</code>).</li>
</ul>

<h2 style="color: #21618c; font-family: Arial, sans-serif;">3. Queries Summary & Explanations</h2>

<table width="100%" cellpading="8" cellspacing="0" style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px;">
  <thead>
    <tr style="background-color: #2980b9; color: white; text-align: left;">
      <th style="padding: 10px; border: 1px solid #ddd;">No.</th>
      <th style="padding: 10px; border: 1px solid #ddd;">Query Focus</th>
      <th style="padding: 10px; border: 1px solid #ddd;">SQL Technique Used</th>
      <th style="padding: 10px; border: 1px solid #ddd;">Purpose / What it Answers</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">1</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Order Demographics</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>INNER JOIN</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Lists every order together with customer name, location city, and date.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">2</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Line Item Details</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>JOIN</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Shows ordered quantities along with product names, categories, and unit price.</td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">3</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Customer Audit</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>LEFT JOIN</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Displays all registered customers including those who haven't placed an order yet.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">4</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Above-Average Spenders</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>CTE (WITH Clause)</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Calculates total spend per customer and filters those above the store average.</td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">5</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Spend Ranking</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>DENSE_RANK()</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Ranks top spending customers in descending order from highest to lowest.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">6</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Order Sequence</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>ROW_NUMBER()</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Numbers each customer's orders chronologically (Order #1, Order #2, etc.).</td>
    </tr>
    <tr>
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">7</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Running Revenue</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>SUM() OVER()</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Computes cumulative daily sales revenue over time.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #ddd; text-align: center;">8</td>
      <td style="padding: 10px; border: 1px solid #ddd;">Purchase Frequency</td>
      <td style="padding: 10px; border: 1px solid #ddd;"><code>LAG()</code></td>
      <td style="padding: 10px; border: 1px solid #ddd;">Calculates the exact number of days passed between consecutive customer orders.</td>
    </tr>
  </tbody>
</table>

<h2 style="color: #21618c; font-family: Arial, sans-serif;">4. Business Insights & Management Recommendations</h2>
<ul style="font-size: 14px; color: #2c3e50; line-height: 1.6;">
  <li><b>High-Value Customers:</b> Premium products like Bakery items (Chocolate Cakes) and Beverages drive higher sales totals. The store should bundle these items for special promotions.</li>
  <li><b>Customer Retention:</b> Based on the <code>LAG</code> function results, repeat customers usually order again within 2 to 6 days. Sending reminder SMS/emails around day 4 can improve repeat purchases.</li>
  <li><b>Converting Inactive Accounts:</b> The <code>LEFT JOIN</code> query highlighted registered customers with 0 orders. Offering a welcome discount voucher can help convert them into active buyers.</li>
</ul>

<h2 style="color: #21618c; font-family: Arial, sans-serif;">5. Challenges & Resolutions</h2>
<p style="font-size: 14px; line-height: 1.6; color: #2c3e50;">
  While working on Query 8, calculating date differences using the <code>LAG()</code> function initially produced <code>NULL</code> values for first-time orders. This was solved by applying a outer query filter (<code>WHERE previous_order_date IS NOT NULL</code>) so that only customers with multiple purchases are displayed as requested.
</p>

<hr style="border: 1px solid #d6dbdf;">
<p align="center" style="font-size: 13px; color: #7f8c8d; font-family: Arial, sans-serif;">
  <i>PL/SQL Assignment 1 — Submitted via GitHub Repository</i>
</p>

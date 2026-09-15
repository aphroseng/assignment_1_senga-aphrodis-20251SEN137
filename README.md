<div align="center" style="background: linear-gradient(135deg, #1f618d, #117a65); padding: 25px; border-radius: 10px; color: white; margin-bottom: 20px;">
  <h1 style="color: orange; font-family: 'Segoe UI', Arial, sans-serif; margin: 0; padding-bottom: 8px;">Sunrise Supermarket — PL/SQL Assignment Report</h1>
  <p style="font-size: 15px; color: #e8f8f5; margin: 5px 0 0 0;">
    <b style="color:red;">Student Name:</b> Senga Aphrodis &nbsp;|&nbsp; 
    <b>Student ID:</b> 20251SEN136 &nbsp;|&nbsp; 
    <b>Engine:</b> Oracle Database 10g Express Edition
  </p>
</div>

<div align="center" style="margin-bottom: 25px;">
  <span style="background-color: #27ae60; color: white; padding: 6px 14px; border-radius: 20px; font-weight: bold; font-size: 13px;">✔ Status: Completed</span> &nbsp;
  <span style="background-color: #2980b9; color: white; padding: 6px 14px; border-radius: 20px; font-weight: bold; font-size: 13px;">📊 Queries: 8 Executed</span> &nbsp;
  <span style="background-color: #8e44ad; color: white; padding: 6px 14px; border-radius: 20px; font-weight: bold; font-size: 13px;">🏬 Subject: Database Analytics</span>
</div>

<h2 style="color: #1a5276; font-family: Arial, sans-serif; border-bottom: 3px solid #2980b9; padding-bottom: 5px;">1. Business Scenario</h2>
<p style="font-size: 14px; line-height: 1.6; color: #2c3e50; background-color: #f4f6f7; padding: 12px; border-left: 5px solid #2980b9; border-radius: 4px;">
  <b>Sunrise Supermarket</b> is a retail grocery business operating in Rwanda. It manages multiple product lines including Dairy, Bakery, and Beverages. Management required a structured database system to monitor customer purchasing habits, track sales volume per category, and evaluate revenue trends over time using <b>JOINs</b>, <b>CTEs</b>, and <b>Window Functions</b>.
</p>

<h2 style="color: #1a5276; font-family: Arial, sans-serif; border-bottom: 3px solid #27ae60; padding-bottom: 5px;">2. Database Schema Architecture</h2>
<ul style="font-size: 14px; color: #2c3e50; line-height: 1.8;">
  <li><b style="color: #c0392b;">customers:</b> Stores buyer profile records (<code>customer_id</code>, <code>customer_name</code>, <code>email</code>, <code>city</code>).</li>
  <li><b style="color: #d35400;">products:</b> Inventory catalog items (<code>product_id</code>, <code>product_name</code>, <code>category</code>, <code>price</code>).</li>
  <li><b style="color: #27ae60;">orders:</b> Order headers tracking date and customer relation (<code>order_id</code>, <code>customer_id</code>, <code>order_date</code>).</li>
  <li><b style="color: #2980b9;">order_items:</b> Specific line items per invoice (<code>order_item_id</code>, <code>order_id</code>, <code>product_id</code>, <code>quantity</code>).</li>
</ul>

<h2 style="color: #1a5276; font-family: Arial, sans-serif; border-bottom: 3px solid #8e44ad; padding-bottom: 5px;">3. Analytical Queries Overview</h2>

<table width="100%" cellpadding="8" cellspacing="0" style="border-collapse: collapse; font-family: Arial, sans-serif; font-size: 14px;">
  <thead>
    <tr style="background-color: #1f618d; color: white; text-align: left;">
      <th style="padding: 10px; border: 1px solid #1a5276;">No.</th>
      <th style="padding: 10px; border: 1px solid #1a5276;">Query Focus</th>
      <th style="padding: 10px; border: 1px solid #1a5276;">SQL Technique</th>
      <th style="padding: 10px; border: 1px solid #1a5276;">Business Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr style="background-color: #ffffff;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">1</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Order Demographics</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #ebf5fb; color: #1b4f72; padding: 3px 7px; border-radius: 3px; font-weight: bold;">INNER JOIN</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Retrieves transactions with customer names and cities.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">2</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Line Items Analysis</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #ebf5fb; color: #1b4f72; padding: 3px 7px; border-radius: 3px; font-weight: bold;">JOIN</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Lists purchased items, product categories, and unit pricing.</td>
    </tr>
    <tr style="background-color: #ffffff;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">3</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Inactive Account Audit</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #fef9e7; color: #7d6608; padding: 3px 7px; border-radius: 3px; font-weight: bold;">LEFT JOIN</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Displays all customers, highlighting non-ordering accounts.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">4</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Top Tier Buyers</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #eafaf1; color: #145a32; padding: 3px 7px; border-radius: 3px; font-weight: bold;">CTE (WITH)</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Filters customers whose total spending exceeds average store spend.</td>
    </tr>
    <tr style="background-color: #ffffff;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">5</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Customer Ranking</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #f4ecf7; color: #512e5f; padding: 3px 7px; border-radius: 3px; font-weight: bold;">DENSE_RANK()</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Ranks buyers based on overall total spend.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">6</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Order Sequence</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #f4ecf7; color: #512e5f; padding: 3px 7px; border-radius: 3px; font-weight: bold;">ROW_NUMBER()</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Assigns order numbers per customer chronologically.</td>
    </tr>
    <tr style="background-color: #ffffff;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">7</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Running Total Revenue</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #f4ecf7; color: #512e5f; padding: 3px 7px; border-radius: 3px; font-weight: bold;">SUM() OVER()</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Calculates cumulative sales daily over time.</td>
    </tr>
    <tr style="background-color: #f8f9f9;">
      <td style="padding: 10px; border: 1px solid #e5e7e9; text-align: center; font-weight: bold; color: #1f618d;">8</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9; font-weight: bold;">Order Interval Days</td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;"><span style="background-color: #f4ecf7; color: #512e5f; padding: 3px 7px; border-radius: 3px; font-weight: bold;">LAG()</span></td>
      <td style="padding: 10px; border: 1px solid #e5e7e9;">Computes days elapsed between successive orders.</td>
    </tr>
  </tbody>
</table>

<h2 style="color: #1a5276; font-family: Arial, sans-serif; border-bottom: 3px solid #f39c12; padding-bottom: 5px;">4. Key Strategic Insights</h2>
<div style="display: flex; gap: 10px; flex-wrap: wrap;">
  <div style="background-color: #eafaf1; border: 1px solid #27ae60; border-radius: 6px; padding: 12px; margin-bottom: 10px;">
    <h3 style="color: #1e8449; margin-top: 0; font-size: 15px;">🛍️ Product Performance</h3>
    <p style="margin: 0; font-size: 13.5px; color: #1e8449;">Bakery products generate higher average transaction value per basket compared to general items.</p>
  </div>
  <div style="background-color: #ebf5fb; border: 1px solid #2980b9; border-radius: 6px; padding: 12px; margin-bottom: 10px;">
    <h3 style="color: #21618c; margin-top: 0; font-size: 15px;">🔄 Repeat Order Retention</h3>
    <p style="margin: 0; font-size: 13.5px; color: #21618c;">The <code>LAG()</code> analysis indicates repeat transactions usually occur within <b>2 to 6 days</b> of prior purchases.</p>
  </div>
</div>

<hr style="border: none; border-top: 1px solid #d6dbdf; margin-top: 30px;">
<p align="center" style="font-size: 12px; color: #7f8c8d; font-family: Arial, sans-serif;">
  <i>PL/SQL Assignment 1 — Prepared for Academic Evaluation</i>
</p>

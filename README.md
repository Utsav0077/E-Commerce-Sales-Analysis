📊 E-Commerce & Retail Sales Performance Dashboard

End-to-End Data Analytics Project | SQL • PostgreSQL • Excel • Power BI • DAX

📌 Project Overview

This project focuses on analyzing retail sales data to uncover meaningful business insights and develop an interactive Power BI dashboard.

Using Microsoft Excel, PostgreSQL, SQL, Power BI, Power Query, and DAX, I analyzed 9,994 retail sales records to evaluate sales performance, profitability, customer behavior, and regional trends.

The objective is to transform raw sales data into actionable insights that support data-driven business decisions.

---

🛠️ Tools & Technologies

Technology| Purpose
Microsoft Excel| Data Cleaning & Validation
PostgreSQL| Database Management
SQL| Data Analysis & Querying
Power BI| Interactive Dashboard Development
Power Query| Data Transformation
DAX| KPI Calculations & Business Metrics

📂 Dataset Information

Dataset: Sample Superstore

Attribute| Details
Total Records| 9,994
Total Columns| 21
Time Period| 2014–2017
Database| ecommerce_sales
Table| public.superstore_sales
Categories| Furniture, Office Supplies, Technology
Customer Segments| Consumer, Corporate, Home Office
Regions| Central, East, South, West

📈 Key Performance Indicators

KPI| Result
💰 Total Revenue| $2.30M
📊 Total Profit| $286.40K
🛒 Total Orders| Approximately 5K
📈 Profit Margin| 12.47%
📦 Total Sales Records| 9,994

Results are rounded for presentation and calculated from the Sample Superstore dataset.

---

🖥️ Dashboard Preview

Sales Performance Dashboard

"Sales Performance Dashboard" (Screenshot%202026-10-20%20103038.png)

The Sales Performance dashboard includes:

- Total Revenue KPI
- Total Profit KPI
- Total Orders KPI
- Profit Margin KPI
- Category-wise Sales & Profit Analysis
- Regional Sales Performance

Product & Customer Analysis Dashboard

"Product Analysis Dashboard" (Screenshot%202026-10-20%20103120.png)

The Product Analysis dashboard includes:

- Top 10 Products by Revenue
- Customer Segment Analysis
- Region, Category, and Year filters
- Interactive visualizations

---

🧹 Data Cleaning & Preparation

Performed data cleaning and validation using Microsoft Excel.

Key activities:

1. Imported the Sample Superstore dataset.
2. Checked for missing values.
3. Verified duplicate Row IDs.
4. Validated numerical columns such as Sales, Quantity, Discount, and Profit.
5. Verified Order Date and Ship Date.
6. Preserved negative profit values for business analysis.
7. Removed temporary validation columns.
8. Prepared the dataset for PostgreSQL.
9. Successfully imported 9,994 records into the database.

🗄️ SQL Analysis

Used PostgreSQL to perform sales and profitability analysis.

Total Revenue & Profit

SELECT
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales;

Profit Margin

SELECT
    ROUND(
        SUM(profit) * 100.0 /
        NULLIF(SUM(sales), 0), 2
    ) AS profit_margin_percentage
FROM public.superstore_sales;

Category-wise Sales Analysis

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

Regional Sales Performance

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

Top 10 Products

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_revenue
FROM public.superstore_sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

The complete SQL script is available in "Ecommerce_Sales_Analysis.sql".

---

🧮 Power BI DAX Measures

Created custom DAX measures for calculating important business KPIs.

Total Revenue =
SUM('public superstore_sales'[sales])

Total Profit =
SUM('public superstore_sales'[profit])

Total Orders =
DISTINCTCOUNT('public superstore_sales'[order_id])

Profit Margin % =
DIVIDE([Total Profit], [Total Revenue], 0)

🔍 Key Business Insights

1. Technology Generated the Highest Revenue

Technology was the highest-revenue product category, generating approximately $836K in sales.

2. Furniture Had Lower Profitability

Furniture generated substantial revenue but comparatively low profit, indicating potential opportunities to improve margins.

3. West Region Led Sales Performance

The West region generated the highest revenue, followed by the East region.

4. Customer Segmentation

Consumer, Corporate, and Home Office customers contributed differently to total revenue, highlighting opportunities for targeted marketing strategies.

5. Regional Profitability

Regional sales analysis helped compare revenue and profit performance across West, East, Central, and South.

---

💡 Business Recommendations

- Improve profitability in low-margin product categories.
- Review discount strategies for Furniture products.
- Focus on high-performing Technology products.
- Monitor regional sales and profit trends.
- Use customer segmentation for targeted marketing.
- Track business KPIs through interactive Power BI dashboards.

📁 Project Files

E-Commerce-Sales-Analysis/
│
├── Sample - Superstore.csv
├── Superstore_Ready.xlsx
│
├── Ecommerce_Sales_Analysis.sql
├── Ecommerce_Sales_Dashboard.pbix
│
├── Screenshot 2026-10-20 103038.png
├── Screenshot 2026-10-20 103120.png
│
├── PROJECT OBJECTIVE.txt
├── DATASET DESCRIPTION.txt
├── DATA CLEANING AND PREP.txt
├── SQL ANALYSIS.txt
├── BUSINESS INSIGHT AND RECOMMENDATION.txt
│
└── README.md

🚀 How to Run the Project

1. Download or clone this repository.
2. Install PostgreSQL and Power BI Desktop.
3. Import the Superstore dataset into PostgreSQL.
4. Execute the SQL queries in "Ecommerce_Sales_Analysis.sql".
5. Open "Ecommerce_Sales_Dashboard.pbix" in Power BI Desktop.
6. Configure the PostgreSQL data source if necessary.
7. Explore the interactive dashboards and business insights.

The report uses imported data. Refreshing requires access to a compatible PostgreSQL database.

🎯 Skills Demonstrated

- SQL & PostgreSQL
- Microsoft Excel
- Power BI & DAX
- Power Query
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Data Visualization
- Sales Analysis
- Customer Segmentation
- KPI Reporting
- Business Intelligence
- Business Insights & Reporting

---

👨‍💻 About Me

Utsav Singh

Aspiring Data Analyst | BCA Student | SQL | Power BI | Python | Excel

Passionate about transforming raw data into meaningful insights and building interactive dashboards that support business decisions.

🔗 Connect With Me

- GitHub: "Utsav0077" (https://github.com/Utsav0077)
- LinkedIn: "Utsav Singh" (https://www.linkedin.com/in/utsav-singh-507b51210)

---

⭐ If you find this project useful, consider giving the repository a star.

Built with SQL, PostgreSQL, Microsoft Excel, and Power BI.

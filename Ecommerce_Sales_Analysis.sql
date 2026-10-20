-- ==========================================
-- E-COMMERCE & RETAIL SALES ANALYSIS
-- Database: ecommerce_sales
-- Table: public.superstore_sales
-- ==========================================


-- 1. TOTAL REVENUE

SELECT
    ROUND(SUM(sales), 2) AS total_revenue
FROM public.superstore_sales;


-- 2. TOTAL PROFIT

SELECT
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales;


-- 3. PROFIT MARGIN (%)

SELECT
    ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(sales), 0), 2
    ) AS profit_margin_percentage
FROM public.superstore_sales;


-- 4. TOTAL UNIQUE ORDERS

SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM public.superstore_sales;


-- 5. TOTAL QUANTITY SOLD

SELECT
    SUM(quantity) AS total_units_sold
FROM public.superstore_sales;


-- 6. TOTAL UNIQUE CUSTOMERS

SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM public.superstore_sales;


-- 7. AVERAGE ORDER VALUE

SELECT
    ROUND(
        SUM(sales) /
        NULLIF(COUNT(DISTINCT order_id), 0),
        2
    ) AS average_order_value
FROM public.superstore_sales;


-- 8. COMPLETE KPI SUMMARY

SELECT
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_units_sold,
    ROUND(
        100.0 * SUM(profit) /
        NULLIF(SUM(sales), 0), 2
    ) AS profit_margin_percentage
FROM public.superstore_sales;


-- 9. CATEGORY-WISE SALES AND PROFIT

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold
FROM public.superstore_sales
GROUP BY category
ORDER BY total_sales DESC;


-- 10. SUB-CATEGORY PERFORMANCE

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY category, sub_category
ORDER BY total_sales DESC;


-- 11. REGION-WISE SALES ANALYSIS

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM public.superstore_sales
GROUP BY region
ORDER BY total_sales DESC;


-- 12. STATE-WISE SALES ANALYSIS

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY state
ORDER BY total_sales DESC;


-- 13. TOP 10 PRODUCTS BY REVENUE

SELECT
    product_id,
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    SUM(quantity) AS units_sold
FROM public.superstore_sales
GROUP BY product_id, product_name
ORDER BY total_sales DESC
LIMIT 10;


-- 14. TOP 10 MOST PROFITABLE PRODUCTS

SELECT
    product_id,
    product_name,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY product_id, product_name
ORDER BY total_profit DESC
LIMIT 10;


-- 15. TOP 10 CUSTOMERS BY REVENUE

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_spent,
    COUNT(DISTINCT order_id) AS total_orders
FROM public.superstore_sales
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;


-- 16. CUSTOMER SEGMENT ANALYSIS

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT customer_id) AS customers
FROM public.superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;


-- 17. YEAR-WISE SALES ANALYSIS

SELECT
    EXTRACT(YEAR FROM order_date)::INT
        AS sales_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY sales_year;


-- 18. MONTHLY SALES TRENDS

SELECT
    DATE_TRUNC('month', order_date)::DATE
        AS sales_month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM public.superstore_sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;


-- 19. DISCOUNT IMPACT ANALYSIS

SELECT
    discount,
    COUNT(*) AS sales_lines,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY discount
ORDER BY discount;


-- 20. LOSS-MAKING SUB-CATEGORIES

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM public.superstore_sales
GROUP BY category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;
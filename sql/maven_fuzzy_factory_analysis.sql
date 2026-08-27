```sql
-- ============================================================
-- MAVEN FUZZY FACTORY — SQL ANALYSIS
-- ============================================================
-- Project : E-Commerce & Marketing Analysis
-- Dataset : Maven Fuzzy Factory
-- Tool    : MySQL / DBeaver
--
-- Tujuan:
-- 1. Memahami performa website dan order
-- 2. Mengukur conversion rate
-- 3. Menganalisis performa marketing channel
-- 4. Menganalisis perkembangan revenue dari waktu ke waktu
-- 5. Menganalisis performa produk
-- 6. Menghitung refund dan net revenue
-- ============================================================


-- ============================================================
-- 1. DATASET OVERVIEW
-- ============================================================

-- Menghitung jumlah order.
SELECT
    COUNT(*) AS total_orders
FROM orders;


-- Menghitung jumlah order yang berasal dari session unik.
SELECT
    COUNT(DISTINCT website_session_id) AS unique_order_sessions
FROM orders;


-- Menghitung jumlah session website.
SELECT
    COUNT(DISTINCT website_session_id) AS total_sessions
FROM website_sessions;


-- ============================================================
-- 2. OVERALL SESSION-TO-ORDER CONVERSION RATE
-- ============================================================

-- Menghitung persentase session website yang menghasilkan order.
--
-- Rumus:
-- Conversion Rate =
-- Jumlah session yang menghasilkan order
-- ---------------------------------------- x 100
-- Total session website

SELECT
    ROUND(
        (
            SELECT COUNT(DISTINCT website_session_id)
            FROM orders
        )
        /
        (
            SELECT COUNT(DISTINCT website_session_id)
            FROM website_sessions
        )
        * 100,
        2
    ) AS conversion_rate;


-- ============================================================
-- 3. MARKETING CHANNEL PERFORMANCE
-- ============================================================

-- Menghitung jumlah session, order, dan conversion rate
-- berdasarkan sumber traffic (utm_source).
--
-- LEFT JOIN digunakan agar session yang tidak menghasilkan
-- order tetap ikut dihitung.

SELECT
    ws.utm_source,

    COUNT(DISTINCT ws.website_session_id) AS sessions,

    COUNT(DISTINCT o.order_id) AS orders,

    ROUND(
        COUNT(DISTINCT o.order_id)
        /
        COUNT(DISTINCT ws.website_session_id)
        * 100,
        2
    ) AS conversion_rate

FROM website_sessions ws

LEFT JOIN orders o
    ON ws.website_session_id = o.website_session_id

GROUP BY ws.utm_source

ORDER BY orders DESC;


-- ============================================================
-- 4. MONTHLY REVENUE & REVENUE PER ORDER
-- ============================================================

-- Menghitung revenue, jumlah order, dan rata-rata revenue
-- per order setiap bulan.
--
-- Revenue per Order:
-- Total Revenue / Jumlah Order

SELECT
    DATE_FORMAT(created_at, '%Y-%m') AS month,

    ROUND(SUM(price_usd), 2) AS revenue,

    COUNT(DISTINCT order_id) AS orders,

    ROUND(
        SUM(price_usd)
        /
        COUNT(DISTINCT order_id),
        2
    ) AS revenue_per_order

FROM orders

GROUP BY month

ORDER BY month ASC;


-- ============================================================
-- 5. PRODUCT PERFORMANCE
-- ============================================================

-- Menghitung jumlah order dan revenue untuk setiap produk.
--
-- order_items digunakan sebagai tabel transaksi,
-- sedangkan products digunakan untuk mendapatkan nama produk.

SELECT
    p.product_id,

    p.product_name,

    COUNT(DISTINCT oi.order_id) AS orders,

    ROUND(SUM(oi.price_usd), 2) AS revenue

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY revenue DESC;


-- ============================================================
-- 6. PRODUCT PROFITABILITY
-- ============================================================

-- Menghitung:
-- - Orders
-- - Revenue
-- - COGS (Cost of Goods Sold)
-- - Gross Profit
-- - Gross Profit Margin
--
-- Gross Profit:
-- Revenue - COGS
--
-- Gross Profit Margin:
-- Gross Profit / Revenue x 100

SELECT
    p.product_name,

    COUNT(DISTINCT oi.order_id) AS orders,

    ROUND(SUM(oi.price_usd), 2) AS revenue,

    ROUND(SUM(oi.cogs_usd), 2) AS cogs_usd,

    ROUND(
        SUM(oi.price_usd) - SUM(oi.cogs_usd),
        2
    ) AS gross_profit,

    ROUND(
        (
            SUM(oi.price_usd) - SUM(oi.cogs_usd)
        )
        /
        SUM(oi.price_usd)
        * 100,
        2
    ) AS gross_profit_margin

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY gross_profit DESC;


-- ============================================================
-- 7. PRODUCT PERFORMANCE WITH REFUNDS
-- ============================================================

-- Menggabungkan transaksi dengan data refund.
--
-- LEFT JOIN digunakan agar produk yang tidak memiliki refund
-- tetap muncul dalam hasil analisis.
--
-- COALESCE digunakan untuk mengubah NULL menjadi 0
-- pada produk tanpa refund.

SELECT
    p.product_name,

    COUNT(DISTINCT oi.order_id) AS orders,

    ROUND(SUM(oi.price_usd), 2) AS revenue,

    ROUND(
        SUM(oi.price_usd)
        -
        COALESCE(SUM(oir.refund_amount_usd), 0),
        2
    ) AS net_revenue,

    ROUND(SUM(oi.cogs_usd), 2) AS cogs_usd,

    ROUND(
        SUM(oi.price_usd) - SUM(oi.cogs_usd),
        2
    ) AS gross_profit,

    ROUND(
        (
            SUM(oi.price_usd) - SUM(oi.cogs_usd)
        )
        /
        SUM(oi.price_usd)
        * 100,
        2
    ) AS gross_profit_margin,

    ROUND(
        COALESCE(SUM(oir.refund_amount_usd), 0),
        2
    ) AS refunds

FROM order_items oi

LEFT JOIN products p
    ON oi.product_id = p.product_id

LEFT JOIN order_item_refunds oir
    ON oi.order_item_id = oir.order_item_id

GROUP BY
    p.product_id,
    p.product_name

ORDER BY net_revenue DESC;


-- ============================================================
-- 8. REFUND VALIDATION
-- ============================================================

-- Memeriksa apakah satu order_item_id memiliki lebih dari
-- satu record refund.
--
-- Jika query tidak menghasilkan baris, berarti tidak terdapat
-- order_item_id dengan lebih dari satu record refund.
--
-- Query ini digunakan untuk memvalidasi kemungkinan
-- double counting sebelum melakukan analisis refund.

SELECT
    order_item_id,

    COUNT(*) AS jumlah_refund

FROM order_item_refunds

GROUP BY order_item_id

HAVING COUNT(*) > 1;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================
-- Analisis utama yang dihasilkan:
--
-- 1. Overall conversion rate
-- 2. Conversion rate berdasarkan marketing channel
-- 3. Monthly revenue
-- 4. Revenue per order
-- 5. Product orders & revenue
-- 6. Product gross profit
-- 7. Product gross profit margin
-- 8. Refund & net revenue
--
-- Catatan:
-- Gross Profit = Revenue - COGS
-- Gross Profit Margin = Gross Profit / Revenue
-- Net Revenue = Revenue - Refund
--
-- Gross profit bukan net profit karena dataset tidak mencakup
-- seluruh biaya operasional perusahaan.
-- ============================================================
```



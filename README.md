# Maven Fuzzy Factory — E-Commerce & Marketing Analysis

## 📊 Project Overview

Analisis data e-commerce menggunakan dataset **Maven Fuzzy Factory** dari Maven Analytics.

Project ini bertujuan untuk menganalisis performa website, transaksi, produk, revenue, profit, refund, dan channel marketing menggunakan **SQL dan Power BI**.

Analisis dilakukan mulai dari pengolahan data menggunakan **MySQL & DBeaver**, kemudian dilanjutkan dengan **data modeling, DAX, dan visualisasi menggunakan Power BI**.

---

## 🖥️ Power BI Dashboard

Dashboard dibuat dalam format **16:9** untuk memberikan gambaran ringkas mengenai performa e-commerce.

### KPI

* **Total Orders:** 32.31K
* **Total Sessions:** 472.87K
* **Conversion Rate:** 6.83%
* **Total Revenue:** $1.94M
* **Net Revenue:** $1.85M
* **Total Profit:** $1.22M

### Dashboard Visuals

* Revenue Trend
* Orders Trend
* Marketing Channel Performance
* Product Performance

---

## 🎯 Business Questions

Analisis ini dilakukan untuk menjawab beberapa pertanyaan bisnis:

1. Bagaimana tren website sessions dan orders dari waktu ke waktu?
2. Berapa session-to-order conversion rate?
3. Channel marketing mana yang menghasilkan traffic dan order paling banyak?
4. Produk mana yang menghasilkan revenue terbesar?
5. Produk mana yang memiliki profit margin terbaik?
6. Bagaimana perkembangan revenue per order?
7. Bagaimana refund memengaruhi net revenue?

---

## 🗂️ Dataset

Dataset yang digunakan adalah **Maven Fuzzy Factory**, dataset e-commerce dari **Maven Analytics**.

Dataset mencakup data website sessions, pageviews, orders, order items, products, dan refunds selama periode **Maret 2012 – Maret 2015**.

### Tabel

| Table                                 | Description                      |
| ------------------------------------- | -------------------------------- |
| `orders`                              | Data transaksi                   |
| `order_items`                         | Detail produk dalam setiap order |
| `order_item_refunds`                  | Data refund                      |
| `products`                            | Data produk                      |
| `website_sessions`                    | Data kunjungan/session website   |
| `website_pageviews`                   | Data halaman website             |
| `maven_fuzzy_factory_data_dictionary` | Data dictionary                  |

**Source:** Maven Analytics
**License:** Public Domain

---

## 🛠️ Tools

* **MySQL** — Database
* **DBeaver** — SQL analysis & database management
* **Power BI** — Data modeling, DAX & visualization
* **Microsoft Excel** — Initial data inspection
* **Git & GitHub** — Version control

---

## 🔄 Analysis Workflow

```text
Dataset
   ↓
MySQL
   ↓
DBeaver
   ↓
SQL Analysis
   ↓
Power BI Data Model
   ↓
DAX Measures
   ↓
Dashboard
   ↓
Business Insights
```

---

## 🔎 SQL Analysis

SQL digunakan untuk menganalisis beberapa aspek utama:

### Website & Conversion

* Total website sessions
* Total orders
* Session-to-order conversion rate
* Monthly order trend

### Revenue & Profitability

* Monthly revenue
* Revenue per order
* COGS
* Profit
* Profit margin
* Refunds
* Net revenue

### Marketing

* Sessions berdasarkan `utm_source`
* Orders berdasarkan `utm_source`
* Conversion rate berdasarkan marketing channel

### Product

* Orders berdasarkan produk
* Revenue berdasarkan produk
* Profit berdasarkan produk
* Profit margin berdasarkan produk
* Refund berdasarkan produk

---

## 📈 Key Results

### Overall Performance

| Metric          |  Result |
| --------------- | ------: |
| Total Orders    |  32,313 |
| Total Sessions  | 472,871 |
| Conversion Rate |   6.83% |
| Total Revenue   |  $1.94M |
| Net Revenue     |  $1.85M |
| Total Profit    |  $1.22M |

### Marketing Channel Performance

| Channel    | Sessions | Orders | Conversion Rate |
| ---------- | -------: | -----: | --------------: |
| gsearch    |  316,035 | 21,333 |           6.75% |
| NULL       |   83,328 |  6,118 |           7.34% |
| bsearch    |   62,823 |  4,519 |           7.19% |
| socialbook |   10,685 |    343 |           3.21% |

### Product Performance

| Product                    | Orders |       Revenue | Profit Margin |
| -------------------------- | -----: | ------------: | ------------: |
| The Original Mr. Fuzzy     | 24,226 | $1,211,057.74 |        61.01% |
| The Forever Love Bear      |  5,796 |   $347,702.04 |        62.51% |
| The Birthday Sugar Panda   |  4,985 |   $229,260.15 |        68.49% |
| The Hudson River Mini bear |  5,018 |   $150,489.82 |        68.36% |

---

## 💡 Business Insights

### Marketing

**gsearch** merupakan channel dengan jumlah sessions dan orders terbesar.

Namun, volume traffic terbesar tidak selalu menghasilkan conversion rate tertinggi. Oleh karena itu, performa channel perlu dilihat berdasarkan **traffic, orders, dan conversion rate** secara bersamaan.

### Product

**The Original Mr. Fuzzy** merupakan produk dengan revenue dan profit absolut terbesar.

Namun, produk tersebut bukan produk dengan profit margin tertinggi.

**The Birthday Sugar Panda** memiliki profit margin tertinggi sebesar **68.49%**.

### Revenue & Refund

Total revenue mencapai sekitar **$1.94M**, sedangkan setelah memperhitungkan refund, net revenue menjadi sekitar **$1.85M**.

Hal ini menunjukkan bahwa refund merupakan faktor yang perlu diperhatikan ketika mengevaluasi performa revenue.

### Business Growth

Data menunjukkan adanya peningkatan aktivitas website, orders, dan revenue selama periode analisis.

Tren tersebut dapat digunakan untuk mengevaluasi perkembangan bisnis serta mengidentifikasi periode dengan performa tinggi dan rendah.

---

## 📁 Project Structure

```text
maven-fuzzy-factory/
│
├── README.md
│
├── sql/
│   └── maven_fuzzy_factory_analysis.sql
│
├── powerbi/
│   └── maven_fuzzy_factory_analysis.pbix
│
└── images/
    └── dashboard.png
```

---

## 📂 Project Files

### SQL Analysis

Berisi seluruh query SQL yang digunakan dalam proses analisis.

[`maven_fuzzy_factory_analysis.sql`](sql/maven_fuzzy_factory_analysis.sql)

### Power BI Dashboard

Berisi data model, DAX measures, visualisasi, dan dashboard Power BI.

[`maven_fuzzy_factory_analysis.pbix`](powerbi/maven_fuzzy_factory_analysis.pbix)

### Dashboard Preview

Screenshot dashboard:

images/dashboard.png

---

## 🚀 Skills Demonstrated

### SQL

* Data aggregation
* JOIN & LEFT JOIN
* GROUP BY
* ORDER BY
* COUNT & COUNT DISTINCT
* SUM
* ROUND
* COALESCE
* Subquery
* Relational database analysis

### Power BI

* MySQL data connection
* Data modeling
* Table relationships
* DAX measures
* KPI cards
* Line charts
* Column charts
* Bar charts
* Dashboard design

### Data Analysis

* E-commerce analysis
* Conversion analysis
* Marketing channel analysis
* Revenue analysis
* Product performance
* Profitability analysis
* Refund analysis
* Trend analysis

---

## 📌 Conclusion

Project **Maven Fuzzy Factory** menunjukkan proses analisis data dari database relational hingga menjadi dashboard business intelligence.

Dengan menggunakan **SQL dan Power BI**, data website, transaksi, produk, marketing, dan refund diubah menjadi informasi yang dapat digunakan untuk memahami:

**Traffic → Conversion → Orders → Revenue → Refund → Net Revenue → Profitability**

Project ini dibuat sebagai bagian dari **portfolio Data Analyst** untuk menunjukkan kemampuan dalam melakukan SQL analysis, data modeling, DAX, data visualization, dan business insight.

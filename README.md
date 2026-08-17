# Retail Superstore Sales Analysis

Analysis of ~10,000 retail transactions from a fictional US Superstore, using **SQL** for data querying and **Excel** for visualization, to identify what's driving (and hurting) company profit.

## Business Questions

1. Which regions are most/least profitable?
2. Which product categories/subcategories are profitable vs. losing money?
3. Does discounting hurt overall profit?
4. Who are our most valuable customers?
5. How do sales and profit trend over time?

## Tools Used

- **SQL (SQLite, via DB Browser)** — data querying, aggregation, and cleaning
- **Excel** — charts and Pivot Tables for visualization
- **GitHub** — version control and portfolio hosting

## Dataset

[Sample Superstore dataset](https://www.kaggle.com/datasets/timchant/supstore-dataset-2019-2022) — 9,994 rows of order-level retail transactions, including sales, profit, discount, region, category, and customer data (2019–2022).

## Key Insights

**1. Regional Profitability**
West and East are the most profitable regions. Central has higher sales than South but lower profit — suggesting discounting or product mix issues are hurting margins there.

**2. Category Performance**
Phones, Chairs, and Accessories show strong sales with healthy profit margins. However, Tables, Bookcases, and Supplies have high sales but *negative* profit — a red flag worth investigating further.

**3. Discount Impact**
No-discount and low-discount (0–20%) orders remain solidly profitable. Medium (20–50%) and High (50%+) discount bands are actually **loss-making** — the company isn't just earning less on these sales, it's losing money outright. This strongly suggests discounting above 20% is a major driver of the profitability issues seen in regions and categories above.

**4. Top Customers**
Tamara Chand and Raymond Buch lead as the most profitable customers — strong candidates for a loyalty/retention program. Profit contribution varies even within the top 10 ($2,869–$8,981), suggesting an opportunity to study what makes top performers different.

**5. Seasonal Trend**
Sales and profit grow year-over-year (2019→2022), with a consistent seasonal spike every November–December — useful for planning inventory and marketing investment ahead of Q4.

## SQL Problem-Solving Highlight

One challenge while writing the monthly trend query: the `order_date` column was stored as inconsistent text (e.g., `01/03/2019` vs `1/3/2019`), which broke SQLite's built-in `strftime()` date function and returned blank results.

**Fix:** used `instr()` to dynamically locate the `/` separators in each date string (instead of assuming fixed character positions), extracted the month and year with `substr()`, converted them to numbers with `CAST()`, then rebuilt a clean `YYYY-MM` label with `printf()`. This ensured every row — regardless of its original date formatting — was grouped correctly into the right month.

This was a good reminder that real-world data is rarely clean, and that date/text formatting issues are worth checking early rather than trusting a function's output blindly.

## Repository Structure

├── README.md
├── superstore.db # SQLite database
├── queries.sql # All 5 SQL business queries, with comments
├── superstore_analysis.xlsx # Excel workbook: charts + pivot tables
└── screenshots/ # Chart images

## Charts & Pivot Tables

See `superstore_analysis.xlsx` for:
- 5 charts (bar/line) answering each business question
- 2 Pivot Tables (Region and Category) cross-validated against SQL query results

## How to Reproduce

1. Open `superstore.db` in [DB Browser for SQLite](https://sqlitebrowser.org/)
2. Run queries from `queries.sql` in the Execute SQL tab
3. Results can be cross-checked against the Pivot Tables in `superstore_analysis.xlsx`

## Author

**Zayson R** — MSc Business Analytics, University of Greenwich
Github - (https://github.com/ZaysonR)
Linkedin - (https://www.linkedin.com/in/jason-rai-430a731b2/)

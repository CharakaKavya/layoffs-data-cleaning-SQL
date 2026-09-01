**🌍Global Layoffs — Data Cleaning with MySQL**

Turning a messy real-world layoffs dataset into clean, analysis-ready data using SQL.

**📌 About the Project**

I built this project to practice **real-world data cleaning using MySQL**.

The dataset contains layoff information from companies across different industries, countries, and locations. Before any meaningful analysis can be done, the raw data needs to be cleaned and standardized.

In this project, I worked through the dataset step by step — identifying duplicates, fixing inconsistent values, handling missing information, and converting data into the correct format.

---

## 🧰 Tools Used

**Database:** MySQL
**Environment:** MySQL Workbench
**Language:** SQL
**Version Control:** GitHub

---

## 📊 Dataset at a Glance

The dataset includes information such as:

| Column                  | What it represents               |
| ----------------------- | -------------------------------- |
| `company`               | Company name                     |
| `location`              | Company/location                 |
| `industry`              | Industry category                |
| `total_laid_off`        | Number of employees laid off     |
| `percentage_laid_off`   | Percentage of workforce laid off |
| `date`                  | Layoff date                      |
| `stage`                 | Company funding stage            |
| `country`               | Country                          |
| `funds_raised_millions` | Funds raised in millions         |

---

## 🧹 What I Cleaned

### 🔎 1. Found Duplicate Records

Used the SQL `ROW_NUMBER()` window function together with `PARTITION BY` to identify records containing the same information.

```sql
ROW_NUMBER() OVER (
    PARTITION BY company, location, industry,
    total_laid_off, percentage_laid_off,
    `date`, stage, country,
    funds_raised_millions
)
```

This helped identify which records were duplicates before removing them.

### ✂️ 2. Cleaned Company Names

Used `TRIM()` to remove unnecessary spaces from company names and make the values consistent.

### 🏷️ 3. Standardized Industry Values

Found variations such as cryptocurrency-related industry names and standardized them into a single `Crypto` category.

### 🌎 4. Cleaned Country Names

Identified inconsistent country values and removed unnecessary trailing characters.

### 📅 5. Fixed Date Format

Converted the original date values into a proper MySQL `DATE` format using:

```sql
STR_TO_DATE()
```

This makes the date column much easier to use for future analysis.

### 🔍 6. Handled Missing Industry Values

For companies where the industry was missing, I compared records from the same company and used available industry information to fill the missing values.

### 🗑️ 7. Removed Records Without Layoff Information

Removed records where both:

* `total_laid_off` was NULL
* `percentage_laid_off` was NULL

These records did not contain useful layoff information for analysis.

---

## 💡 SQL Skills Practiced

Through this project, I practiced:

`SELECT` · `WHERE` · `DISTINCT` · `ORDER BY` · `LIKE` · `TRIM()` · `UPDATE` · `DELETE` · `ALTER TABLE` · `JOIN` · `CTE` · `ROW_NUMBER()` · `STR_TO_DATE()` · `NULL` handling

---

## 📁 Repository Structure

```text
📦 layoffs-data-cleaning-SQL
│
├── 📄 layoffs.csv
├── 📄 layoffs_data_cleaning.sql
└── 📄 README.md
```

**`layoffs.csv`** → Original dataset
**`layoffs_data_cleaning.sql`** → SQL queries used for cleaning
**`README.md`** → Project documentation

---

## 🎯 What I Learned

This project helped me understand that data analysis doesn't start with charts or dashboards.

It starts with **clean, reliable data**.

I gained hands-on practice with:

* Finding and removing duplicate records
* Working with NULL and missing values
* Standardizing inconsistent text
* Using joins for data cleaning
* Working with CTEs and window functions
* Converting and formatting dates
* Preparing data for exploratory analysis

---

## 🚀 What's Next?

The cleaned dataset is now ready for the next stage:

**SQL Data Cleaning → Exploratory Data Analysis → Insights → Visualization**

Planned next steps:

* 📈 Analyze layoffs by year
* 🏢 Find companies with the highest layoffs
* 🌎 Compare layoffs across countries
* 🏷️ Analyze layoffs by industry
* 📊 Identify yearly trends
* 📉 Build a Power BI dashboard
* 💡 Extract meaningful business insights

---

## 👩‍💻 Project By
**Charaka Kavya**
---

⭐ **If you find this project useful, feel free to explore the SQL file and dataset.**

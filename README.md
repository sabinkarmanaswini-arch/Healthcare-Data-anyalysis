# 🏥 Healthcare Data Analysis using MySQL

## 📌 Project Overview
This project analyzes healthcare data using **MySQL** to extract meaningful insights from patient and medical records. It demonstrates SQL concepts from basic to intermediate level, making it suitable for a Data Analyst portfolio.

## 🎯 Objectives
- Analyze patient demographics and medical records.
- Practice SQL queries from basic to intermediate level.
- Generate business insights using SQL.
- Strengthen SQL skills for Data Analyst interviews.

## 🛠 Tools Used
- MySQL
- MySQL Workbench
- CSV Dataset

## 📂 Dataset

### patients
Stores patient demographic information.

**Columns**
- Patient_ID
- Name
- Age
- Gender
- Blood_Type

### medical_records
Stores hospital and treatment information.

**Columns**
- Patient_ID
- Medical_Condition
- Date_of_Admission
- Doctor
- Hospital
- Insurance_Provider
- Billing_Amount
- Room_Number
- Admission_Type
- Discharge_Date
- Medication
- Test_Results

## 🔗 Database Relationship
- **Primary Key:** Patient_ID (patients)
- **Foreign Key:** Patient_ID (medical_records)

```text
patients
   │
   └── Patient_ID
          │
          ▼
medical_records
```

## 📚 SQL Concepts Covered
- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT
- Aggregate Functions
- GROUP BY
- HAVING
- INNER JOIN
- LEFT JOIN
- CASE
- String Functions
- Date Functions
- Subqueries

## 📊 Business Questions Solved
- Total number of patients
- Average patient age
- Gender distribution
- Blood group distribution
- Hospital-wise patient count
- Average billing by hospital
- Highest billing patient
- Most common medical condition
- Insurance provider analysis
- Top hospitals by total billing
  
## few sql queries
<img width="432" height="667" alt="Screenshot 2026-07-23 224618" src="https://github.com/user-attachments/assets/655c9a01-a880-41a6-a91f-d32bd0797dad" />
<img width="723" height="537" alt="Screenshot 2026-07-23 224742" src="https://github.com/user-attachments/assets/5f594fd8-17e3-4dba-8c76-f33a9dced856" />
<img width="1920" height="1080" alt="Screenshot (4)" src="https://github.com/user-attachments/assets/efbf6dff-1f1e-4660-91f6-018ed39b43e1" />





## 📈 Skills Demonstrated
- SQL Query Writing
- Data Cleaning
- Data Filtering
- Data Aggregation
- Table Joins
- Relational Database Concepts
- Business Data Analysis

## 📁 Repository Structure

```text
Healthcare-Data-Analysis/
├── README.md
├── healthcare_queries.sql
├── patients.csv
├── medical_records.csv
└── database_schema.sql
```

## 📌 Key Learnings
- Writing SQL queries from basic to intermediate level.
- Working with multiple related tables.
- Using joins to combine datasets.
- Applying aggregate functions for analysis.
- Extracting business insights from healthcare data.

## 🔮 Future Improvements
- Build an interactive Power BI dashboard.
- Perform data analysis using Python (Pandas).
- Add advanced SQL using CTEs and Window Functions.
- Create healthcare KPIs and visual reports.

## 👩‍💻 Author
**Manaswini**

Aspiring Data Analyst | Metallurgical & Materials Engineering Student

**Skills:** MySQL • SQL • Excel • Python (Basics) • Power BI (Learning)

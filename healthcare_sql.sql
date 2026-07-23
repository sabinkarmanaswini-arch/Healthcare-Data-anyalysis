ALTER TABLE patients
CHANGE COLUMN `ï»¿Patient_ID` Patient_ID INT;
describe patients;

-- Q1. Display all patient details.
SELECT * FROM patients;
-- Q2. Display all medical records.
SELECT * FROM medical_records;

-- Q3. Display Patient_ID, Name and Gender.
SELECT Patient_ID, Name, Gender
FROM patients;

-- Q4. Display Patient_ID, Medical_Condition and Hospital.
SELECT Patient_ID, Medical_Condition, Hospital
FROM medical_records;

-- Q5. Display all unique blood types.
SELECT DISTINCT Blood_Type
FROM patients_utf8;

-- Q6. Display all unique insurance providers.
SELECT DISTINCT Insurance_Provider
FROM medical_records;

-- Q7. Display the first 10 patients.
SELECT *
FROM patients
LIMIT 10;

-- Q8. Display the first 15 medical records.
SELECT *
FROM medical_records
LIMIT 15;

-- Q9. Display patient names in alphabetical order.
SELECT Name
FROM patients
ORDER BY Name ASC;

-- Q10. Display hospitals in alphabetical order.
SELECT Hospital
FROM medical_records
ORDER BY Hospital ASC;


-- Q11. Display all male patients.
SELECT *
FROM patients
WHERE Gender = 'Male';

-- Q12. Display patients whose age is greater than 50.
SELECT *
FROM patients
WHERE Age > 50;

-- Q13. Display patients whose age is between 30 and 50.
SELECT *FROM patients
WHERE Age BETWEEN 30 AND 50;


-- Q14. Display patients whose blood type is 'O+'.
SELECT *
FROM patients
WHERE Blood_Type = 'O+';

-- Q15. Display patients whose blood type is 'A+' or 'B+'.
SELECT *
FROM patients
WHERE Blood_Type IN ('A+', 'B+');

-- Q16. Display patients whose name starts with 'A'.
SELECT *
FROM patients
WHERE Name LIKE 'A%';

-- Q17. Display patients whose name ends with 'n'.
SELECT *
FROM patients
WHERE Name LIKE '%n';

-- Q18. Display patients whose name contains 'an'.
SELECT *
FROM patients
WHERE Name LIKE '%an%';

-- Q19. Display patients ordered by age in descending order.
SELECT *
FROM patients
ORDER BY Age DESC;

-- Q20. Display the 5 oldest patients.
SELECT *
FROM patients
ORDER BY Age DESC
LIMIT 5;
-- AGGREGATE FUNCTIONS

-- Q21. Count the total number of patients.
SELECT COUNT(*) AS Total_Patients
FROM patients;

-- Q22. Find the average age of patients.
SELECT AVG(Age) AS Average_Age
FROM patients;

-- Q23. Find the youngest patient.
SELECT MIN(Age) AS Youngest_Patient
FROM patients;

-- Q24. Find the oldest patient.
SELECT MAX(Age) AS Oldest_Patient
FROM patients;

-- Q25. Find the total billing amount.
SELECT SUM(Billing_Amount) AS Total_Billing
FROM medical_records;

-- GROUP BY

-- Q26. Count patients by gender.
SELECT Gender, COUNT(*) AS Total_Patients
FROM patients
GROUP BY Gender;

-- Q27. Count patients by blood type.
SELECT Blood_Type, COUNT(*) AS Total_Patients
FROM patients
GROUP BY Blood_Type;

-- Q28. Count patients in each hospital.
SELECT Hospital, COUNT(*) AS Total_Patients
FROM medical_records
GROUP BY Hospital;

-- Q29. Find the average billing amount for each hospital.
SELECT Hospital, AVG(Billing_Amount) AS Average_Billing
FROM medical_records
GROUP BY Hospital;

-- HAVING

-- Q30. Display hospitals having more than 20 patients.
SELECT Hospital, COUNT(*) AS Total_Patients
FROM medical_records
GROUP BY Hospital
HAVING COUNT(*) > 20;
-- JOINS

-- Q31. Display Patient_ID, Name and Medical_Condition.
SELECT p.Patient_ID, p.Name, m.Medical_Condition
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID;

-- Q32. Display Patient Name, Age and Hospital.
SELECT p.Name, p.Age, m.Hospital
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID;

-- Q33. Display Patient Name, Doctor and Medical Condition.
SELECT p.Name, m.Doctor, m.Medical_Condition
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID;

-- Q34. Display female patients with their medical condition.
SELECT p.Name, p.Gender, m.Medical_Condition
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
WHERE p.Gender = 'Female';

-- Q35. Display patients whose billing amount is greater than 30000.
SELECT p.Name, m.Billing_Amount
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
WHERE m.Billing_Amount > 30000;

-- Q36. Display patients sorted by highest billing amount.
SELECT p.Name, m.Billing_Amount
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
ORDER BY m.Billing_Amount DESC;

-- CASE

-- Q37. Categorize patients by age.
SELECT Name,
Age,
CASE
WHEN Age < 18 THEN 'Child'
WHEN Age BETWEEN 18 AND 59 THEN 'Adult'
ELSE 'Senior Citizen'
END AS Age_Group
FROM patients;

-- Q38. Categorize billing amount.
SELECT Patient_ID,
Billing_Amount,
CASE
WHEN Billing_Amount < 15000 THEN 'Low'
WHEN Billing_Amount BETWEEN 15000 AND 30000 THEN 'Medium'
ELSE 'High'
END AS Billing_Category
FROM medical_records;

-- Q39. Display patient name, hospital and billing category.
SELECT p.Name,
m.Hospital,
CASE
WHEN m.Billing_Amount < 15000 THEN 'Low'
WHEN m.Billing_Amount BETWEEN 15000 AND 30000 THEN 'Medium'
ELSE 'High'
END AS Billing_Category
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID;

-- Q40. Display patient name, age and medical condition ordered by age.
SELECT p.Name, p.Age, m.Medical_Condition
FROM patients p
INNER JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
ORDER BY p.Age DESC;
-- SUBQUERIES

-- Q41. Display patients older than the average age.
SELECT *
FROM patients
WHERE Age > (
SELECT AVG(Age)
FROM patients
);

-- Q42. Display patients having the maximum age.
SELECT *
FROM patients
WHERE Age = (
SELECT MAX(Age)
FROM patients
);

-- Q43. Display patients whose billing amount is greater than the average billing amount.
SELECT p.Name, m.Billing_Amount
FROM patients p
JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
WHERE m.Billing_Amount > (
SELECT AVG(Billing_Amount)
FROM medical_records
);

-- Q44. Display the patient with the highest billing amount.
SELECT p.Name, m.Billing_Amount
FROM patients p
JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
WHERE m.Billing_Amount = (
SELECT MAX(Billing_Amount)
FROM medical_records
);

-- STRING FUNCTIONS

-- Q45. Display all patient names in uppercase.
SELECT UPPER(Name) AS Patient_Name
FROM patients;

-- Q46. Display patient names with their name length.
SELECT Name, LENGTH(Name) AS Name_Length
FROM patients;

-- BUSINESS QUESTIONS

-- Q47. Which hospital treated the highest number of patients?
SELECT Hospital, COUNT(*) AS Total_Patients
FROM medical_records
GROUP BY Hospital
ORDER BY Total_Patients DESC
LIMIT 1;

-- Q48. Which medical condition is most common?
SELECT Medical_Condition, COUNT(*) AS Total_Cases
FROM medical_records
GROUP BY Medical_Condition
ORDER BY Total_Cases DESC
LIMIT 1;

-- Q49. Which insurance provider has the highest total billing amount?
SELECT Insurance_Provider,
SUM(Billing_Amount) AS Total_Billing
FROM medical_records
GROUP BY Insurance_Provider
ORDER BY Total_Billing DESC;

-- Q50. Display the Top 10 patients with the highest billing amount.
SELECT p.Name,
m.Hospital,
m.Billing_Amount
FROM patients p
JOIN medical_records m
ON p.Patient_ID = m.Patient_ID
ORDER BY m.Billing_Amount DESC
LIMIT 10;

/*
Week 2: Practice Test for SQL for Data Science by by University of California, Davis

For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a single table titled: salary_range_by_job_classification. This table contains the following columns:

    SetID
    Job_Code
    Eff_Date
    Sal_End_Date
    Salary_setID
    Sal_Plan
    Grade
    Step
    Biweekly_High_Rate
    Biweekly_Low_Rate
    Union_Code
    Extended_Step
    Pay_Type



Q1 Find the distinct values for the extended step. The code has been started for you, but you will need to program the third line yourself before running the query. 
*/

SELECT 
DISTINCT Extended_step -- (Use the Word DISTINCT) 
FROM salary_range_by_job_classification;

/*
Q2 Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add to the last line of code to get the correct answer. 
*/

SELECT 
Biweekly_high_Rate,
MIN(Biweekly_high_Rate) 
FROM salary_range_by_job_classification
WHERE Biweekly_high_Rate <> '$0.00' --(Use the <> to exclude $0.00) 

/*
Q3 What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)? The code has been started for you, but you will need to add to the last line of code to get the correct answer.
*/

SELECT 
MAX(Biweekly_high_Rate) 
FROM salary_range_by_job_classification

/*
Q4 What is the payment type for all the job codes that start with '03'? The code has been started for you, but you will need to program the fourth and fifth lines yourself before running the query.
*/

SELECT
job_code,
pay_type
FROM salary_range_by_job_classification
WHERE job_code LIKE '03%'; -- (Use wild card to find anything that starts with '03')

/*
Q5 Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? The code has been started for you, but you will need to program the third through the sixth lines yourself before running the query. 
*/

SELECT
eff_date,
sal_end_date
FROM salary_range_by_job_classification
WHERE grade = 'Q90H0';  -- (Specify Search using WHERE)

/*
Q6 Sort the Biweekly low rate in ascending order. There is no starter code, as you need to write and run the query on your own. Hint: there are 4 lines to run this query.
*/

SELECT
Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC -- (Sets how to order the info)

/*
Q7 Write and run a query, with no starter code to answer this question: What Steps are Job Codes 0110-0400? Hint: there are 6 lines to run this query.
*/

SELECT
Step,
Job_Code 
FROM salary_range_by_job_classification
WHERE Job_Code BETWEEN '0110' AND '0400'; -- (Use between to narrow a group of info you want)

/*
Q8 Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
*/

SELECT
Biweekly_High_Rate,
Biweekly_Low_Rate,
Biweekly_High_Rate - Biweekly_Low_Rate AS rate_differance, -- (Perform subtraction)
Job_Code 
FROM salary_range_by_job_classification
WHERE Job_Code = '0170'; -- (Limit it to only specific ID) 

/*
Q9 Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 
*/

SELECT
Extended_Step,
Pay_Type
FROM salary_range_by_job_classification
WHERE Pay_Type IN ('M', 'H', 'D'); -- (Use IN to get a list of values we want to find) 

/*
Q10 Write and run a query, with no starter code or hints to answer this question: What is the step for Union Code 990 and a Set ID of SFMTA or COMMN? 
*/

SELECT
Step,
Union_Code,
SetID
FROM salary_range_by_job_classification
WHERE Union_Code = '990' AND (SetID = 'SFMTA' OR SetID = 'COMMN'); -- (Searches for any matches that are either of the SetID and are of unit code 990. The () is important b/c it would otherwise only do perfom the AND on the first setID)

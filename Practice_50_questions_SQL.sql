CREATE TABLE loandata (
    id SERIAL PRIMARY KEY,
    address_state VARCHAR(2),
    application_type VARCHAR(50),
    emp_length VARCHAR(20),
    emp_title VARCHAR(100),
    grade CHAR(1),
    home_ownership VARCHAR(20),
    issue_date DATE,
    last_credit_pull_date DATE,
    last_payment_date DATE,
    loan_status VARCHAR(50),
    next_payment_date DATE,
    member_id INTEGER,
    purpose VARCHAR(50),
    sub_grade VARCHAR(2),
    term VARCHAR(20),
    verification_status VARCHAR(50),
    annual_income NUMERIC(15, 2),
    dti NUMERIC(5, 4),
    installment NUMERIC(10, 2),
    int_rate NUMERIC(5, 4),
    loan_amount NUMERIC(15, 2),
    total_acc INTEGER,
    total_payment NUMERIC(15, 2)
);

#Basic Questions 
1..Retrieve all records from the loandata table.

select * from loandata

2.Count the total number of loan records.

method-1	select Count(*) from loandata

method-2	select Count(*)id from loandata

3.Retrieve loans with a loan_status of 'Fully Paid'.

select * from loandata
where loan_status ='Fully Paid'
   
note-...Find for loan status only 

	select loan_status as status from loandata
where loan_status = 'Fully Paid'

SELECT COUNT(*) AS loan_status
FROM loandata
WHERE loan_status = 'Fully Paid';
	
4.Retrieve loans issued in the state of 'CA'.

SELECT * FROM loandata WHERE address_state = 'CA';

select id ,address_state, loan_status, purpose from loandata
where address_state like 'CA' 

select id ,address_state, loan_status, purpose from loandata
where address_state like 'CA' and loan_status ='Charged Off'
	

5.Retrieve the distinct states from which loans have been issued.

select distinct address_state from loandata	

6.Retrieve loans with an emp_length of '10+ years'.

select * from loandata
where emp_length like '10+ years'

select * from loandata
where emp_length = '10+ years'

### for last 10 data.
	
SELECT * FROM loandata
ORDER BY id DESC
LIMIT 10;


7.Retrieve the first 10 records from the financial_loans table.

select * from loandata
limit 10

### for last 10 data.
	
SELECT * FROM loandata
ORDER BY id DESC
LIMIT 10;

8.Retrieve the records where the int_rate is greater than 0.15.

select id,int_rate from  loandata
where int_rate > '0.15'

#9.Retrieve loans with a term of '36 months'.

SELECT * FROM loandata WHERE term = '36 months';

10.Retrieve the loan_amount and int_rate for loans with a grade of 'A'.

select loan_amount,int_rate,grade from loandata
where grade = 'A'

##Intermediate Questions 
11.Find the average loan_amount for loans in 'CA'.

select avg(loan_amount) from loandata
where address_state ='CA'

12.Find the total loan_amount for loans with home_ownership status 'RENT'.

select sum(loan_amount) from loandata
where home_ownership = 'RENT'
            #OR
select sum(loan_amount) from loandata
where home_ownership like 'RENT'

13.Retrieve loans where the purpose is 'car' and the grade is 'C'.

select * from loandata
where purpose ='car' and grade ='C'

14.Retrieve the maximum loan_amount from the financial_loans table.

select max(loan_amount) from loandata

15.Retrieve the minimum int_rate from the financial_loans table.

select min(int_rate) from loandata

#16.Count the number of loans for each purpose.

select purpose, count(*)  from loandata
group by purpose 

#17.Retrieve the member_id and loan_amount for loans with a dti less than 0.1.

SELECT member_id , loan_amount, dti from loandata
where dti <'0.1'

18.Find the average annual_income for loans with verification_status of 'Verified'.


select avg(annual_income) from loandata
where verification_status ='Verified'

19.Retrieve loans where emp_title contains the word 'Inc'.

select emp_title from loandata
where emp_title like '%Inc%'

??20.Count the number of loans with loan_status 'Charged Off' in each state.

select address_state, count(*) as count  from loandata
where loan_status = 'Charged Off'
group by address_state
order by count desc

Advanced Questions 	
21.Calculate the average int_rate for each grade. average should be in decending order 

select grade, round(avg(int_rate),2) as average_by_grade from loandata
group by grade
order by average_by_grade desc

22.Retrieve the emp_title and annual_income for loans with the highest loan_amount.

select emp_title,annual_income, loan_amount from loandata
order by loan_amount desc
limit 1

23.Retrieve loans where the next_payment_date is after '2021-12-01'.

SELECT * FROM loandata
WHERE next_payment_date > '2021-12-01';

??24.Count the number of loans with term '60 months' and home_ownership 'MORTGAGE'.

SELECT COUNT(*) FROM loandata
WHERE term = '60 months' AND home_ownership = 'MORTGAGE';

25.Find the member_id with the highest total_payment.

select member_id from loandata
order by total_payment desc
limit 1

26.Retrieve the loans with the longest term.

select * from loandata
where term = (select max(term) from loandata)

27.Calculate the total installment amount for all loans issued in 'TX'.

select sum(installment) as installment_amount from loandata 
where address_state ='TX'

28.Find the top 5 emp_titles with the highest average annual_income.

select emp_title,avg(annual_income) as avg_income from loandata
group by emp_title
order by avg_income desc
limit 5

29.Retrieve loans where the issue_date is in the year 2021.

SELECT * FROM loandata
WHERE issue_date BETWEEN '2021-01-01' AND '2021-12-31';

??@@@30.Calculate the percentage of loans with loan_status 'Fully Paid'.

SELECT (COUNT(*) FILTER (WHERE loan_status = 'Fully Paid') * 100.0 / COUNT(*)) AS 
fully_paid_percentage FROM loandata;

31.Find the address_state with the lowest average dti.

select address_state from loandata
group by address_state
order by avg(dti) asc
limit 1

32.Retrieve loans with an annual_income greater than twice the loan_amount.

select * from loandata
where annual_income > 2*(loan_amount)

33.Calculate the average loan_amount for each combination of grade and sub_grade.

select grade,sub_grade , avg(loan_amount) from loandata 
group by grade, sub_grade

34.Find the top 3 states with the highest total loan_amount.

select address_state, sum(loan_amount) as highest_laon_amount from loandata
group by address_state
order by highest_laon_amount desc
limit 3

35.Retrieve the loans with the earliest issue_date.

select * from loandata
order by issue_date asc
limit 1

36.Calculate the difference between total_payment and loan_amount for each loan.

select id, total_payment - loan_amount as Payment_delta from loandata

37.Find the purpose with the highest average installment

select purpose from loandata  
group by purpose 
order by avg(installment) desc
limit 1

##??38.Retrieve loans with loan_amount within 10% of the average loan_amount.

SELECT * FROM loandata
WHERE loan_amount BETWEEN (SELECT AVG(loan_amount) * 0.9 FROM loandata) 
AND (SELECT AVG(loan_amount) * 1.1 FROM loandata);

39.Find the member_id with the most loans.

select member_id, count(*) as loan_count from loandata
group by member_id
order by loan_count desc
limit 1

40.Retrieve the top 10 loans with the highest int_rate.

SELECT * FROM loandata
ORDER BY int_rate
DESC LIMIT 10;

??##41.Calculate the cumulative loan_amount over time ordered by issue_date.

select issue_date, sum(loan_amount) over( order by issue_date) as cumulative_loan_amount
from loandata

##??42.Find the average dti for loans with a grade of 'B' and verification_status 'Source Verified'.

select avg(dti) from loandata
where grade = 'B' and verification_status = 'Source verified'

SELECT AVG(dti) FROM loandata WHERE grade = 'B' AND verification_status = 'Source Verified';

43.Retrieve the loans where the difference between int_rate and the average int_rate is more than 0.05.

select int_rate-avg(int_rate) as diff_delta from loandata
where int_rate >0.05

SELECT * FROM loandata 
WHERE ABS(int_rate - (SELECT AVG(int_rate) FROM loandata)) > 0.05;

44.Find the purpose with the highest loan_amount to annual_income ratio.

select purpose, max(loan_amount/annual_income) as max_ratio from loandata
group by purpose 
order by max_ratio desc
limit 1

45.Calculate the average int_rate for loans grouped by emp_length and home_ownership.

select emp_length,home_ownership, avg(int_rate)  from loandata
group by emp_length,home_ownership

46.Retrieve loans where the next_payment_date is before the last_payment_date.

select * from loandata
where next_payment_date<last_payment_date

47.Find the top 5 emp_titles with the lowest average dti.

select emp_title, avg(dti) as lowest_avg_dti from loandata
group by emp_title
order by lowest_avg_dti
limit 5

??##48.Calculate the median loan_amount for loans with verification_status 'Not Verified'.

SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY loan_amount) AS median_loan_amount FROM loandata
WHERE verification_status = 'Not Verified';

49.Retrieve loans where the installment is more than 5% of the annual_income.

SELECT * FROM loandata
WHERE installment > (0.05 * annual_income);

##50.Find the correlation between loan_amount and int_rate.

select corr(loan_amount,int_rate) as correlation from loandata











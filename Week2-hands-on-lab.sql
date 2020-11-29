-- Query 1: Retrieve all employees whose address is in Elgin,IL
--Hint: Use the LIKE operator to find similar strings
;
select F_NAME , L_NAME
from EMPLOYEES
where ADDRESS LIKE '%Elgin,IL%' ;
--Query 2: Retrieve all employees who were born during the 1970's.
--Hint: Use the LIKE operator to find similar strings
;
select F_NAME , L_NAME
from EMPLOYEES
where B_DATE LIKE '197%' ;

---Query3: Retrieve all employees in department 5 whose salary is between 60000 and 70000 .
--Hint: Use the keyword BETWEEN for this query
;
select *
from EMPLOYEES
where (SALARY BETWEEN 60000 and 70000)  and DEP_ID = 5 ;
--Query4A: Retrieve a list of employees ordered by department ID.
--Hint: Use the ORDER BY clause for this query
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID;
--Query4B: Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically in descending order by last name.
;
select F_NAME, L_NAME, DEP_ID 
from EMPLOYEES
order by DEP_ID desc, L_NAME desc;
--Query5A: For each department ID retrieve the number of employees in the department.
--Hint: Use COUNT(*) to retrieve the total count of a column, and then GROUP BY
;
select DEP_ID, COUNT(*)
from EMPLOYEES
group by DEP_ID;
--Query5B: For each department retrieve the number of employees in the department, and the average employees salary in the department.
--Hint: Use COUNT(*) to retrieve the total count of a column, and AVG() function to compute average salaries, and then group
;
select DEP_ID, COUNT(*), AVG(SALARY)
from EMPLOYEES
group by DEP_ID;
--Query5C: Label the computed columns in the result set of Query 5B as NUM_EMPLOYEES and AVG_SALARY.
--Hint: Use AS “LABEL_NAME” after the column name
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID;
--Query5D:order the result set by Average Salary.
--Hint: Use ORDER BY after the GROUP BY
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;
--Query5E: limit the result to departments with fewer than 4 employees.
--Hint: Use HAVING after the GROUP BY, and use the count() function in the HAVING clause instead of the column label.
;
select DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
having count(*) < 4
order by AVG_SALARY;
--5E alternative: if you want to use the label
select DEP_ID, NUM_EMPLOYEES, AVG_SALARY from
  ( select DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY from EMPLOYEES group by DEP_ID)
  where NUM_EMPLOYEES < 4
order by AVG_SALARY;

--BONUS Query6: : Similar to 4B but instead of department ID use department name. Retrieve a list of employees ordered by department name, and within each department ordered alphabetically in descending order by last name.
;
select D.DEP_NAME , E.F_NAME, E.L_NAME
from EMPLOYEES as E, DEPARTMENTS as D
where E.DEP_ID = D.DEPT_ID_DEP
order by D.DEP_NAME, E.L_NAME desc ;

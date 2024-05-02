
-- 사원의 first_name, employee)id, department_cd
SELECT
    e.employee_id,
    e.first_name,
    department_id,
    d.department_name
FROM employees E
NATURAL JOIN departments D
--ON e.department_id=d.department_id
ORDER BY e.employee_id
;

SELECT
    e.employee_id,
    e.first_name,
    E.department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
ON e.department_id=d.department_id
    AND e.manager_id = d.manager_id
ORDER BY e.employee_id
;

-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    e.employee_id,
    e.last_name,
    D.department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
ON E.manAger_ID = d.manager_id
    AND E.department_id = d.department_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    department_id,
    d.department_name
FROM employees E
NATURAL JOIN departments D
;

-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
USING(department_id)
;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    L.city
FROM employees E
INNER JOIN departments D
ON  e.department_id = d.department_id
JOIN locations L
ON D.location_id = L.LOCATION_ID
;
-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.
SELECT
    e.first_name,
    e.last_name,
    J.job_title
FROM employees E
INNER JOIN jobS J
USING(JOB_ID)
;
-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.
SELECT
    d.department_name,
    MAX(e.salary),
    MIN(E.SALARY)
--    COUNT(D.department_id)
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
GROUP BY d.department_name
;
-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
SELECT
    J.job_title,
    AVG(e.salary)"평균 급여"
FROM employees E
INNER JOIN jobs J
USING(JOB_ID)
GROUP BY J.job_title
ORDER BY "평균 급여" ASC
;
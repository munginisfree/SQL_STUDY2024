
-- 사원의 사번, 이름, 부서번호, 부서명 ㅈ회

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
;
SELECT
    dept_cd,
    dept_nm
FROM tb_dept
;

--JOIN

SELECT
    tb_emp.emp_no,
    tb_emp.emp_nm,
    tb_dept.dept_cd,
    tb_dept.dept_nm
FROM tb_emp, tb_dept
WHERE tb_emp.dept_cd = tb_dept.dept_cd
;

-- 조인 기초 테스트 데이터
CREATE TABLE TEST_A (
    id NUMBER(10) PRIMARY KEY
    , content VARCHAR2(200)
);
CREATE TABLE TEST_B (
    b_id NUMBER(10) PRIMARY KEY
    , reply VARCHAR2(100)
    , a_id NUMBER(10)
);

INSERT INTO TEST_A  VALUES (1, 'aaa');
INSERT INTO TEST_A  VALUES (2, 'bbb');
INSERT INTO TEST_A  VALUES (3, 'ccc');

INSERT INTO TEST_B  VALUES (1, 'ㄱㄱㄱ', 1);
INSERT INTO TEST_B  VALUES (2, 'ㄴㄴㄴ', 1);
INSERT INTO TEST_B  VALUES (3, 'ㄷㄷㄷ', 2);
INSERT INTO TEST_B  VALUES (4, 'ㄹㄹㄹ', 3);

SELECT
    *
FROM test_a
;
SELECT
    *
FROM test_b
;

-- JOIN의 원리는 곱하기 연산
-- Cartesian product: product연산
-- Cross join: 가능한 모든 경우의 수를 매칭하여 조회

--INNER JOIN
--두 테이블 간에 연관 컬럼을 이용하여
--관계가 있는 데이터를 매칭하여 조인
SELECT
    *
FROM test_a, test_b
WHERE test_a.id = test_b.a_id
;

SELECT
    E.emp_no,
    E.emp_nm,
    D.dept_cd,
    D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
;



-- 사원의 사원번호와 사원명과 취득한 자격증명을 조회
SELECT
    E.emp_no,
    E.emp_nm,
    EC.certi_cd,
    EC.acqu_de,
    c.certi_nm
FROM tb_emp E, tb_certi C, tb_emp_certi EC
WHERE 1=1
    AND e.emp_no = ec.emp_no 
    AND c.certi_cd = ec.certi_cd
;

-- 사원의 사원번호와 사원명과 취득한 자격증명을 조회
SELECT
    E.emp_no,
    E.emp_nm,
    E.sex_cd,
    EC.certi_cd,
    C.certi_nm,
    EC.acqu_de,
    d.dept_nm
FROM tb_emp E, tb_emp_certi EC, tb_certi C, tb_dept D
WHERE E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND e.dept_cd = d.dept_cd
    AND d.dept_NM = '개발팀'
;

-- 부서별로 총 자격증 취득 갯수 구하기
SELECT
    d.dept_cd,
    d.dept_nm,
    COUNT(ec.certi_cd)
FROM tb_dept D, tb_emp_certi EC, tb_emp E
WHERE 1=1
    AND e.dept_cd = d.dept_cd
    AND e.emp_no = ec.emp_no
GROUP BY d.dept_cd, d.dept_nm
ORDER BY d.dept_cd
;

--용인시에 사는 사원의 사원번호, 사원명, 주소,
SELECT
    e.emp_no,
    E.EMP_NM,
    e.addr,
    e.dept_cd,
    d.dept_cd,
    d.dept_NM
FROM tb_emp E, tb_dept D
WHERE E.addr LIKE '%용인%'
    AND e.dept_cd = d.dept_cd
    AND e.emp_nm LIKE '김%'
    
;

-- JOIN ON (ANSI 표준 조인)
-- 1. FROM절 뒤, WHERE 절 앞
-- 2. JOIN 키워드 뒤에는 조인할 테이블명을 명시
-- 3. ON 키워드 뒤에는 조인 조건을 명시
-- 4. 조인 조건 서술부(ON절) 일반 조건 서술부 (WHERE절)를 분리해서 작성하는 방법
-- 5. ON절을 이용하면 JOIN 이후의 논리연산이나 서브쿼리와 같은 추가 서술이 가능
SELECT
    e.emp_no,
    E.EMP_NM,
    e.addr,
    e.dept_cd,
    d.dept_cd,
    d.dept_NM
FROM tb_emp E 
INNER JOIN tb_dept D
ON e.dept_cd = d.dept_cd
WHERE E.addr LIKE '%용인%'
    AND e.emp_nm LIKE '김%'
;

SELECT
    E.emp_no,
    E.emp_nm,
    D.dept_nm,
    E.sex_cd,
    EC.certi_cd,
    C.certi_nm,
    EC.acqu_de
FROM tb_emp E 
JOIN tb_emp_certi EC
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
JOIN tb_dept D
ON  E.dept_cd = D.dept_cd
WHERE 1=1
    AND d.dept_cd IN (100004, 100006)
    AND ec.acqu_de >= '20180101'
;

-- 1980년대생 사원들의 사번, 사원명, 부서명, 
-- 자격증명, 취득일자 조회
SELECT
    e.emp_no,
    e.emp_nm,
    e.birth_de,
    d.dept_nm,
    c.certi_nm,
    ec.acqu_de
FROM tb_emp E, tb_dept D, tb_certi C, tb_emp_certi EC
WHERE e.dept_cd = d.dept_cd
    AND e.emp_no = ec.emp_no
    AND c.certi_cd = ec.certi_cd
    AND e.birth_de BETWEEN '19800101' AND '19891231'
;

SELECT
    e.emp_no,
    e.emp_nm,
    e.birth_de,
    d.dept_nm,
    c.certi_nm,
    ec.acqu_de
FROM tb_emp E
INNER JOIN tb_dept D
ON e.dept_cd = d.dept_cd
INNER JOIN tb_emp_certi EC
ON e.emp_no = ec.emp_no
INNER JOIN tb_certi C
ON c.certi_cd = ec.certi_cd
WHERE 1=1
    AND e.birth_de BETWEEN '19800101' AND '19891231'
;

-- INNER 조인은 두 테이블 간에 
-- 연관데이터가 있는 경우에만 사용
-- 어떤 쇼핑몰 회원이 한 건도 주문하지 않은 경우
-- INNER JOIN에서는 해당회원이 조회되지않음

-- SELECT [DISTINCT] { 열이름 .... } 
-- FROM  테이블 또는 뷰 이름
-- JOIN  테이블 또는 뷰 이름
--? ON    조인 조건
--? WHERE 조회 조건
--? GROUP BY  열을 그룹화
--? HAVING    그룹화 조건
--? ORDER BY  정렬할 열 [ASC | DESC];

-- JOIN 조건을 안걸면 CARTESIAN PRODUCT 만들어짐
-- CROSS JOIN
SELECT
*
FROM test_a, test_b
;

SELECT
*
FROM test_a
CROSS JOIN test_b
;

-- # NATURAL JOIN
-- 1. NATURAL JOIN은 동일한 이름을 갖는 컬럼들에 대해 자동으로 조인조건을 생성하는 기법입니다.
-- 2. 즉, 자동으로 2개 이상의 테이블에서 같은 이름을 가진 컬럼을 찾아 INNER조인을 수행합니다.
-- 3. 이 때 조인되는 동일 이름의 컬럼은 데이터 타입이 같아야 하며, 
--   ALIAS나 테이블명을 자동 조인 컬럼 앞에 표기하면 안됩니다.
-- 4. SELECT * 문법을 사용하면, 공통 컬럼은 집합에서 한번만 표기됩니다.
-- 5. 공통 컬럼이 n개 이상이면 조인 조건이 n개로 처리됩니다.
-- 사원 테이블과 부서 테이블을 조인 (사번, 사원명, 부서코드, 부서명)
SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
--ON a.dept_cd = b.dept_cd
;

-- # USING절 조인
-- 1. NATURAL조인에서는 자동으로 이름과 타입이 일치하는 모든 컬럼에 대해
--  조인이 일어나지만 USING을 사용하면 원하는 컬럼에 대해서면 선택적 조인조건을 
--  부여할 수 있습니다.
-- 2. USING절에서도 조인 컬럼에 대해 ALIAS나 테이블명을 표기하시면 안됩니다.
SELECT 
   A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
;

SELECT 
   A.emp_no, A.emp_nm, B.dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
ON A.dept_cd = B.dept_cd
;

SELECT 
   A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
INNER JOIN tb_dept B
USING (dept_cd)
;
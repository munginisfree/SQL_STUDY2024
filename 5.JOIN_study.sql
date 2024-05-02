
-- ����� ���, �̸�, �μ���ȣ, �μ��� ��ȸ

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

-- ���� ���� �׽�Ʈ ������
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

INSERT INTO TEST_B  VALUES (1, '������', 1);
INSERT INTO TEST_B  VALUES (2, '������', 1);
INSERT INTO TEST_B  VALUES (3, '������', 2);
INSERT INTO TEST_B  VALUES (4, '������', 3);

SELECT
    *
FROM test_a
;
SELECT
    *
FROM test_b
;

-- JOIN�� ������ ���ϱ� ����
-- Cartesian product: product����
-- Cross join: ������ ��� ����� ���� ��Ī�Ͽ� ��ȸ

--INNER JOIN
--�� ���̺� ���� ���� �÷��� �̿��Ͽ�
--���谡 �ִ� �����͸� ��Ī�Ͽ� ����
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



-- ����� �����ȣ�� ������ ����� �ڰ������� ��ȸ
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

-- ����� �����ȣ�� ������ ����� �ڰ������� ��ȸ
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
    AND d.dept_NM = '������'
;

-- �μ����� �� �ڰ��� ��� ���� ���ϱ�
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

--���νÿ� ��� ����� �����ȣ, �����, �ּ�,
SELECT
    e.emp_no,
    E.EMP_NM,
    e.addr,
    e.dept_cd,
    d.dept_cd,
    d.dept_NM
FROM tb_emp E, tb_dept D
WHERE E.addr LIKE '%����%'
    AND e.dept_cd = d.dept_cd
    AND e.emp_nm LIKE '��%'
    
;

-- JOIN ON (ANSI ǥ�� ����)
-- 1. FROM�� ��, WHERE �� ��
-- 2. JOIN Ű���� �ڿ��� ������ ���̺���� ���
-- 3. ON Ű���� �ڿ��� ���� ������ ���
-- 4. ���� ���� ������(ON��) �Ϲ� ���� ������ (WHERE��)�� �и��ؼ� �ۼ��ϴ� ���
-- 5. ON���� �̿��ϸ� JOIN ������ �������̳� ���������� ���� �߰� ������ ����
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
WHERE E.addr LIKE '%����%'
    AND e.emp_nm LIKE '��%'
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

-- 1980���� ������� ���, �����, �μ���, 
-- �ڰ�����, ������� ��ȸ
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

-- INNER ������ �� ���̺� ���� 
-- ���������Ͱ� �ִ� ��쿡�� ���
-- � ���θ� ȸ���� �� �ǵ� �ֹ����� ���� ���
-- INNER JOIN������ �ش�ȸ���� ��ȸ��������

-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
--? ON    ���� ����
--? WHERE ��ȸ ����
--? GROUP BY  ���� �׷�ȭ
--? HAVING    �׷�ȭ ����
--? ORDER BY  ������ �� [ASC | DESC];

-- JOIN ������ �Ȱɸ� CARTESIAN PRODUCT �������
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
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, 
--   ALIAS�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷��� ���տ��� �ѹ��� ǥ��˴ϴ�.
-- 5. ���� �÷��� n�� �̻��̸� ���� ������ n���� ó���˴ϴ�.
-- ��� ���̺�� �μ� ���̺��� ���� (���, �����, �μ��ڵ�, �μ���)
SELECT 
    A.emp_no, A.emp_nm, dept_cd, B.dept_nm
FROM tb_emp A
NATURAL JOIN tb_dept B
--ON a.dept_cd = b.dept_cd
;

-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ����
--  ������ �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���������� 
--  �ο��� �� �ֽ��ϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.
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
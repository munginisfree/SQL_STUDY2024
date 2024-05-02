CREATE TABLE goods(
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    reg_date DATE
);

--INSERT
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (1, 'fan', 120000, SYSDATE);


INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (2, 'washer', 220000, SYSDATE);
    
INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (3, 'dryer',300000,SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES
    (4, 'cookies');
    
INSERT INTO goods
    (goods_name, id, reg_date, price)
VALUES
    ('eggs', 5, SYSDATE, '49000');
    
-- column �� ������ ���̺��� ������� �ڵ� ����
INSERT INTO goods
    
VALUES
    (6, 'fridge', 1000000, SYSDATE);


-- UPDATE

UPDATE goods
SET goods_name = 'AC'
WHERE id = 1
;
UPDATE goods
SET price = 9999;

UPDATE goods
SET id = 11
WHERE id = 4;

UPDATE goods
SET price = NULL
WHERE id = 3;

UPDATE goods
SET goods_name = 'JENAS',
    price = 299000
WHERE price >= 1000;

--DELETE A ROW
DELETE FROM goods
WHERE id = 11;

-- ���� ���� DELETE�ϸ� ��ü ���� ��
-- �ٸ� �� ������ ������ �����ϴ�
DELETE FROM goods;
TRUNCATE TABLE goods; -- UNABLE TO RESTORE
DROP TABLE goods; -- MOST DANGER

SELECT * FROM goods;

-- SELECT BASIC
SELECT
    certi_cd, certi_nm,issue_insti_nm
FROM tb_certi;

SELECT
    certi_nm,issue_insti_nm
FROM tb_certi;

SELECT DISTINCT
    issue_insti_nm
FROM tb_certi;

--��� COLUMN ��ȸ
SELECT
    *
FROM tb_certi;
    
-- COLUMN ��Ī �ο�
SELECT 
    emp_nm AS "�����",
    addr AS "�ּ�"
FROM tb_emp
;
SELECT 
    emp_nm �����,
    addr "������ �ּ�"
FROM tb_emp
;

--���ڿ� �����ϱ�
SELECT 
    'CERTIFICATION: ' || certi_nm AS "CERTI INFO"
FROM tb_certi;

SELECT 
    certi_nm || ' (' || issue_insti_nm || ')' AS "CERTIFICATION"
FROM tb_certi;

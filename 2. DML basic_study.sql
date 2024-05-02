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
    
-- column 명 생략시 테이블구조 순서대로 자동 삽입
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

-- 조건 없이 DELETE하면 전체 삭제 됨
-- 다만 이 문법은 복구가 가능하다
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

--모든 COLUMN 조회
SELECT
    *
FROM tb_certi;
    
-- COLUMN 별칭 부여
SELECT 
    emp_nm AS "사원명",
    addr AS "주소"
FROM tb_emp
;
SELECT 
    emp_nm 사원명,
    addr "거주지 주소"
FROM tb_emp
;

--문자열 결합하기
SELECT 
    'CERTIFICATION: ' || certi_nm AS "CERTI INFO"
FROM tb_certi;

SELECT 
    certi_nm || ' (' || issue_insti_nm || ')' AS "CERTIFICATION"
FROM tb_certi;

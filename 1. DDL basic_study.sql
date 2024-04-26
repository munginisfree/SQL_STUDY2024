
select * from tb_emp;

--테이블생성 (DDL: 데이터 정의어)
--학생들의 성적정보를 저장할 데이터 구조
CREATE TABLE tbl_score(
    name VARCHAR2(4) NOT NULL,
    kor NUMBER(3) NOT NULL CHECK(kor>=0 AND kor <= 100),
    eng NUMBER(3) NOT NULL CHECK(eng>=0 AND eng <= 100),
    math NUMBER(3) NOT NULL CHECK(math>=0 AND math <= 100),
    total NUMBER(3) NULL, CHECK(total >=0 AND total <= 300),
    average NUMBER(5,2),
    grade CHAR(1),
    stu_num NUMBER(6) PRIMARY KEY
);

-- ALTER STATEMENT, ADD CONSTRAINT
-- stu_num FORGOT TO ADD primarykey
ALTER TABLE tbl_SOCRE
ADD CONSTRAINT pk_tbl_score
PRIMARY KEY(stu_num);

-- REMOVE PK
ALTER TABLE tbl_score
DROP CONSTRAINT pk_tbl_score;

select * from tbl_score;

-- 컬럼 추가하기
ALTER TABLE tbl_score
ADD (sci NUMBER(3) NOT NULL);

-- 컬럼 제거하기
ALTER TABLE tbl_score
DROP COLUMN sci;


--DROP : REMOVE TALBE, HARD REMOVE
-- COPY TABLE(CTAS)
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

DROP TABLE tb_emp_copy;

SELECT * FROM tb_emp_copy;

--TRUNCATE: REMAIN STRUCTURE AND ONLY REMOVE THE DATA
-- GO BACK TO INITIAL STATUS
-- DANGER!!
TRUNCATE TABLE tb_emp_copy;

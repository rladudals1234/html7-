--2025.11.24 - 23일차 수업내용
SELECT * FROM jobs WHERE job_title LIKE 'P%';

SELECT * FROM jobs WHERE job_title LIKE concat('P','%');

drop user c##user1;

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

--ora_user2 생성을 하고, 권한을 부여하시오.
CREATE USER ora_user2 IDENTIFIED BY 1111;

GRANT CONNECT, resource, dba TO ora_user2;

--테이블 생성(DDL)
CREATE TABLE MEMBER(
	id varchar2(100) PRIMARY key,
	pw varchar2(100),
	name varchar2(50)
);
COMMENT ON COLUMN member.ID IS '아이디';
COMMENT ON COLUMN member.PW IS '비밀번호';
COMMENT ON COLUMN member.NAME IS '이름';


DELETE FROM member WHERE ID='bbb';
DELETE FROM member WHERE ID='ccc';
DELETE FROM member WHERE ID='ddd';
DELETE FROM member WHERE ID='eee';
DELETE FROM member WHERE ID='aaa';

--DML
INSERT INTO MEMBER(id, pw, name)values('aaa','1111','홍길동');

-- bbb, 2222, 유관순
-- ccc, 3333, 이순신
-- ddd, 4444, 김구
-- eee, 5555, 강감찬
INSERT INTO MEMBER(ID, PW, NAME)VALUES('bbb', '2222', '유관순');
INSERT INTO MEMBER(ID, PW, NAME)VALUES('ccc', '3333', '이순신');
INSERT INTO MEMBER(ID, PW, NAME)VALUES('ddd', '4444', '김구');
INSERT INTO MEMBER(ID, PW, NAME)VALUES('eee', '5555', '강감찬');

--테이블의 타입 확인
desc member; --dbeaver에서 안됨

--테이블의 데이터 검색 - select
SELECT id,pw,name,sysdate,'1' AS test FROM MEMBER;

-- 테이블의 데이터 수정
UPDATE MEMBER SET pw='7777' WHERE id = 'aaa';

SELECT SYSDATE FROM DUAL;

insert into member values('fff','6666','김유신'); 

insert into member values('ggg','7777','홍길동');
insert into member values('hhh','8888','홍길순');

DELETE FROM member WHERE ID='hhh';
DELETE FROM member WHERE ID='ggg';

--트렌젝션 DCL
SAVEPOINT p1;

ROLLBACK TO SAVEPOINT p1;

--2025.11.25 - 24일차 수업내용
SELECT * FROM MEMBER;

DELETE MEMBER WHERE id='aaa';

DELETE MEMBER;


DROP TABLE MEMBER;

-- select-검색, insert-추가, update-수정, delete-삭제
-- commit, rollback을 해야 임시저장에서 실제저장이 됨.

SELECT *, SUM(),AVG() FROM MEMBER WHERE id='aaa' GROUP BY id, name;

DROP TABLE student;

CREATE TABLE student(
	sno NUMBER(4) PRIMARY KEY,
	name varchar2(25),
	kor NUMBER(3),
	eng NUMBER(3),
	math NUMBER(3),
	total NUMBER(3),
	avg NUMBER(5,2),
	description clob
);

COMMENT ON COLUMN ORA_USER.STUDENT.SNO IS '번호';
COMMENT ON COLUMN ORA_USER.STUDENT.NAME IS '이름';
COMMENT ON COLUMN ORA_USER.STUDENT.KOR IS '국어';
COMMENT ON COLUMN ORA_USER.STUDENT.ENG IS '영어';
COMMENT ON COLUMN ORA_USER.STUDENT.MATH IS '수학';
COMMENT ON COLUMN ORA_USER.STUDENT.total IS '합계';
COMMENT ON COLUMN ORA_USER.STUDENT.AVG IS '평균';
COMMENT ON COLUMN ORA_USER.STUDENT.DESCRIPTION IS '비고';

SELECT sno,name,kor,eng,math
		,(kor + eng + math) AS total			-- 총합
		,ROUND((kor + eng + math) / 3, 2) AS avg	--평균
		,description AS desc1
		FROM student;
		
SELECT sum(1,2,3) FROM dual GROUP BY ;

--c## 접두어를 붙이지 않고 사용자를 생성
ALTER SESSION SET "_oracle_script"=TRUE;

SELECT ROUND((90 + 100 + 100) / 3, 2) FROM dual;

INSERT INTO student(sno, name,kor,eng,math,total,avg,description)
values(1,'홍길동',100,100,100,(100+100+100),ROUND((100 + 100 + 100)/3,2),'test');

--select, insert, update, delete
--commit, rollback
INSERT INTO student(sno, name,kor,eng,math,total,avg,description)
values(2,'유관순',90,90,90,(90+90+90),((90 + 90 + 90)/3),'test');

UPDATE student SET kor=70
,eng=80
,total=(70+80+(SELECT math FROM STUDENT WHERE sno = 2))
,avg=ROUND((70 + 80 + (SELECT math FROM STUDENT WHERE sno = 2))/3,2)
WHERE sno = 2;
--서브쿼리로 조회할 필요없이 다른테이블이 아니면 아래처럼 math조회 가능

UPDATE STUDENT
SET kor = 70
,eng = 80
,total = (70 + 80 + math) -- math의 현재 값을 직접 참조
,avg = ROUND((70 + 80 + math) / 3, 2) -- math의 현재 값을 직접 참조
WHERE sno = 2;


--orm(jpa,..등)로 자동 쿼리 생성가능 -> 속도가 ram에 띄워서 일반적으로 빠르지만
-- 일부 데이터 많거나 쿼리 자동생성때문에 쿼리속도가 느려서 쿼리튜닝하기 힘듬
--(jpa도 쿼리 직접 조작 가능하지만 제한적(DB변경가능때문에 일부 공용적이 아닌건 사용불가) 또는 native쿼리?사용 대신 DB변경 용이)

--조건없이 삭제하면 전체삭제되므로 주의
DELETE FROM STUDENT WHERE sno=1;
DELETE FROM STUDENT WHERE sno=2;

select * from tab;

--테이블에 컬럼추가
ALTER TABLE student ADD sdate DATE;
COMMENT ON COLUMN ORA_USER.STUDENT.SDATE IS '날짜';

--테이블에 컬럼삭제
ALTER TABLE STUDENT DROP COLUMN sdate;

--컬럼수정
ALTER TABLE student MODIFY name varchar2(1000);
ALTER TABLE student MODIFY name varchar2(90);
ALTER TABLE student MODIFY name varchar2(5);	--등록된 데이터 크기 아래로 변경불가

UPDATE student SET sdate=sysdate;

SELECT * FROM STUDENT;

UPDATE student SET sdate='2025-01-01' WHERE sno = 1;

select * FROM employees;

select DISTINCT(MANAGER_ID) FROM employees;

SELECT DISTINCT(MANAGER_ID) FROM employees ORDER BY MANAGER_ID asc;

-- 사원번호, 사원이름, 부서번호를 출력하시오.
SELECT MANAGER_ID, EMP_NAME, DEPARTMENT_ID FROM EMPLOYEES
--student
SELECT * FROM student;

-- 홍길동 -> 홍길순
-- 날짜를 모두 2025-10-10 변경
--3번 학생 삭제
--4, 김구, 70,70,70,210,70입력

UPDATE STUDENT SET NAME = '홍길순' WHERE sno=1 AND name='홍길동';	--sno만 있어도 됨(이름은 중복상관없을경우)
UPDATE STUDENT SET SDATE = '2025-10-10';
DELETE FROM student WHERE sno = 3;
INSERT INTO STUDENT (sno,name,kor,eng,math,total,avg,sdate)
values(4,'김구',70,70,70,210,70,sysdate);

--타입이 number인 경우 +,-,*,/가능
--연산자 : 산술연산자 +,-,*,/
SELECT sdate,sdate+100 FROM student;	--100일후(+,-가능)

UPDATE STUDENT SET kor = 90 WHERE sno=1;	--1차
UPDATE STUDENT SET total = kor+eng+math
,avg=(kor+eng+math)/3 WHERE sno=1;			--2차
--kor을 90으로 변경 후 가져와야 바뀜 한번에 set에서 변경하려고 하면 이전데이터를 total이나 avg계산됨

SELECT * FROM EMPLOYEES;
--월급(달러) * 1474(환율로 곱해짐)
--별칭 기존컬럼명 as 변경컬럼명
SELECT EMP_NAME, salary, salary*1474 AS k_salary, salary*1474*12 AS year_k_salary FROM EMPLOYEES;

--테이블 복사 : 데이터까지 복사
CREATE TABLE student2 AS SELECT * FROM student;	--테이블을 생성하는 동시에 데이터가져오기

--테이블 복사(테이블구조만 복사)
CREATE TABLE student3 AS SELECT * FROM student WHERE 1=2;	--1과2가 같은것만

ALTER TABLE STUDENT3 DROP COLUMN total;
ALTER TABLE STUDENT3 DROP COLUMN avg;

-- student3, student컬럼개수가 다른 경우
INSERT INTO STUDENT3 (sno,name,kor,eng,math,sdate)
SELECT sno,name,kor,eng,math,sdate FROM STUDENT;

INSERT INTO student2 SELECT * FROM student;	--pk없어서 데이터 추가로 넣기 가능

ALTER TABLE student3 ADD total number(3);
ALTER TABLE student3 ADD avg number(5,2);

--student에 있는 total,avg 데이터를 student3에 추가
UPDATE STUDENT3 SET TOTAL = (SELECT TOTAL FROM STUDENT WHERE SNO = STUDENT3.sno)
,avg = (SELECT avg FROM STUDENT WHERE SNO = STUDENT3.sno)

UPDATE STUDENT3 SET TOTAL = (kor+eng+math), avg=(kor+eng+math)/3;

--null값에 +,-,*,/ null값으로 변경됨.
--null값을 대체 nvl(컬럼명,0) => 0으로 대체
SELECT emp_name
		,salary
		,nvl(commission_pct,0) AS commission_pct
		,SALARY+(SALARY * nvl(COMMISSION_PCT,0)) AS "월급" 
FROM employees
--WHERE COMMISSION_PCT IS NOT null;


SELECT commission_pct FROM EMPLOYEES;

--실제연봉을 출력하시오.
SELECT (SALARY+(SALARY * nvl(COMMISSION_PCT,0)))*12 AS "연봉" FROM EMPLOYEES;

SELECT * FROM EMPLOYEES;
-- 부서번호 department_id 출력
SELECT DISTINCT(department_id) FROM employees;

-- job_id 직급 중복제거하여 출력하시오.
SELECT DISTINCT(job_id) FROM EMPLOYEES;

SELECT * FROM jobs;

--mem테이블 - 날짜가 포함, 
CREATE TABLE mem(
	pkid varchar2(25) PRIMARY key,	--회원가입후 회원정보에서 아이디 변경가능한 경우 pk값(날짜+랜덤값+인덱스)
	id varchar2(16),	--아이디
	name varchar2(25),	--이름
	pw varchar2(20),	--비번
	email varchar2(50),	--이메일
	email_yn char(1),		--이메일 수신여부
	address varchar2(100),	--주소
	phone varchar2(11),	--휴대폰번호
	tel	varchar2(11),	--유선전화
	birth DATE,			--생년월일
	emp_mem_yn char(1),	--기업회원
	del_yn char(1)		--삭제여부(delete쿼리 대신 update로 조회할때 삭제여부n으로 조회)
);


CREATE TABLE mem(
	id varchar2(100),	--아이디
	name varchar2(2100),	--이름
	pw varchar2(100),	--비번
	email varchar2(50),	--이메일
	email_check number(1),	--이메일 수신여부
	zonecode number(5),		--주소(우편번호)
	address varchar2(100),	--상세주소
	phone char(13),	--휴대폰번호
	phone_check number(1)	--휴대폰 수신여부(sms서비스)
	tel	char(13),	--유선전화
	birth DATE,			--생년월일
	birth_check number(1)	--생년월일 (양력, 음력)
	business number(1),	--기업회원여부
);

create table zmember (
 id varchar2(100),
 pw varchar2(100),
 name varchar2(100),
 email varchar2(50),
 email_check number(1),
 zonecode number(5),
 address varchar2(100),
 phone char(13),
 phone_check number(1),
 tel char(13),
 birth date,
 birth_check number(1),
 business number(1)
);
ALTER TABLE ZMEMBER MODIFY zonecode char(5);

INSERT INTO zmember values('aaa','1111','홍길동','aaa@naver.com',1,00000,'서울 강남구','010-1111-1111',0,'02-1111-1111','2000-01-01',1,0);

SELECT * FROM ZMEMBER;

CREATE TABLE seoul_stu(
	stuno char(5),		--s0001
	name varchar2(100),
	birth DATE,
	
	grade number(1),	--1개일때 검색이 어려움
	grade_no number(2),	--학번
	class_no number(3),	--반번호
	
	grade2 number(1),	--1개일때 검색이 어려움
	grade_no2 number(2),	--학번
	class_no2 number(3),	--반번호
	
	grade3 number(1),	--1개일때 검색이 어려움
	grade_no3 number(2),	--학번
	class_no3 number(3),	--반번호
	
	phone char(13),
	address varchar2(50),
	enroll_date DATE,
	write_date date
);

INSERT INTO seoul_stu values(
's0001','홍길동','2000-01-01',1,1,1,0,0,0,0,0,0,'010-1111-1111','서울',sysdate,sysdate
);

UPDATE seoul_stu SET grade=2,grade_no=2,class_no=2 WHERE stuno='s0001';

SELECT * FROM seoul_stu;

DROP TABLE seoul_stu;

CREATE TABLE uni_stu(
	stuno char(5),
	name varchar2(100),
	major_code varchar2(100),	--FK(외래키 지정은 잘안함)
	major_name varchar2(100),
	major_date DATE,
	college varchar2(100)
);

INSERT INTO uni_stu values(
's0001','홍길동','com','컴퓨터공학','2000-01-01','공과대학'
);
INSERT INTO uni_stu values(
's0002','유관순','com','컴퓨터공학','2000-01-01','공과대학'
);
INSERT INTO uni_stu values(
's0003','이순신','com','컴퓨터공학','2000-01-01','공과대학'
);
INSERT INTO uni_stu values(
's0004','강감찬','com','컴퓨터공학','2000-01-01','공과대학'
);
INSERT INTO uni_stu values(
's0005','김구','com','컴퓨터공학','2000-01-01','공과대학'
);
INSERT INTO uni_stu values(
's0006','김유신','math','수학과','2002-02-02','인문대학'
);

SELECT * FROM uni_stu;

CREATE TABLE major_collect(
	major_code varchar2(100),	--pk
	major_name varchar2(100),
	major_date DATE,
	college varchar2(100)
);

INSERT INTO major_collect values(
'com','컴퓨터공학','2000-01-01','공과대학'
);
INSERT INTO major_collect values(
'math','수학과','2002-02-02','인문대학'
);

ALTER TABLE uni_stu DROP COLUMN major_name;
ALTER TABLE uni_stu DROP COLUMN major_date;
ALTER TABLE uni_stu DROP COLUMN college;

SELECT a.stuno, a.name, a.major_code, 
b.major_name ,b.major_date ,b.college
FROM uni_stu a, major_collect b
WHERE a.major_code = b.major_code;

SELECT a.stuno, a.name, a.major_code, 
b.major_name ,b.major_date ,b.college
FROM uni_stu a
INNER JOIN major_collect b ON a.major_code = b.major_code;

CREATE TABLE seoul_grade(
	stuno char(5),
	grade number(1),	--1개일때 검색이 어려움
	grade_no number(2),	--학번
	class_no number(3)	--반번호
);

INSERT INTO seoul_grade values(
's0001',1,1,1
);

INSERT INTO seoul_grade values(
's0002',2,2,2
);

INSERT INTO seoul_grade values(
's0003',3,3,3
);

SELECT * FROM seoul_grade;

SELECT * FROM seoul_stu;

DROP TABLE seoul_stu;

CREATE TABLE seoul_stu(
	stuno char(5),		--s0001
	name varchar2(100),
	birth DATE,
	phone char(13),
	address varchar2(50),
	enroll_date DATE,
	write_date date
);

INSERT INTO seoul_stu values(
's0001','홍길동','2000-01-01','010-1111-1111','서울',sysdate,sysdate
);

SELECT * FROM seoul_stu a
INNER JOIN seoul_grade b ON a.stuno=b.stuno;

--중복되는건 제거 grade1,grade2,grade3

SELECT 
	a.stuno ,a.name ,a.birth ,a.phone,
	a.address,a.enroll_DATE,a.write_date 
	,b.grade,b.grade_no,b.class_no
FROM SEOUL_STU a, SEOUL_GRADE b

--where절 : 조건절 !=,<>,>=,<=,>,<, and ,or
--where컬럼 연산자 비교값
SELECT * FROM EMPLOYEES WHERE department_id = 30 or DEPARTMENT_ID = 50;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID in(30,50);
SELECT * FROM EMPLOYEES WHERE department_id = 30 AND MANAGER_ID = 100;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID <> 30;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID > 30;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID < 30;

-- 월급이 5000이상인 사원을 출력하시오.
SELECT * FROM EMPLOYEES WHERE SALARY >= 5000;
SELECT * FROM EMPLOYEES WHERE SALARY = 6000;
SELECT * FROM EMPLOYEES WHERE SALARY IN(5000,6000,7000);	--or로 해도 됨.

SELECT SALARY,SALARY*12 FROM EMPLOYEES
WHERE SALARY*12 >= 150000;

SELECT * FROM EMPLOYEES WHERE SALARY NOT IN(5000,6000,7000);

SELECT EMPLOYEE_ID, EMP_NAME, SALARY FROM EMPLOYEES WHERE SALARY <= 4000;

--입사일 날짜 >,<,<=,>=,=,!=
SELECT hire_date FROM EMPLOYEES WHERE HIRE_DATE >= '2005-01-01'

SELECT hire_date FROM EMPLOYEES WHERE hire_date >= '2007-06-01';

BETWEEN a AND b	--BETWEEN이 속도에서 유리 distict 중복제거는 속도에서 불리하니 

-- > or <
SELECT salary FROM employees WHERE SALARY < 7000 or SALARY > 7500;

--2005/01/01 ~ 2007/12/31 사이 입사한 사원의 사원번호, 사원이름, 부서번호, 입사일
SELECT EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE >= '2005/01/01' AND HIRE_DATE <= '2007/12/31';
SELECT EMPLOYEE_ID, EMP_NAME, DEPARTMENT_ID, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '2005/01/01' AND '2007/12/31';

--상품관리 테이블 작성하시오.
CREATE TABLE PRODUCTS_B (
    PRODUCT_ID          NUMBER(10)      NOT NULL,      -- 상품 고유 식별자 (PK)
    PRODUCT_NUM         VARCHAR2(50)    NOT NULL,      -- 상품 코드/번호 (비즈니스 키)
    STATUS              VARCHAR2(10)    DEFAULT 'ACTIVE' NOT NULL, -- 상품 상태 (예: ACTIVE, INACTIVE, OBSOLETE)
    CATEGORY_ID         NUMBER(10),                    -- 카테고리 ID (FK로 사용될 수 있음)
    UNIT_PRICE          NUMBER(10, 2)   DEFAULT 0 NOT NULL, -- 판매 가격
    DESCRIPTION         VARCHAR2(255),                 -- 상품 요약 설명
    
    -- 감사 로그 (Audit Columns)
    CREATION_DATE       DATE            DEFAULT SYSDATE NOT NULL, -- 생성 일자
    CREATED_BY          VARCHAR2(100)   NOT NULL,      -- 생성자
    LAST_UPDATE_DATE    DATE            DEFAULT SYSDATE NOT NULL, -- 최종 수정 일자
    LAST_UPDATED_BY     VARCHAR2(100)   NOT NULL,      -- 최종 수정자
    
    -- 기본 키 제약 조건 정의
    CONSTRAINT PK_PRODUCTS_B PRIMARY KEY (PRODUCT_ID)
);

--트리거 프로시저로 생성

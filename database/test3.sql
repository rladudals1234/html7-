--2025.11.27 - 26일차 수업내용

SELECT * FROM board;

SELECT * FROM employees;

SELECT sysdate -1 FROM dual;	--하루전

--날짜 함수 +,-가능

SELECT bdate FROM BOARD 
WHERE bdate > '2025/11/01';

SELECT concat(btitle,bcontent) FROM board;
SELECT btitle||bcontent FROM board;

SELECT id||','||pw||','||name AS tel FROM MEMBER;

--입사일 - 입사일 가장 오래 근무한 사원순으로 출력하시오.
SELECT * FROM employees;

SELECT sysdate-hire_date AS hdate FROM employees
ORDER BY hdate desc;

-- board 현재 게시글 날짜가 얼마나 지났는지 출력하시오.
-- 소수점 2자리에서 반올림하시오.
SELECT round(sysdate-bdate,2) FROM board;

SELECT trunc(sysdate-bdate,4) FROM board;

SELECT * FROM MEMBER;

SELECT * FROM board;

SELECT * FROM stuscore ORDER BY sno desc;

SELECT to_char(sdate,'yyyy-mm-dd hh24:mi:ss') FROM stuscore;

INSERT INTO stuscore values(
stuscore_seq.nextval, '이순신', 80, 81, 88, 80+81+88,(80+81+88)/3, sysdate
);

-- 날짜함수 시간,오전오후 출력
select to_char(sdate,'yyyy-mm-dd am hh:mi:ss') from stuscore order by sno desc;

--round : 반올림 / month - 15일 이전 1, 15일 이후는 1개월 추가
SELECT hire_date, round(hire_date,'month') AS hire_date_mon FROM employees;
--trunc : 버림 /month기준으로 1일로 변경
SELECT hire_date, trunc(hire_date,'month') AS hire_date_mon FROM employees;
--요일 기준 : 반올림 // 수요일 기준 이전 이전일요일, 수요일기준 이후 이후 일요일
SELECT hire_date, round(hire_date,'day') AS hire_date_day FROM employees;
select bdate,round(bdate,'day') AS bdate_day FROM board;

--board 테이블에서 입력한 게시글 기준 그달 1일을 출력하시오.
SELECT bdate, trunc(bdate,'month') AS bdate_mon FROM board;

--가입한 회원 9월달 생일자를 검색해서 생일쿠폰을 제공하시오.
--SELECT * FROM MEMBER WHERE TO_CHAR(birth, 'MM') = '09';	--컬럼없음
--SELECT * FROM board WHERE TO_CHAR(bdate, 'MM') = '09';
--생일쿠폰 9개월 기준으로 차이(가입일로부터)
/*SELECT sysdate, sdate, trunc(months_between(sysdate,sdate))||'개월' FROM STUSCORE
WHERE MONTHS_BETWEEN(sysdate-1,sdate) = 9;*/
--게시글 2024-12-01~2025-05-31까지 게시글을 출력하시오.
select bdate FROM board
WHERE bdate BETWEEN '2024-12-01' AND '2025-05-31'
ORDER BY bdate desc;

--월을 기준으로 삭제하시오.(delete 아님)
select bdate, trunc(bdate,'month') FROM board
WHERE bdate BETWEEN '2024-12-01' AND '2025-05-31'
ORDER BY bdate desc;

SELECT bdate,to_char(bdate,'yyyy-mm-dd hh:mi:ss') FROM board;
SELECT bdate,trunc(bdate,'month') FROM board;
SELECT bdate,trunc(bdate,'mm') FROM board;
SELECT bdate,trunc(bdate,'yyyy') FROM board;

--round hh-> 30분이상이면 시간+1, 30분미만이면 분만 제거

--member테이블
--months_between 두 컬럼의 개월수를 확인
SELECT sdate FROM stuscore;
SELECT sysdate, sdate, months_between(sysdate,sdate) FROM STUSCORE;	--오늘날짜와 월 간격(몇달 차이인지)
SELECT sysdate, sdate, trunc(months_between(sysdate,sdate))||'개월' FROM STUSCORE;

--1개월차이
SELECT sysdate, sdate, trunc(months_between(sysdate,sdate))||'개월' FROM STUSCORE
WHERE MONTHS_BETWEEN(sysdate,sdate) <= 1;

--생일쿠폰 9개월 기준으로 차이(가입일로부터 9개월 지난 회원)
SELECT sysdate, sdate, trunc(months_between(sysdate,sdate))||'개월' FROM STUSCORE
WHERE MONTHS_BETWEEN(sysdate-1,sdate) = 9;

--add_month : 특정개월수를 더한 날짜확인
SELECT sysdate, sdate, ADD_MONTHS(sdate,6) AS "6개월후날짜"  FROM stuscore;

--문자열 함수
--length
--lengthb 한글은 3바이트, 영문은 1바이트
SELECT name, length(name), LENGTHB(name) AS 바이트수 FROM stuscore;

--substr : 문자자르기(컬럼명, 시작위치,개수)
SELECT name, substr(name,0,2) FROM stuscore;

-- s1423, s2798 -> 숫자의 합을 구하시오. (인덱스 1부터)
SELECT substr('s1423',2,4),substr('s2798',2,4) FROM dual;
SELECT (to_number(substr('s1423',2,4))+to_number(substr('s2798',2,4))) AS sum FROM dual;
SELECT id||pw, concat(id,pw) FROM MEMBER;

--instr함수 : 문자 위치 확인
SELECT name FROM MEMBER;
--ni가 포함되어 있는 이름을 출력하시오.
SELECT name FROM MEMBER WHERE name LIKE '%'||'ni'||'%';
SELECT name FROM MEMBER WHERE name LIKE concat('%'||'ni','%');

-- !=, <>, ^= : not
SELECT name,instr(name,'n') FROM MEMBER;

--trim() : 공백제거 ltrim(왼쪽), rtrim(오른쪽)
SELECT '   abc ' FROM dual;
SELECT ltrim('   abc ') FROM dual;
SELECT rtrim('   abc ') FROM dual;
SELECT trim('   abc ') FROM dual;

SELECT trim('   ab  c ') FROM dual;	--사이에 공백은 제거 안됨(replace사용해서 제거해야됨)

SELECT replace('   ab  c ',' ','') FROM dual;

SELECT replace('rove,rive,rife','r','l') FROM dual;	--r을 l로 변경
SELECT name, replace(name,'r','l') FROM MEMBER
WHERE name LIKE '%r%';	--r을 l로 변경

SELECT id, lpad(pw,10,'*'),rpad(substr(pw,0,2),4,'*') FROM MEMBER;

SELECT sysdate-1,sysdate,sysdate+1,sysdate-hire_date FROM EMPLOYEES;

CREATE TABLE stu AS SELECT * FROM stuscore;


SELECT * FROM stu;

ALTER TABLE stu DROP COLUMN sno;
ALTER TABLE stu DROP COLUMN name;
ALTER TABLE stu DROP COLUMN kor;
ALTER TABLE stu DROP COLUMN eng;
ALTER TABLE stu DROP COLUMN math;
ALTER TABLE stu DROP COLUMN total;
ALTER TABLE stu DROP COLUMN avg;

ALTER TABLE stu ADD sdate2 DATE;
ALTER TABLE stu ADD sno NUMBER(4);

DROP TABLE stu;

CREATE TABLE stu(
sno number(4),
name varchar2(100),
sdate DATE,
sdate2 date
);

INSERT INTO stu(sno,name,sdate) SELECT sno,name,sdate FROM stuscore;

SELECT * FROM stu;

-- sdate2 10년후 날짜를 입력
SELECT sno,name,sdate,sdate2,add_months(sdate,120) FROM stu;

UPDATE stu a SET sdate2 = (SELECT add_months(sdate,120) FROM stu WHERE sno = a.sno)

--유관순 sdate2 오늘날짜 입력하시오.
UPDATE stu SET sdate2 = sysdate
WHERE name='유관순';

--마지막 일
SELECT hire_date,trunc(hire_date,'month'),last_day(hire_date) FROM EMPLOYEES;

--다가오는 요일 알려줌
SELECT sysdate,NEXT_DAY(sysdate,'일요일') FROM dual;
SELECT sysdate,NEXT_DAY(sysdate,'월요일') FROM dual;

SELECT * FROM stuscore;

SELECT sno,name,total,rank() over(ORDER BY total desc) FROM stuscore;

--형변환 함수 to_char(),to_number(),to_date()
--to_char():천단위표시
--'000,000' : 빈공백 0으로 채움, '999,999' : 빈공백 공백으로 채움
--,쉼표:천단위 표시, . 소수점자리수
SELECT salary,salary*12,salary*12*1473 FROM employees;
--12,000,000 : 쉼표는 문자열
SELECT salary,LENGTH(salary*12),to_char(salary*12,'999,999'),to_char(salary*12*1473) FROM employees;

SELECT salary,LENGTH(salary*12),to_char(salary*12,'000,999'),to_char(salary*12*1473) FROM employees;
SELECT salary,LENGTH(salary*12),to_char(salary*12,'L000,999'),to_char(salary*12*1473) FROM employees;	--원화표시
SELECT salary,LENGTH(salary*12),to_char(salary*12,'$000,999'),to_char(salary*12*1473) FROM employees;

--to_char() : 문자열 함수변환
--to_char(컬럼,'yyyy-mm-dd hh24:mi:ss')
SELECT sdate, to_char(sdate, 'yyyy-mm-dd hh24:mi:ss day') FROM stuscore;
SELECT sdate, to_char(sdate, 'yyyy-mon-dd hh24:mi:ss day') FROM stuscore;
SELECT sdate, to_char(sdate, 'yyyy/mm/dd day') FROM stuscore;
SELECT sdate, to_char(sdate, 'mm') FROM stuscore;
SELECT sdate, substr(sdate,0,10), substr(to_char(sdate, 'yyyy/mm/dd'),6,2) FROM stuscore;

SELECT phone, substr(phone,1,3), substr(phone,5,3), substr(phone,9,4) FROM MEMBER;

-- to_date() 문자열을 낧짜로 변경
SELECT '20251127' FROM dual;
SELECT '20251127'+2, to_date('20251127'+2,'yyyymmdd'), to_date('20251127') FROM dual;
--SELECT sysdate-'20251127' FROM dual;	--에러발생
--문자열을 날짜타입으로 변경하는 이유 : 날짜와 날짜시이의 간격, 날짜에 특정날짜를 더하기
SELECT months_between(sysdate,to_date('20251023','yyyymmdd')) FROM dual;

--to_number(컬럼, 형태) 문자열을 숫자로 변경
SELECT TO_NUMBER('20,000','99,999'), '30,000' FROM dual;
SELECT '30000',TO_NUMBER('30000'), to_number(replace('30,000',',','')) FROM dual;

select salary, to_char(salary*12,'999,999,999'), to_char((salary*12*1743),'999,999,999,999') from employees

--그룹함수 count,max,min,avg,sum
--그룹함수, 단일함수와 함께 사용할 수 없음.
SELECT min(KOR),max(KOR),median(KOR), variance(KOR), STDDEV(KOR) FROM stuscore;

SELECT avg(KOR) FROM STUSCORE;
SELECT count(KOR) FROM STUSCORE;

SELECT count(*) FROM employees;
SELECT sum(salary) FROM EMPLOYEES;
SELECT avg(salary) FROM EMPLOYEES;
SELECT max(salary) FROM EMPLOYEES;
SELECT min(salary) FROM EMPLOYEES;

SELECT department_id,salary FROM employees;

SELECT sum(salary),avg(salary),max(salary),min(salary),count(salary) FROM employees
WHERE department_id=50;

SELECT emp_name FROM employees WHERE DEPARTMENT_ID =50 AND SALARY = (SELECT max(salary) FROM employees WHERE DEPARTMENT_ID =50);
SELECT min(emp_name), max(salary) FROM employees WHERE DEPARTMENT_ID =50;
SELECT emp_name FROM employees WHERE salary =(SELECT max(salary) FROM employees);

-- 평균월급보다 높은 사원을 출력하시오.
-- 평균월급
SELECT avg(salary) FROM EMPLOYEES;
SELECT emp_name, salary FROM EMPLOYEES WHERE salary >= (SELECT avg(salary) FROM EMPLOYEES);

--국어점수가 평균이상인 사람이 몇명인지 출력하시오.
SELECT * FROM STUSCORE WHERE kor >= (SELECT avg(kor) FROM STUSCORE);

--count(*)
SELECT count(*) FROM EMPLOYEES;
SELECT count(emp_name) FROM EMPLOYEES;
SELECT count(MANAGER_ID) FROM EMPLOYEES;	--null값이 있으면 count에 포함안됨.
SELECT MANAGER_ID FROM EMPLOYEES WHERE MANAGER_ID IS null;


HAVING 

select count(total) from stuscore where total >= 270;

--- 527-***-1397 이렇게 출력하시오.
SELECT substr(phone,1,4)||'***'||substr(phone,8,5) FROM MEMBER;
SELECT REGEXP_REPLACE(phone, '-(.*)-', '-***-') FROM MEMBER;		--정규식

-- 11** rpad
SELECT rpad('11**',pw) FROM MEMBER;
SELECT pw, rpad(substr(pw,0,LENGTH(pw)-2),LENGTH(pw),'*') FROM MEMBER;

--홍**, Luci**, Gregoi**
SELECT rpad(substr(name,0,2),3,'*') FROM MEMBER;
SELECT REPLACE(name,substr(name,-2),'**') FROM MEMBER;

SELECT name, rpad(substr(name,0,LENGTH(name)-2),LENGTH(name),'*') FROM MEMBER;
SELECT name, rpad(substr(name,0,7-2),7,'*') FROM MEMBER;
SELECT name, substr(name,0,LENGTH(name)-2)||'**' FROM MEMBER;

-- 제약조건 : primary key, foreign key, not null, unique, check
-- primary key : null불가, 중복불가
-- foreign key : 다른테이블에 primary key 등록이 되어야 FK로 등록가능
-- not null : null 불가, 중복가능
-- unique : 중복불가, null가능
-- check : 설정값만 입력가능
CREATE TABLE mem(
id varchar2(100) PRIMARY KEY,
pw varchar2(100) NOT NULL,
name varchar2(100) UNIQUE,
phone char(13),
gender nvarchar2(2) check(gender IN('남자','여자')),
hobby varchar2(100),
mdate date
);

INSERT INTO mem values('aaa','1111','홍길동','010-1111-1111','남자','게임',sysdate);
INSERT INTO mem values('bbb','1111',null,'010-1111-1111','남자','게임',sysdate);
INSERT INTO mem values('ccc','1111',null,'010-1111-1111','여자','게임',sysdate);
INSERT INTO mem values('ddd','1111',null,'010-1111-1111','여자','게임',sysdate);
INSERT INTO mem values('eee',' ',null,null,'여자',null,null);
INSERT INTO mem (id,pw,gender) values('fff','1111','남자');

SELECT * FROM mem;

SELECT * FROM board;


CREATE TABLE board2 AS SELECT * FROM board;

--foreign key 등록
ALTER TABLE BOARD2 ADD CONSTRAINT fk_mem_board2_id FOREIGN key(id)
REFERENCES mem(id);

-- mem테이블, board2테이블 id 컬럼이 연결
-- mem테이블에 없는 id board2에 id로 등록이 불가
-- mem테이블을 board2의 id가 삭제되지 않으면 mem테이블 삭제할 수 없음. -> cascade로 같이 삭제되도록 할 수 있음

--2025.11.28 - 27일차 수업내용
CREATE TABLE mem2 AS SELECT * FROM MEMBER;

SELECT * FROM mem2;

--primary key등록,수정
--constraint 별칭
ALTER TABLE mem2 ADD CONSTRAINT pk_mem2_id PRIMARY KEY (id);

--테이블 생성시 primary key 등록방법
CREATE TABLE mem3(
id varchar2(100) PRIMARY KEY,
pw varchar2(100)
);

--데이터:자료집합, 정보:데이터의 유용한 자료
--무결성 제약조건 : 데이터 입력시 잘못된 데이터의 입력을 제약
--primary key, foreign key, not null, unique, check

SELECT * FROM board;

CREATE TABLE board3 AS SELECT * FROM board;

ALTER TABLE board3 ADD CONSTRAINT pk_bno3_id PRIMARY key(bno);

--테이블 생성시 foreign key 등록
--다른테이블에 primary key 로 등록되어 있어야 fk로 등록가능
CREATE TABLE board4(
bno NUMBER(4) PRIMARY KEY,
btitle varchar2(1000) NOT NULL,
bcontent clob,
id varchar2(100),
CONSTRAINT fk_board4_mem2_id FOREIGN KEY(id) REFERENCES mem2(id)
);

--fk추가
ALTER TABLE board3 ADD CONSTRAINT fk_board3_mem2_id FOREIGN KEY(id) REFERENCES mem2(id);

--fk삭제
ALTER TABLE board3 DROP CONSTRAINT fk_board3_mem2_id;

DROP TABLE board4;

SELECT * FROM board3;

INSERT INTO board3 values(
board_seq.nextval,'제목입니다.','내용입니다.','abc',board_seq.currval,0,0,0,'1.jpg',sysdate
);

SELECT board_seq.currval FROM dual;

SELECT * FROM mem2 WHERE id='aaa';

DELETE FROM mem2 WHERE id='aaa';

DELETE FROM board3 WHERE id='aaa';
DELETE FROM mem2 WHERE id='aaa';

----------------------------------
--부모키 삭제할때 mem2에 있는것도 삭제
ALTER TABLE board3 ADD CONSTRAINT fk_board3_mem2_id FOREIGN KEY(id) references mem2(id) ON DELETE CASCADE;
--부모키 삭제할때 mem2키 값도 같이 업데이트(board에 fk가 사라지며 mem2의 pk 내용변경)
ALTER TABLE board3 ADD CONSTRAINT fk_board3_mem2_id FOREIGN KEY(id) references mem2(id) ON update CASCADE;
--부모 키 삭제 시 NULL 처리
ALTER TABLE board3 ADD CONSTRAINT fk_board3_mem2_id FOREIGN KEY(id) REFERENCES mem2(id) ON DELETE SET NULL;

ALTER TABLE board3 DROP CONSTRAINT fk_board3_mem2_id;
DELETE FROM mem2 WHERE id='bbb';
DELETE FROM mem2 WHERE id='ccc';

DROP TABLE board3;
DROP TABLE board2;
DROP TABLE mem2;
DROP TABLE mem;


CREATE TABLE mem(
id varchar2(100) PRIMARY KEY,
pw varchar2(100) NOT NULL,
name varchar2(100) UNIQUE,	--중복불가, null허용
phone char(13) DEFAULT '010-0000-0000',
gender nvarchar2(2) CHECK (gender IN('남자','여자')),
hobby varchar2(100) DEFAULT '게임',
age number(3) check(age BETWEEN 0 AND 120)
);

INSERT INTO mem(id,pw,gender) values('aaa','111','남자')

SELECT * FROM mem;

SELECT * FROM stu;
DROP TABLE stu;

CREATE TABLE stuscore2 AS SELECT * FROM stuscore;

SELECT * FROM stuscore2;

--논리/조건
SELECT * FROM STUSCORE2;

ALTER TABLE STUSCORE2 ADD leader nvarchar2(2);

UPDATE STUSCORE2 SET LEADER = '반장';

--decode는 case when보다 속도 빠름 대신 범위지정 못함
SELECT sno,name
,decode(sno,10,'반장'
,20,'부반장'
,30,'총무'
,40,'총무2') AS leader2
FROM stuscore2;

SELECT 
sno,name,
CASE WHEN sno<=10 THEN '반장'
WHEN sno <= 20 THEN '부반장'
WHEN sno <= 30 THEN '총무'
WHEN sno <= 40 THEN '총무2'
ELSE '??'
END AS leader2
FROM STUSCORE2;

--avg컬럼을 가지고, rank별칭을 사용해서 90이상 A, 80점 이상 B,C,D,F
SELECT 
sno,name,
CASE WHEN avg>=90 THEN 'A'
WHEN avg >= 80 THEN 'B'
WHEN avg >= 70 THEN 'C'
WHEN avg >= 60 THEN 'D'
ELSE 'F'
END AS rank
FROM STUSCORE2;

SELECT avg FROM STUSCORE2;

ALTER TABLE STUSCORE2 ADD event DATE;

SELECT sdate, last_day(sdate), trunc(sdate,'month') FROM stuscore;

SELECT sdate, event, last_day(sdate) FROM stuscore2;

UPDATE stuscore2 a SET event='';

UPDATE stuscore2 a SET event=sysdate;

UPDATE stuscore2 a SET event=last_day(sdate);

SELECT sdate, event, last_day(sdate) FROM stuscore2;

ALTER TABLE stuscore2 ADD RANK nvarchar2(1);

SELECT * FROM STUSCORE2;

UPDATE stuscore2 SET RANK = 1;

select * FROM stuscore2;

SELECT RANK,
CASE WHEN avg>=90 THEN 'A'
WHEN avg >= 80 THEN 'B'
WHEN avg >= 70 THEN 'C'
WHEN avg >= 60 THEN 'D'
ELSE 'F'
END AS rank
FROM STUSCORE2;

UPDATE stuscore2 SET RANK = (
CASE WHEN avg>=90 THEN 'A'
WHEN avg >= 80 THEN 'B'
WHEN avg >= 70 THEN 'C'
WHEN avg >= 60 THEN 'D'
ELSE 'F'
END
);

select * FROM stuscore2;


ALTER TABLE stuscore2 MODIFY sdate invisible;
ALTER TABLE stuscore2 MODIFY leader invisible;
ALTER TABLE stuscore2 MODIFY event invisible;
ALTER TABLE stuscore2 MODIFY sdate visible;
ALTER TABLE stuscore2 MODIFY leader visible;
ALTER TABLE stuscore2 MODIFY event visible;

SELECT * FROM stuscore2
ORDER BY sno;

--'class'컬럼을 1개 추가
--1~10까지 1반,2반,3반 ,......,10반, 기타 컬럼에 추가하시오.
ALTER TABLE stuscore2 ADD class varchar2(100);
ALTER TABLE stuscore2 DROP COLUMN class;

UPDATE stuscore2 SET class = (
CASE WHEN sno BETWEEN 1 AND 10 THEN '1반'
WHEN sno BETWEEN 11 AND 20 THEN '2반'
WHEN sno BETWEEN 21 AND 30 THEN '3반'
WHEN sno BETWEEN 31 AND 40 THEN '4반'
WHEN sno BETWEEN 41 AND 50 THEN '5반'
WHEN sno BETWEEN 51 AND 60 THEN '6반'
WHEN sno BETWEEN 61 AND 70 THEN '7반'
WHEN sno BETWEEN 71 AND 80 THEN '8반'
WHEN sno BETWEEN 81 AND 90 THEN '9반'
WHEN sno BETWEEN 91 AND 100 THEN '10반'
ELSE '11반'
END
);

SELECT sno, name, total FROM stuscore2;
SELECT total, rank() over(ORDER BY total desc) FROM stuscore2;

--그룹함수 max,min,avg,sum,count,.....
SELECT sum(kor) FROM STUSCORE2;
SELECT to_char(sum(kor),'999,999') FROM STUSCORE2;
SELECT avg(kor) FROM STUSCORE2;
SELECT max(kor) FROM STUSCORE2;
SELECT min(kor) FROM STUSCORE2;
SELECT count(kor) FROM STUSCORE2;

SELECT name, max(kor) FROM stuscore2;	--단일 컬럼과 그룹컬럼을 함께 사용할 수 없음.

-- group by 단일컬럼
-- max(kor) 이름을 기준으로 최대국어점수르 출력하시오.
SELECT name, max(kor) FROM STUSCORE2
GROUP BY NAME;

--단일컬럼과 그룹컬럼을 함께 사용할 수 없음.
--반별평균
SELECT class, avg(avg) FROM STUSCORE2
GROUP BY class
HAVING avg(avg)<=52.3333333;

--그룹컬럼의 조건절은 where에서 사용할 수 없음.
--그룹컬럼의 조건절은 having에 입력되어야 함.

---department_id employees테이블 - 부서별 월급 총합
SELECT department_id, sum(salary), avg(salary)
,(SELECT avg(SALARY) FROM EMPLOYEES)	--속도 느려짐
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 
--HAVING avg(salary)>=6461
HAVING avg(salary)>=(SELECT avg(SALARY) FROM EMPLOYEES)
ORDER BY DEPARTMENT_ID;

--6개월 후
SELECT sysdate,ADD_MONTHS(sysdate,6) FROM dual;

SELECT hire_date,add_months(hire_date,6) FROM employees;

SELECT DISTINCT(department_id) FROM EMPLOYEES;

SELECT count(*) FROM EMPLOYEES;
SELECT count(manager_id) FROM EMPLOYEES;	--null값은 포함이 안된다.

SELECT * FROM MEMBER,BOARD;
SELECT count(*) FROM MEMBER,BOARD;	--10000

SELECT count(*) FROM MEMBER;		--100
SELECT count(*) FROM BOARD;			--100

SELECT a.*,b.* FROM board a
INNER JOIN "MEMBER" b ON a.ID = b.ID 

SELECT emp_name, department_id FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT a.EMPLOYEE_ID ,a.emp_name, a.DEPARTMENT_ID , b.DEPARTMENT_NAME FROM EMPLOYEES a
--LEFT JOIN DEPARTMENTS b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID		--b에 데이터가 없는것도
INNER JOIN DEPARTMENTS b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID
ORDER BY a.EMPLOYEE_ID;

--cross join 100*100 = 10000
SELECT * FROM EMPLOYEES,DEPARTMENTS;

--equi-join : 동일한 컬럼이 존재할 때
SELECT * FROM employees,DEPARTMENTS
WHERE employees.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT * FROM stuscore;

SELECT * FROM MEMBER;

--작성자 board테이블 : id, member테이블 : id, 이름, 전화번호
--join을 했을 경우, 공통컬럼외에 다른 컬럼의 내용을 바꾸면 변경된 내용을 가지고 옴.
SELECT MEMBER.id,bno,btitle,name,phone FROM MEMBER,board
WHERE MEMBER.id = board.id;

--id,이름,전화번호
SELECT * FROM MEMBER;

UPDATE MEMBER set name='길동스' WHERE id='aaa';

SELECT * from mem;
DROP TABLE mem;

CREATE TABLE mem AS SELECT * FROM MEMBER;

SELECT * FROM mem;

DELETE mem WHERE id NOT IN ('aaa','bbb','ccc','ddd','eee','fff','ggg','hhh','iii','jjj','kkk')

ALTER TABLE mem ADD nicname varchar2(100);

ALTER TABLE mem MODIFY phone invisible;
ALTER TABLE mem MODIFY email invisible;
ALTER TABLE mem MODIFY gender invisible;
ALTER TABLE mem MODIFY hobby invisible;
ALTER TABLE mem MODIFY phone visible;
ALTER TABLE mem MODIFY email visible;
ALTER TABLE mem MODIFY gender visible;
ALTER TABLE mem MODIFY hobby visible;

UPDATE mem SET nicname = (concat(substr(name,1,2),'즈'));

SELECT concat(substr(name,1,2),'즈') FROM mem;

SELECT board.bno,board.btitle,board.bcontent,board.id,mem.nicname FROM board,mem WHERE board.id = mem.id;

SELECT bno,id FROM board;
SELECT id,pw FROM mem;

-- 사원이름, 부서번호, 부서이름, 월급
-- 테이블 별칭 가능
SELECT a.EMP_NAME, a.DEPARTMENT_ID, b.DEPARTMENT_NAME , a.SALARY 
FROM EMPLOYEES a, DEPARTMENTS b 
WHERE a.DEPARTMENT_ID = b.DEPARTMENT_ID

SELECT a.id,a.nicname,b.bno,b.btitle 
FROM board b, mem a 
WHERE a.id=b.id AND a.id='aaa';


--non equi join : 같은컬럼이 없고 두 테이블 조인
SELECT * FROM stuscore;

DROP table scoregrade;
CREATE TABLE scoregrade(
grade char(1),
lowgrade number(7,4),
highgrade number(7,4)
);

INSERT INTO scoregrade values('A',90,100);
INSERT INTO scoregrade values('B',80,89.999);
INSERT INTO scoregrade values('C',70,79.999);
INSERT INTO scoregrade values('D',60,69.999);
INSERT INTO scoregrade values('E',50,59.999);
INSERT INTO scoregrade values('F',0,49.999);

SELECT * FROM SCOREGRADE;

--scoregrade, stuscore 2개 테이블을 조인해서 grade등급을 입력
--같은 컬럼이 존재하지 않음
SELECT * from SCOREGRADE, stuscore;

--stuscore avg컬럼을 scoregrade lowgrade,highgrade 범위를 조회해서 grade추가
SELECT name,avg,grade FROM stuscore a, SCOREGRADE b
WHERE avg BETWEEN lowgrade AND highgrade;

--월급을 가지고 직급을 추가하려고 합니다.
--salgrade:grade,lowgrade,highgrade 
--20000-50000 대표, 13000 부사장 10000 부장 8000 과장 6000 대리, 그외 사원
--'대표','부사장','부장','과장','대리','사원'

--case when 방식
SELECT emp_name, salary
,CASE WHEN SALARY between 20000 AND 50000 THEN '대표'
WHEN salary between 13000 AND 19999 THEN '부사장'
WHEN salary between 10000 AND 12999 THEN '부장'
WHEN salary between 8000 AND 9999 THEN '과장'
WHEN salary between 6000 AND 7999 THEN '대리'
ELSE '사원'
END AS salgrade
FROM EMPLOYEES
ORDER BY salary desc;


--위 내용 테이블 추가방식으로(자주 사용되면 생성하는게 좋음)
DROP TABLE salgrade;

CREATE TABLE salgrade(
grade char(9),
lowgrade number(5),
highgrade number(5)
);

INSERT INTO salgrade values('대표',20000,50000);
INSERT INTO salgrade values('부사장',13000,19999);
INSERT INTO salgrade values('부장',10000,12999);
INSERT INTO salgrade values('과장',8000,9999);
INSERT INTO salgrade values('대리',6000,7999);
INSERT INTO salgrade values('사원',0,5999);

SELECT * FROM salgrade;

--테이블 만든 후 조인해서 확인
SELECT emp_name, salary, grade FROM employees, salgrade
WHERE SALARY BETWEEN lowgrade AND highgrade;

SELECT * FROM mem;
SELECT * FROM stuscore2;
ALTER TABLE stuscore2 Drop COLUMN RANK;
ALTER TABLE stuscore2 Drop COLUMN leader;

--stuscore2 테이블 scoregrade테이블을 조인해서 grade학점을 출력하시오. 
SELECT * FROM stuscore2;
SELECT * FROM scoregrade;
SELECT a.name,a.avg,b.grade FROM  STUSCORE2 a, SCOREGRADE b WHERE a.avg BETWEEN b.LOWGRADE AND b.HIGHGRADE;

--grade 컬럼을 추가해서 조인해서 나온 결과를 입력하시오.
ALTER TABLE STUSCORE2 ADD grade varchar2(1);

UPDATE STUSCORE2 SET grade = (SELECT grade FROM SCOREGRADE WHERE avg BETWEEN LOWGRADE AND HIGHGRADE);

SELECT * FROM stuscore2;

--inner조인
--cross join : equi join - 같은컬럼 있는 경우, non equi join 같은 컬럼이 없는 경우
--self join : 같은 테이블을 2개 사용할때

--manager_id : 사원중에 자신의 상사의 id를 적용
SELECT EMPLOYEE_ID ,emp_name, manager_id, emp_name FROM EMPLOYEES;

SELECT a.employee_id, a.emp_name, a.manager_id,b.EMP_NAME,b.EMPLOYEE_ID
FROM EMPLOYEES a, EMPLOYEES b
WHERE a.MANAGER_ID = b.EMPLOYEE_ID;

--outer join : 해당컬럼에 null값이 있어도 출력시켜줌
--manager_id에 null값이 존재 그 반대편에 (+)를 넣어줌 -> outer join 예전방식
SELECT a.employee_id, a.emp_name, a.manager_id,b.EMP_NAME,b.EMPLOYEE_ID
FROM EMPLOYEES a, EMPLOYEES b
WHERE a.MANAGER_ID = b.EMPLOYEE_ID(+);

SELECT manager_id FROM EMPLOYEES
WHERE manager_id IS NULL;

--employees,departments 테이블을 이용해서
--사원명,부서번호,부서명을 출력하시오.
SELECT a.EMP_NAME, b.DEPARTMENT_ID, b.DEPARTMENT_NAME FROM employees a,departments b
WHERE a.DEPARTMENT_ID(+) = b.DEPARTMENT_ID;		--departments테이블에 있지만 employees에 없는게 출력

SELECT department_id FROM employees
ORDER BY department_id;


--ansi join
--equi join
--ansi equi join
SELECT a.EMP_NAME, b.DEPARTMENT_ID, b.DEPARTMENT_NAME 
FROM employees a
INNER JOIN departments b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID;

SELECT a.EMP_NAME, b.DEPARTMENT_ID, b.DEPARTMENT_NAME 
FROM employees a
JOIN departments b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID;

--nature join : on안써도 됨 (같은 컬럼명이 있으면 자동 조인), CREATE_DATE, UPDATE_DATE같은 동일한 컬럼명이 존재해서 조회가 안됨
SELECT emp_name, department_name
FROM employees NATURAL JOIN DEPARTMENTS;

--ansi outer join : left outer join, right outer join, full outer join
SELECT a.EMP_NAME, b.DEPARTMENT_ID, b.DEPARTMENT_NAME 
FROM EMPLOYEES a
--LEFT OUTER join departments b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID;
RIGHT OUTER JOIN departments b ON a.DEPARTMENT_ID = b.DEPARTMENT_ID;

--쿼리 속도 성능은 mariadb보다 postgresql이 조회속도 빠름(예전 프로젝트로 확인해봄)
--오라클은 돈주는거라 일전부분 자동튜닝등 관리해주는 부분이 있고 postgresql등은 데이터가 많아지면 튜닝 직접 적용해서 쿼리속도를 올려야함.

--rownum 순번 출력하는 방법
SELECT rownum,a.* FROM MEMBER a;

SELECT rownum, a.* FROM EMPLOYEES a;

SELECT * FROM board
ORDER BY bno;

CREATE TABLE board2 AS SELECT * FROM board;

SELECT * FROM board2 --LIMIT 10;

SELECT * FROM board2 WHERE bno BETWEEN 1 AND 10;	--게시판에 삭제될 경우 번호가 중간에 빠져서 보임.

DELETE FROM board2 WHERE bno=4;
DELETE FROM board2 WHERE bno=7;
DELETE FROM board2 WHERE bno=11;
DELETE FROM board2 WHERE bno=12;
DELETE FROM board2 WHERE bno=15;
DELETE FROM board2 WHERE bno=22;
DELETE FROM board2 WHERE bno=25;
DELETE FROM board2 WHERE bno=29;

SELECT rownum, a.* FROM board2 a WHERE rownum BETWEEN 11 AND 20;	--1부터10까지 보여주지만 11부터20까지는 안됨

SELECT * from(
SELECT 
	rownum AS rnum
	,aaa.* 
from(
SELECT 
	a.* 
FROM board2 a
ORDER BY a.bno asc
) aaa
)
WHERE rnum >= 11 AND rnum <= 20;

SELECT * from(
SELECT row_number() over(ORDER BY bno asc) rnum, a.* FROM board2 a
) WHERE RNUM BETWEEN 11 AND 20;

SELECT *
FROM board2
ORDER BY bno ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

---limit 1

SELECT * FROM (
SELECT ROW_NUMBER() OVER(ORDER BY a.id asc) rnum, a.* FROM MEMBER a
) WHERE rnum BETWEEN 1 AND 10;


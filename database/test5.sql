--2025.12.01 - 28일차 수업내용
SELECT rownum,a.* FROM MEMBER a;

--정렬이 있는 경우
SELECT row_number() OVER(ORDER BY id asc), a.* FROM MEMBER a;

SELECT rownum rnum ,a.* FROM(
SELECT * FROM MEMBER
ORDER BY id ASC
) a;

SELECT * FROM EMPLOYEES
WHERE emp_name LIKE '%a%' AND salary>=7000

SELECT * FROM EMPLOYEES WHERE emp_name LIKE '%a%';
SELECT * FROM (SELECT * FROM EMPLOYEES WHERE emp_name LIKE '%a%')
WHERE salary>=7000;

--rank() over(), DENSE_RANK() OVER()
SELECT rank() over(ORDER BY total desc),DENSE_RANK() OVER(ORDER BY total desc), name,total FROM STUSCORE;

ALTER TABLE stuscore ADD RANK number(3) DEFAULT 0;

SELECT rank() over(ORDER BY total desc), RANK, sno FROM stuscore;

UPDATE stuscore a SET rank=(
SELECT ranks from(
SELECT rank() over(ORDER BY total desc) ranks, sno FROM stuscore b
) b
WHERE a.sno = b.sno
);

SELECT * FROM stuscore;

DROP TABLE stuscore3;
CREATE  TABLE stuscore3 AS SELECT * FROM stuscore;

UPDATE stuscore3 SET rank = 0;

ALTER TABLE stuscore3 ADD grade nchar(1) DEFAULT 'D';

SELECT * FROM stuscore3;

--non equi조인으로 avg기준으로 90부터 100까지는 A, 80~89.9999 B, ...,F grade테이블에 입력해서 출력하시오.
--stuscore3, scoregrade
SELECT * FROM SCOREGRADE;

UPDATE stuscore3 a SET --grade -> non equi조인 안 해도 됨 update에 있는 a별칭과 매핑
--grade
grade = (
SELECT b.grade FROM(
SELECT a.sno, b.grade FROM stuscore3 a,scoregrade b WHERE a.avg BETWEEN b.LOWGRADE AND b.HIGHGRADE
) b WHERE a.sno = b.sno
),
--rank
rank=(
SELECT ranks from(
SELECT rank() over(ORDER BY avg desc) ranks, sno FROM stuscore3 b
) b
WHERE a.sno = b.sno
);

SELECT * FROM stuscore3;

-- avg 기준으로 순위를 ranks컬럼에 입력하시오. -> rank() over()
UPDATE stuscore3 a SET 
--rank
rank=(
SELECT ranks from(
SELECT rank() over(ORDER BY avg desc) ranks, sno FROM stuscore3 b
) b
WHERE a.sno = b.sno
);




ALTER TABLE stuscore ADD grade nchar(1);
UPDATE stuscore SET RANK=0, grade='';

SELECT * FROM stuscore;

SELECT max(sno) FROM stuscore;

select stuscore_seq.nextval FROM dual;

DELETE FROM stuscore WHERE sno>100;

SELECT * FROM stuscore;
SELECT * FROM stuscore2;
SELECT * FROM stuscore3;

DELETE stuscore3;

DROP TABLE STUSCORE3;
CREATE TABLE STUSCORE3 AS SELECT * FROM stuscore WHERE 1=2;

insert into stuscore3 (sno, name, kor, eng, math, total, avg, sdate) values (stuscore3_seq.nextval,'홍길동', 100, 100, 99, (100+100+99), (100+100+99)/3, sysdate);

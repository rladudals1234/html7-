--2025.11.26 - 25일차 수업내용

SELECT * FROM EMPLOYEES;

INSERT INTO student3(sno, name, kor, eng, math, sdate, total, avg)
VALUES (
5,'강감찬',75,70,79,sysdate,(75+70+79),(75+70+79)/3
);

--컬럼순서변경
ALTER TABLE student3 MODIFY sdate invisible;
ALTER TABLE student3 MODIFY sdate visible;

ALTER TABLE student3 MODIFY kor invisible;
ALTER TABLE student3 MODIFY eng invisible;
ALTER TABLE student3 MODIFY math invisible;
ALTER TABLE student3 MODIFY total invisible;
ALTER TABLE student3 MODIFY avg invisible;

ALTER TABLE student3 MODIFY kor visible;
ALTER TABLE student3 MODIFY eng visible;
ALTER TABLE student3 MODIFY math visible;
ALTER TABLE student3 MODIFY total visible;
ALTER TABLE student3 MODIFY avg visible;

DROP TABLE student3;

--employees테이블에서 6000~7000까지 사원을 검색하시오.
SELECT * FROM employees WHERE SALARY >= 6000 AND SALARY <=7000;
SELECT * FROM employees WHERE SALARY between 6000 AND 7000;

--6000,7000,8000
SELECT * FROM employees WHERE SALARY in(6000,7000,8000)	--or사용해도 됨(in절이 속도에서 유리)

SELECT * FROM employees WHERE emp_name LIKE 'P%';		--%를 뒤에 하나만 두는게 속도에서는 유리

SELECT emp_name FROM EMPLOYEES
WHERE emp_name LIKE '%d%';

--cust_city_ge가 들어가는 도시를 검색하시오.
SELECT * FROM CUSTOMERS
WHERE CUST_CITY LIKE '%ge%';
SELECT * FROM CUSTOMERS
WHERE CUST_CITY LIKE concat('%','ge');

DROP TABLE MEMBER;

create table member (
	id VARCHAR2(50),
	pw VARCHAR2(4),
	name VARCHAR2(100),
	phone char(13),
	email VARCHAR2(50),
	gender VARCHAR2(50),
	hobby VARCHAR2(100)
);

insert into member (id, pw, name, phone, email, gender, hobby) values ('aaa', '1111', '홍길동', '802-414-0811', 'mtorresi0@jigsy.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('bbb', '1111', '유관순', '432-953-3758', 'rlanegran1@behance.net', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('ccc', '1111', '이순신', '910-658-6704', 'rpenkman2@fda.gov', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('ddd', '1111', '강감찬', '457-956-8264', 'ckay3@barnesandnoble.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('eee', '1111', '김구', '519-701-7270', 'ngrahamslaw4@homestead.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('fff', '1111', '김유신', '851-533-9632', 'nborrie5@ox.ac.uk', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('ggg', '1111', '홍길순', '345-333-8141', 'fcuningham6@foxnews.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('hhh', '1111', '홍길자', '142-794-3030', 'glonie7@gravatar.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('iii', '1111', '관순스', '401-365-5842', 'gferrarin8@miitbeian.gov.cn', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('jjj', '1111', '순신스', '859-953-9843', 'tfranses9@cloudflare.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('kkk', '1111', '감찬스', '879-727-5555', 'cvogelera@apple.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Satterly', '1111', 'Brennan', '413-599-9428', 'bsatterlyb@patch.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('McInnerny', '1111', 'Lurline', '714-752-5123', 'lmcinnernyc@plala.or.jp', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Rogger', '1111', 'Salli', '295-372-7613', 'sroggerd@a8.net', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Burcombe', '1111', 'Marylinda', '695-172-8760', 'mburcombee@un.org', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Revey', '1111', 'Brendon', '269-496-4760', 'breveyf@parallels.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lasselle', '1111', 'Jacinta', '942-145-4967', 'jlasselleg@cmu.edu', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Senter', '1111', 'Trish', '379-195-4026', 'tsenterh@lycos.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Very', '1111', 'Cordi', '476-923-1546', 'cveryi@360.cn', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Sibson', '1111', 'Jannelle', '841-870-7262', 'jsibsonj@ask.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Habin', '1111', 'Maurita', '845-773-0986', 'mhabink@networkadvertising.org', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Backshaw', '1111', 'Benny', '549-101-8528', 'bbackshawl@cafepress.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Keuneke', '1111', 'Gasper', '669-658-0318', 'gkeunekem@pen.io', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Elsworth', '1111', 'Nels', '473-478-3347', 'nelsworthn@etsy.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Croft', '1111', 'Steffi', '258-628-2468', 'scrofto@hugedomains.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('MacAllaster', '1111', 'Neal', '926-395-8374', 'nmacallasterp@wix.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Selkirk', '1111', 'Marietta', '409-874-8516', 'mselkirkq@liveinternet.ru', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Trowler', '1111', 'Reggie', '878-418-9858', 'rtrowlerr@cloudflare.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Jaycox', '1111', 'Morie', '920-487-2845', 'mjaycoxs@naver.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Giraudot', '1111', 'Kai', '841-380-2280', 'kgiraudott@sourceforge.net', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Samples', '1111', 'Rory', '887-716-4106', 'rsamplesu@nature.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Rutley', '1111', 'Adrienne', '410-508-5094', 'arutleyv@hhs.gov', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Tettley', '1111', 'Eudora', '157-914-1442', 'etettleyw@weather.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Coventon', '1111', 'Erhart', '606-785-7728', 'ecoventonx@dot.gov', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Bacop', '1111', 'Zorina', '841-539-1379', 'zbacopy@oracle.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Mehmet', '1111', 'Ash', '291-826-4790', 'amehmetz@so-net.ne.jp', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Dutnell', '1111', 'Mackenzie', '610-940-2037', 'mdutnell10@tripod.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Pennell', '1111', 'Tani', '415-793-1459', 'tpennell11@bloglovin.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Butterley', '1111', 'Morlee', '450-523-9234', 'mbutterley12@163.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Doubrava', '1111', 'Thorny', '329-719-8671', 'tdoubrava13@independent.co.uk', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Greedier', '1111', 'Julio', '681-671-4870', 'jgreedier14@archive.org', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Oggers', '1111', 'Hamil', '875-175-0503', 'hoggers15@salon.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('D''Antonio', '1111', 'Theadora', '939-763-3365', 'tdantonio16@youtube.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Picken', '1111', 'Inigo', '468-467-6347', 'ipicken17@gmpg.org', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Heeks', '1111', 'Hubert', '228-429-4620', 'hheeks18@flickr.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Torritti', '1111', 'Kate', '585-200-3322', 'ktorritti19@seattletimes.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Summerscales', '1111', 'Darill', '948-686-9623', 'dsummerscales1a@tamu.edu', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Leaning', '1111', 'Onofredo', '540-121-9046', 'oleaning1b@cbslocal.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Irce', '1111', 'Trudey', '283-423-6595', 'tirce1c@elegantthemes.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Yoxall', '1111', 'Thacher', '502-970-5633', 'tyoxall1d@unesco.org', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Monksfield', '1111', 'Hedwig', '455-107-6138', 'hmonksfield1e@aboutads.info', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('McLise', '1111', 'Reece', '170-673-3131', 'rmclise1f@github.io', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Cafferty', '1111', 'Hagen', '772-800-2897', 'hcafferty1g@hatena.ne.jp', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Dearlove', '1111', 'Meyer', '808-482-4421', 'mdearlove1h@vk.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lande', '1111', 'Marne', '408-543-0860', 'mlande1i@go.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Parvin', '1111', 'Dniren', '924-264-2205', 'dparvin1j@cloudflare.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Onion', '1111', 'Nicolas', '791-713-2180', 'nonion1k@accuweather.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Koles', '1111', 'Tucky', '419-981-8245', 'tkoles1l@sfgate.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Markie', '1111', 'Kendal', '445-388-4884', 'kmarkie1m@furl.net', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('McCallion', '1111', 'Carlen', '287-686-8291', 'cmccallion1n@moonfruit.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Summersett', '1111', 'Ariella', '764-170-6704', 'asummersett1o@hc360.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Eleshenar', '1111', 'Thacher', '849-444-9709', 'teleshenar1p@slate.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Sewter', '1111', 'Thaxter', '147-309-9272', 'tsewter1q@biblegateway.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Shermore', '1111', 'Andras', '836-296-2445', 'ashermore1r@latimes.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Hannabuss', '1111', 'Benedick', '575-929-7566', 'bhannabuss1s@who.int', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Worthy', '1111', 'Isis', '913-247-4130', 'iworthy1t@constantcontact.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Cord', '1111', 'Cherilynn', '863-313-9121', 'ccord1u@columbia.edu', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Ivashev', '1111', 'Man', '173-683-3852', 'mivashev1v@scribd.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Woolrich', '1111', 'Elsie', '246-248-1149', 'ewoolrich1w@storify.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('McCarron', '1111', 'Hunter', '636-277-2234', 'hmccarron1x@clickbank.net', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Bateman', '1111', 'Teresa', '456-711-8959', 'tbateman1y@indiegogo.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Prescote', '1111', 'Howey', '230-274-3513', 'hprescote1z@tiny.cc', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Kiddey', '1111', 'Ephrem', '913-357-4235', 'ekiddey20@comsenz.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Penney', '1111', 'Beulah', '839-911-3483', 'bpenney21@nationalgeographic.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Tweedy', '1111', 'Wilbert', '341-652-8066', 'wtweedy22@ucla.edu', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Aspinall', '1111', 'Mina', '483-263-1551', 'maspinall23@va.gov', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Atheis', '1111', 'Jocko', '254-880-9744', 'jatheis24@hud.gov', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Blodgett', '1111', 'Sig', '404-200-4064', 'sblodgett25@tumblr.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Hunting', '1111', 'Arlen', '573-989-7808', 'ahunting26@technorati.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Simonitto', '1111', 'Rosalie', '744-965-8210', 'rsimonitto27@over-blog.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Jerratsch', '1111', 'Nada', '183-756-9000', 'njerratsch28@netvibes.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Keegan', '1111', 'Hadleigh', '911-391-4753', 'hkeegan29@ftc.gov', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Falconar', '1111', 'Renata', '953-839-0057', 'rfalconar2a@g.co', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Castagnet', '1111', 'Gussy', '187-260-7359', 'gcastagnet2b@weather.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Edmands', '1111', 'Abram', '701-365-1147', 'aedmands2c@epa.gov', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Teasell', '1111', 'Kaye', '692-183-9237', 'kteasell2d@bloomberg.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Fusco', '1111', 'Hillie', '523-545-3255', 'hfusco2e@nba.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Dye', '1111', 'Jemmy', '836-397-5747', 'jdye2f@harvard.edu', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('O''Cullen', '1111', 'Selestina', '551-725-1332', 'socullen2g@feedburner.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Krysiak', '1111', 'Rivi', '883-737-7297', 'rkrysiak2h@wiley.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Elgie', '1111', 'Barnie', '253-535-7970', 'belgie2i@skype.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Brazil', '1111', 'Eyde', '302-657-9037', 'ebrazil2j@indiatimes.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Thurby', '1111', 'Maddi', '982-152-2505', 'mthurby2k@upenn.edu', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Luxon', '1111', 'Gayleen', '413-918-3540', 'gluxon2l@sun.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Colliar', '1111', 'Lynett', '420-406-9812', 'lcolliar2m@google.ca', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('McGonigle', '1111', 'Tiff', '803-233-5496', 'tmcgonigle2n@bandcamp.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Cawthry', '1111', 'Ingunna', '406-567-9222', 'icawthry2o@mozilla.org', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lauderdale', '1111', 'Davie', '578-957-7058', 'dlauderdale2p@aboutads.info', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Dupoy', '1111', 'Gerik', '516-112-8590', 'gdupoy2q@qq.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Cayser', '1111', 'Letisha', '109-609-8565', 'lcayser2r@nyu.edu', 'F', '게임');

SELECT * FROM MEMBER;

--홍이 들어가 있는 회원을 검색하시오.
--이메일에서 man이 들어가 있는 회원을 검색하시오.
SELECT * FROM MEMBER WHERE name LIKE '%홍%';
SELECT * FROM MEMBER WHERE EMAIL LIKE '%man%';

-- like %는 순서와 상관없이 어떤 문자가 들어와도 검색
-- like에서 _는 1개의 문자순서

SELECT job_id FROM EMPLOYEES;

SELECT job_id FROM EMPLOYEES
WHERE job_id = 'SH_CLERK';

--_를 검색할때 #을 붙이고 escape을 추가하면 _문자 검색가능
SELECT job_id FROM EMPLOYEES
WHERE job_id like '%#_C%' ESCAPE '#';

--null 검색 : is null
SELECT manager_id FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

-- null 다른것으로 대체 nvl()
-- salary+(salary*commission_pct) 출력하시오.
-- 환율로 원화 1473원
SELECT (salary+(salary*nvl(commission_pct,0)))*1473 AS SALARY FROM EMPLOYEES; 

--문자는 to_char로 변경
SELECT manager_id, nvl(to_char(manager_id),'ceo') FROM EMPLOYEES; 

-- asc 오름차순(순차정렬)
SELECT * FROM EMPLOYEES ORDER BY SALARY ASC;
-- desc 내림차순(역순정렬)
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT emp_name FROM EMPLOYEES
WHERE emp_name LIKE '%a%'
ORDER BY emp_name DESC;

SELECT hire_date FROM EMPLOYEES
ORDER BY hire_date ASC;

-- member 테이블에서 이름을 순차정렬하시오.(asc안 붙여도 asc처리)
SELECT * FROM MEMBER ORDER BY name;

SELECT emp_name,nvl(to_char(MANAGER_ID),'ceo'), SALARY FROM EMPLOYEES
WHERE SALARY >= 8000
AND lower(emp_name) LIKE '%p%'	--p,P 포함 검색
ORDER BY salary DESC;

SELECT * FROM EMPLOYEES;

-- 이름에 z,Z가 있거나 email에 z,Z가 있는 사원을 출력하시오.
SELECT * FROM EMPLOYEES
WHERE lower(EMP_NAME) LIKE '%z%' OR lower(EMAIL) LIKE '%z%'

--- department_id로 순차정렬하고, salary로 역순정렬을 하시오.
SELECT * FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, salary desc;

--같은 부서내에 입사일이 빠른 사원부터 출력하시오.
SELECT DEPARTMENT_ID, HIRE_DATE FROM EMPLOYEES
ORDER BY DEPARTMENT_ID asc ,HIRE_DATE ASC;

-- nvl()
-- null
SELECT salary, nvl(commission_pct,0)+100 FROM EMPLOYEES;
SELECT salary, salary*commission_pct FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

--숫자함수
--절대값, 올림, 버림, 반올림
SELECT abs(-10), ceil(1.36), floor(10.598), round(10.598) FROM dual;

--반올림 소수점 자리수, 정수 반올림도 가능
SELECT round(10.259), round(10.259, 2), round(10.259, 3), round(35.2587, -1) FROM dual;

--trunc:버림, trunc(값,자리수)
SELECT TRUNC(34.5678,2), TRUNC(34.5678,-1) FROM dual;

--mode:나머지
SELECT mod(27,2), mod(27,5) FROM dual;

--사원번호가 홀수인 것을 출력하시오.
--employees, employee_id
SELECT employee_id FROM EMPLOYEES WHERE MOD(EMPLOYEE_ID,2)=1; 


--시퀸스함수:순차적으로 순번을 증가시킬때 사용하는 변수
--번호부여
CREATE sequence member_seq	--시퀸스생성
INCREMENT BY 1				--증감 1
START WITH 1 			--1부터 번호 시작
MINVALUE 1				--최소값
MAXVALUE 9999			--최대값
nocycle;					--nocycle:9999이후에는 에러
--cache 10;					--메모리에 시퀸스값 미리 할당

--시퀸스 증가
SELECT member_seq.nextval FROM dual;
--시퀸스 현재값확인
SELECT member_seq.currval FROM dual;

-- employee_seq 생성
CREATE sequence employee_seq	--시퀸스생성
INCREMENT BY 1				--증감 1
START WITH 1 			--1부터 번호 시작
MINVALUE 1				--최소값
MAXVALUE 9999			--최대값
nocycle					--nocycle:9999이후에는 에러
nocache;				--숫자를 미리 할당:속도느림

--시퀸스 수정
ALTER SEQUENCE employee_seq INCREMENT BY 2;

-- 시퀸스 삭제
DROP SEQUENCE employee_seq;

DROP TABLE board;

CREATE TABLE board (
	bno number(4) PRIMARY key,
	id varchar2(100),
	btitle varchar2(2000),
	bcontent clob,	--4Gb varchar2(4000byte)
	bgroup number(4),
	bstep number(4),
	bindent number(4),
	bhit number(4),
	bfile varchar2(1000),
	bdate date
);

INSERT INTO board values(
board_seq.nextval,'제목입니다.','내용입니다.',board_seq.currval,0,0,0,'1.jpg',sysdate
);


create table board (
	bno number(4) PRIMARY key,
	id varchar2(100),
	btitle varchar2(2000),
	bcontent clob,
	bgroup number(4),
	bstep number(4),
	bindent number(4),
	bhit number(4),
	bfile varchar2(1000),
	bdate DATE
);
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (1, 'ccc', 'Confidence', 'P O BOX 278', 1, 0, 0, 0, '1.jpg', '2025-07-07');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (2, 'ccc', 'Nashville', 'PIAZZA FILIPPO MEDA 4', 2, 0, 0, 0, '1.jpg', '2025-02-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (3, 'ccc', 'Orca: The Killer Whale', '202 MAIN STREET', 3, 0, 0, 0, '1.jpg', '2025-11-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (4, 'ccc', 'Nameless, The (Los sin nombre)', 'Schillerstraße 3', 4, 0, 0, 0, '1.jpg', '2025-06-17');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (5, 'ccc', 'Three Came Home', 'Hauptstraße 13', 5, 0, 0, 0, '1.jpg', '2025-07-21');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (6, 'ccc', 'New World, The', 'Wittenberger Straße 13-14', 6, 0, 0, 0, '1.jpg', '2025-09-07');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (7, 'ccc', 'Meatballs 4', '12 PLACE DES ETATS UNIS', 7, 0, 0, 0, '1.jpg', '2025-08-19');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (8, 'ccc', 'Mannequin', 'Leipziger Straße 4', 8, 0, 0, 0, '1.jpg', '2025-08-24');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (9, 'ccc', 'Surprise', 'Schupstraat, 18-20', 9, 0, 0, 0, '1.jpg', '2025-02-21');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (10, 'ccc', 'Mercy', 'PO BOX 168', 10, 0, 0, 0, '1.jpg', '2025-09-12');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (11, 'ccc', 'Richard III', 'SUITE 5', 11, 0, 0, 0, '1.jpg', '2025-05-12');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (12, 'ccc', 'Lives of a Bengal Lancer, The', '3RD FLOOR', 12, 0, 0, 0, '1.jpg', '2025-07-08');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (13, 'ccc', 'Point and Shoot', 'Avenida António Augusto de Aguiar, 132', 13, 0, 0, 0, '1.jpg', '2025-11-09');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (14, 'ccc', 'Sphere', 'Kirchgasse, 12', 14, 0, 0, 0, '1.jpg', '2025-07-12');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (15, 'ccc', 'Walker', 'PO BOX 7009', 15, 0, 0, 0, '1.jpg', '2025-08-27');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (16, 'ccc', 'Mary and Max', 'Kungsträdgårdsgatan 20', 16, 0, 0, 0, '1.jpg', '2024-12-07');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (17, 'ccc', 'Krays, The', '60 LIVINGSTON', 17, 0, 0, 0, '1.jpg', '2025-11-16');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (18, 'ccc', 'Breaking News (Daai si gin)', '4811 US ROUTE 5', 18, 0, 0, 0, '1.jpg', '2025-07-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (19, 'ccc', 'Zuzu Angel', 'P.O. BOX 643', 19, 0, 0, 0, '1.jpg', '2025-05-12');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (20, 'ccc', 'Emerald Cowboy', 'ul. Gizewiusza 2A', 20, 0, 0, 0, '1.jpg', '2025-04-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (21, 'ccc', 'Last Chance Harvey', 'Europaplatz, 1a', 21, 0, 0, 0, '1.jpg', '2025-05-05');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (22, 'ccc', 'Mostly Unfabulous Social Life of Ethan Green, The', '405 MAIN ST.', 22, 0, 0, 0, '1.jpg', '2025-03-24');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (23, 'ccc', 'They Wait', '814 MAIN STREET', 23, 0, 0, 0, '1.jpg', '2025-09-16');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (24, 'ccc', 'Horrorvision', 'Paulinenstraße 34', 24, 0, 0, 0, '1.jpg', '2025-04-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (25, 'ccc', 'Apostle Peter and The Last Supper', '201 N. WASHINGTON ST.', 25, 0, 0, 0, '1.jpg', '2024-11-29');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (26, 'ccc', 'Moving McAllister', 'P.O. BOX 1337', 26, 0, 0, 0, '1.jpg', '2025-07-03');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (27, 'ccc', 'Back to the Future Part III', 'PO BOX 85929', 27, 0, 0, 0, '1.jpg', '2025-08-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (28, 'ccc', 'Stray Cat Rock: Sex Hunter (Nora-neko rokku: Sekkusu hanta)', 'VIA NAZIONALE, 91', 28, 0, 0, 0, '1.jpg', '2025-05-10');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (29, 'ccc', 'Dabangg 2', '4140 EAST STATE STREET', 29, 0, 0, 0, '1.jpg', '2025-01-07');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (30, 'ccc', 'All Superheros Must Die', 'P7-PFSC-03-H', 30, 0, 0, 0, '1.jpg', '2025-10-04');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (31, 'ccc', 'Johnny Guitar', '306 S VERMONT', 31, 0, 0, 0, '1.jpg', '2024-12-15');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (32, 'ccc', 'Bakeneko: A Vengeful Spirit (Kaibyô nori no numa) (Ghost-Cat Cursed Pond, The)', '1200 E. WARRENVILLE RD', 32, 0, 0, 0, '1.jpg', '2025-03-18');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (33, 'ccc', 'Intruder, The', 'Kastenmaierstraße 1', 33, 0, 0, 0, '1.jpg', '2025-08-22');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (34, 'ccc', 'Creep Van', 'PO BOX 27025, VA2-430-01-01', 34, 0, 0, 0, '1.jpg', '2025-10-29');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (35, 'ccc', 'Bugs Bunny''s 3rd Movie: 1001 Rabbit Tales', '2910 W JACKSON STREET', 35, 0, 0, 0, '1.jpg', '2025-07-22');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (36, 'ccc', '5 Days of War', 'Ebinger Straße 33', 36, 0, 0, 0, '1.jpg', '2025-09-15');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (37, 'ccc', 'Rookie, The', 'Main Street, Rathfarnham,', 37, 0, 0, 0, '1.jpg', '2025-04-14');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (38, 'ccc', 'Old San Francisco', 'P.O. BOX 1037', 38, 0, 0, 0, '1.jpg', '2025-10-15');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (39, 'ccc', 'Doll, The (Lalka)', '80, route d''Esch', 39, 0, 0, 0, '1.jpg', '2025-11-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (40, 'ccc', 'Passengers', 'MAC N9301-041', 40, 0, 0, 0, '1.jpg', '2025-07-05');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (41, 'ccc', 'Nico Icon', 'Hoveniersstraat, 29', 41, 0, 0, 0, '1.jpg', '2025-01-16');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (42, 'ccc', 'Barbarian Invasions, The (Les invasions barbares)', '2ND FLOOR', 42, 0, 0, 0, '1.jpg', '2025-01-27');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (43, 'ccc', 'Phantasm III: Lord of the Dead', '110 EAST RACE STREET', 43, 0, 0, 0, '1.jpg', '2024-12-30');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (44, 'ccc', 'Prom Night', 'Im Heiligengarten 3', 44, 0, 0, 0, '1.jpg', '2025-07-31');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (45, 'ccc', 'Edward Scissorhands', 'VIA CERNAIA, 7', 45, 0, 0, 0, '1.jpg', '2024-12-03');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (46, 'ccc', 'Last of the Unjust, The (Dernier des injustes, Le)', 'Raiffeisenplatz, 1', 46, 0, 0, 0, '1.jpg', '2025-07-20');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (47, 'ccc', 'Amateurs, The (Moguls, The)', '12345 W COLFAX AVE', 47, 0, 0, 0, '1.jpg', '2024-12-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (48, 'ccc', 'Diary of Anne Frank, The', 'Victoriastraße 1-5', 48, 0, 0, 0, '1.jpg', '2025-02-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (49, 'ccc', 'Gett: The Trial of Viviane Amsalem', '5050 KINGSLEY DRIVE', 49, 0, 0, 0, '1.jpg', '2025-09-13');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (50, 'ccc', 'Music Never Stopped, The', '1620 DODGE STREET', 50, 0, 0, 0, '1.jpg', '2025-05-04');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (51, 'ccc', 'Being There', 'Schupstraat, 18-20', 51, 0, 0, 0, '1.jpg', '2025-09-17');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (52, 'ccc', 'King Boxer: Five Fingers of Death (Tian xia di yi quan)', 'PO BOX 32282', 52, 0, 0, 0, '1.jpg', '2025-07-05');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (53, 'ccc', 'War Comes to America (Why We Fight, 7)', 'Linzerstr., 14', 53, 0, 0, 0, '1.jpg', '2025-02-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (54, 'ccc', '8MM', 'BOX 37', 54, 0, 0, 0, '1.jpg', '2025-07-28');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (55, 'ccc', 'Eegah', '24 SECOND AVE SE', 55, 0, 0, 0, '1.jpg', '2025-03-06');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (56, 'ccc', 'Die Weihnachtsklempner', '535 BENT AVE', 56, 0, 0, 0, '1.jpg', '2025-04-15');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (57, 'ccc', 'Spawn', 'Virchowstraße 23', 57, 0, 0, 0, '1.jpg', '2025-10-29');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (58, 'ccc', 'Hard Luck', '340 MAIN STREET', 58, 0, 0, 0, '1.jpg', '2025-02-22');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (59, 'ccc', 'Return of Don Camillo, The (Retour de Don Camillo, Le)', '210 S MEKUSUKEY', 59, 0, 0, 0, '1.jpg', '2025-08-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (60, 'ccc', 'River Queen', 'Kahlenstraße 30-36', 60, 0, 0, 0, '1.jpg', '2025-05-10');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (61, 'ccc', 'Pusher', '1200 E WARRENVILLE ROAD', 61, 0, 0, 0, '1.jpg', '2025-04-18');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (62, 'ccc', 'Prinsessa Ruusunen', '69 AVENUE DE FLANDRE', 62, 0, 0, 0, '1.jpg', '2025-05-09');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (63, 'ccc', 'Marlene Dietrich: Shadow and Light', 'ROUTE DE PARIS', 63, 0, 0, 0, '1.jpg', '2025-07-15');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (64, 'ccc', 'Big Deal on Madonna Street (I Soliti Ignoti)', 'PIAZZA FILIPPO MEDA 4', 64, 0, 0, 0, '1.jpg', '2025-08-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (65, 'ccc', 'Kisses for My President', '56 RUE DE LILLE', 65, 0, 0, 0, '1.jpg', '2025-10-24');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (66, 'ccc', 'The Wind in the Willows', '1 PENNS WAY', 66, 0, 0, 0, '1.jpg', '2025-05-18');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (67, 'ccc', 'Countess, The', 'CORSO DELLA REPUBBLICA, 126', 67, 0, 0, 0, '1.jpg', '2025-07-27');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (68, 'ccc', 'Björk at the Royal Opera House', '3RD FLOOR', 68, 0, 0, 0, '1.jpg', '2025-01-09');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (69, 'ccc', 'American Reunion (American Pie 4)', 'Sarsfield Street, Mountmellick,', 69, 0, 0, 0, '1.jpg', '2025-11-19');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (70, 'ccc', 'Deadline at Dawn', '5800 SAN DARIO', 70, 0, 0, 0, '1.jpg', '2025-07-11');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (71, 'ccc', 'Our Nixon', 'PO BOX 27025, VA2-430-01-01', 71, 0, 0, 0, '1.jpg', '2025-04-09');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (72, 'ccc', 'Decoys 2: Alien Seduction ', 'St. Rise Landevej 10', 72, 0, 0, 0, '1.jpg', '2025-10-12');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (73, 'ccc', 'Across the Sea of Time', '715 WILSON ST', 73, 0, 0, 0, '1.jpg', '2024-11-29');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (74, 'ccc', 'Three Marias, The (Três Marias, As)', 'P O BOX 738', 74, 0, 0, 0, '1.jpg', '2025-03-19');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (75, 'ccc', 'Every Day', 'Klosterplatz, 1', 75, 0, 0, 0, '1.jpg', '2025-08-02');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (76, 'ccc', 'Girl', 'VIA VITTORIO ALFIERI', 76, 0, 0, 0, '1.jpg', '2025-01-22');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (77, 'ccc', 'Maborosi (Maboroshi no hikari)', '3RD FLOOR', 77, 0, 0, 0, '1.jpg', '2025-05-11');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (78, 'ccc', 'Yamla Pagla Deewana 2', '5050 KINGSLEY DRIVE', 78, 0, 0, 0, '1.jpg', '2025-05-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (79, 'ccc', 'Aaja Nachle', '112 WEST FULTON STREET', 79, 0, 0, 0, '1.jpg', '2025-04-19');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (80, 'ccc', 'Welcome to Macintosh', 'PIAZZA FILIPPO MEDA 4', 80, 0, 0, 0, '1.jpg', '2025-09-18');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (81, 'ccc', 'All at Sea', 'Skäve Magasin', 81, 0, 0, 0, '1.jpg', '2025-01-23');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (82, 'ccc', 'Young One, The', 'VIA APPIA KM. 118,600', 82, 0, 0, 0, '1.jpg', '2025-10-20');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (83, 'ccc', 'Three Stars', 'Gartenstraße 19', 83, 0, 0, 0, '1.jpg', '2025-02-07');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (84, 'ccc', 'The Sea Chase', '4201 SOUTH TREADAWAY BLVD.', 84, 0, 0, 0, '1.jpg', '2025-02-01');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (85, 'ccc', 'Cemetery Man (Dellamorte Dellamore)', 'VIA CERNAIA, 7', 85, 0, 0, 0, '1.jpg', '2025-11-17');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (86, 'ccc', 'Dead Silence', 'PO BOX 85929', 86, 0, 0, 0, '1.jpg', '2025-09-29');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (87, 'ccc', 'St. Elmo''s Fire', 'VIALE ALTIERO SPINELLI, 30', 87, 0, 0, 0, '1.jpg', '2024-12-24');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (88, 'ccc', 'Snows of Kilimanjaro, The (Neiges du Kilimandjaro, Les)', 'PO BOX 727', 88, 0, 0, 0, '1.jpg', '2025-08-08');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (89, 'ccc', 'King of the Jungle', 'P O BOX 277', 89, 0, 0, 0, '1.jpg', '2025-07-15');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (90, 'ccc', 'Gladiators, The (Gladiatorerna)', '1715 25TH STREET', 90, 0, 0, 0, '1.jpg', '2025-06-05');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (91, 'ccc', 'Fatso', 'AV DE ALEJANDRO ROSELLÓ, 8', 91, 0, 0, 0, '1.jpg', '2025-04-21');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (92, 'ccc', 'Surprise', 'Industrivej Syd 13', 92, 0, 0, 0, '1.jpg', '2025-09-04');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (93, 'ccc', 'Munekata Sisters, The (Munekata kyôdai)', '110 S FERRALL STREET', 93, 0, 0, 0, '1.jpg', '2025-08-23');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (94, 'ccc', 'Bling: A Planet Rock', 'Lower Friars Walk', 94, 0, 0, 0, '1.jpg', '2025-08-10');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (95, 'ccc', 'Lad: A Dog', '150 ALMADEN BLVD', 95, 0, 0, 0, '1.jpg', '2025-02-27');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (96, 'ccc', 'Zatoichi Goes to the Fire Festival (Zatôichi abare-himatsuri) (Zatôichi 21)', 'ACH OPERATIONS 100-99-04-10', 96, 0, 0, 0, '1.jpg', '2025-08-02');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (97, 'ccc', 'Ju-on: The Curse', 'MAC N9301-041', 97, 0, 0, 0, '1.jpg', '2025-06-26');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (98, 'ccc', 'My Friend Irma Goes West', 'VA2-430-01-01', 98, 0, 0, 0, '1.jpg', '2025-08-20');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (99, 'ccc', 'Sink the Bismark!', 'BOX 40', 99, 0, 0, 0, '1.jpg', '2025-03-09');
insert into board (bno, id, btitle, bcontent, bgroup, bstep, bindent, bhit, bfile, bdate) values (100, 'ccc', 'Beauty Shop', '39, allée Scheffer', 100, 0, 0, 0, '1.jpg', '2025-03-13');


SELECT * FROM board;

SELECT bno FROM board
ORDER BY bno DESC;

INSERT INTO board values(
board_seq.nextval,'aaa','제목입니다.','내용입니다.',board_seq.currval,0,0,0,'1.jpg',sysdate
);

SELECT board_seq.nextval FROM dual;


select * from employees where salary >= 6000;

DROP TABLE board;

DROP TABLE MAJOR_COLLECT;

DROP TABLE MEMBER;

DROP TABLE SEOUL_GRADE;

DROP TABLE SEOUL_STU;

DROP TABLE STUDENT;
DROP TABLE STUDENT2;
DROP TABLE UNI_STU;
DROP TABLE ZMEMBER;

DROP TABLE stuscore;

create table board (
	bno number(4) PRIMARY key,
	btitle VARCHAR2(2000),
	bcontent clob,
	id varchar2(100),
	bgroup number(4),
	bstep number(4),
	bindent number(4),
	bhit number(4),
	bfile varchar2(1000),
	bdate DATE
);
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (1, 'Navigators, The', '1200 E. WARRENVILLE RD', 'aaa', 1, 0, 0, 0, '1.jpg', '2025-11-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (2, 'The African', '2ND FLOOR', 'aaa', 2, 0, 0, 0, '1.jpg', '2025-07-23');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (3, 'Mon oncle d''Amérique', '1 RUE VICTOR BASCH CS 70001', 'bbb', 3, 0, 0, 0, '1.jpg', '2025-04-30');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (4, 'Graduation Day', 'Bahnhofstraße 21-29', 'aaa', 4, 0, 0, 0, '1.jpg', '2025-04-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (5, 'Why Man Creates', 'VA2-430-01-01', 'bbb', 5, 0, 0, 0, '1.jpg', '2025-04-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (6, 'Witch Way Love (Un amour de sorcière)', '1620 DODGE STREET', 'ccc', 6, 0, 0, 0, '1.jpg', '2024-12-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (7, 'Ghost Rider', 'PO BOX 550', 'bbb', 7, 0, 0, 0, '1.jpg', '2025-06-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (8, 'B*A*P*S', 'Goethestraße 36', 'aaa', 8, 0, 0, 0, '1.jpg', '2025-02-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (9, 'Asphalt', '6TH FLOOR', 'aaa', 9, 0, 0, 0, '1.jpg', '2025-03-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (10, 'Khroustaliov, My Car! (Khrustalyov, mashinu!)', '205 S FIFTH STREET', 'bbb', 10, 0, 0, 0, '1.jpg', '2025-10-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (11, 'Eternity and a Day (Mia aoniotita kai mia mera)', '3 Main Street, Wicklow Town,', 'ccc', 11, 0, 0, 0, '1.jpg', '2024-12-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (12, 'Flushed Away', 'Mönchstraße 24', 'ccc', 12, 0, 0, 0, '1.jpg', '2025-08-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (13, 'Forest Warrior', 'PIAZZA DEL CALENDARIO, 3', 'ccc', 13, 0, 0, 0, '1.jpg', '2025-08-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (14, 'To the Devil a Daughter', 'Friedrich Wilhelm Raiffeisen-Straße, 1', 'aaa', 14, 0, 0, 0, '1.jpg', '2025-06-20');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (15, 'Empire Records', 'PIAZZA FILIPPO MEDA 4', 'aaa', 15, 0, 0, 0, '1.jpg', '2025-06-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (16, 'Charlie Chan''s Courage', 'PIAZZA FILIPPO MEDA 4', 'bbb', 16, 0, 0, 0, '1.jpg', '2025-10-14');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (17, 'Story of Dr. Wassell, The', '101 NORTH CHICAGO STREET', 'aaa', 17, 0, 0, 0, '1.jpg', '2024-11-29');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (18, 'Miss Julie', 'Havenlaan, 2', 'bbb', 18, 0, 0, 0, '1.jpg', '2025-09-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (19, 'Spider-Man 2', 'Bahnhofstraße 9', 'ccc', 19, 0, 0, 0, '1.jpg', '2025-03-04');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (20, 'Back Street', 'PIAZZA AGLIARDI, 1', 'aaa', 20, 0, 0, 0, '1.jpg', '2025-09-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (21, 'House Party 3', 'PIAZZA SAN CARLO, 156', 'bbb', 21, 0, 0, 0, '1.jpg', '2025-09-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (22, 'Last Witness, The', 'Sarsfield Street, Mountmellick,', 'aaa', 22, 0, 0, 0, '1.jpg', '2025-03-15');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (23, 'Threesome', '7, rue du Saint Esprit', 'aaa', 23, 0, 0, 0, '1.jpg', '2024-12-17');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (24, 'Walker', '105 CITY AVE. N', 'aaa', 24, 0, 0, 0, '1.jpg', '2025-08-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (25, 'Traces of Red', 'ACH OPERATIONS 100-99-04-10', 'aaa', 25, 0, 0, 0, '1.jpg', '2025-10-20');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (26, 'Concert for George, The', '5050 KINGSLEY DRIVE', 'ccc', 26, 0, 0, 0, '1.jpg', '2025-11-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (27, 'Dark House', 'SUITE 330', 'aaa', 27, 0, 0, 0, '1.jpg', '2025-11-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (28, 'Volunteers', '811 MAIN', 'ccc', 28, 0, 0, 0, '1.jpg', '2025-04-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (29, 'Day of the Locust, The', 'P O BOX 291', 'bbb', 29, 0, 0, 0, '1.jpg', '2025-02-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (30, '100 Men and a Girl (One Hundred Men and a Girl)', 'Nesselwanger Straße 20', 'ccc', 30, 0, 0, 0, '1.jpg', '2025-01-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (31, 'Pekka ja Pätkä puistotäteinä', 'PIAZZA FILIPPO MEDA 4', 'ccc', 31, 0, 0, 0, '1.jpg', '2025-02-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (32, 'This Above All', 'Pz de San Nicolás, 4', 'bbb', 32, 0, 0, 0, '1.jpg', '2025-10-12');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (33, 'Bambi', 'VIA DEL MACELLO, 55', 'bbb', 33, 0, 0, 0, '1.jpg', '2025-09-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (34, 'Power of Nightmares, The: The Rise of the Politics of Fear', '220 S DETROIT ST', 'ccc', 34, 0, 0, 0, '1.jpg', '2025-01-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (35, 'Olympian Holiday (Loma) ', '110 S FERRALL STREET', 'bbb', 35, 0, 0, 0, '1.jpg', '2025-01-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (36, 'Mutant Action (Acción Mutante)', 'Bahnhofstraße, 9', 'bbb', 36, 0, 0, 0, '1.jpg', '2025-06-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (37, 'Renaissance Man', '245 COMMERCIAL STREET', 'ccc', 37, 0, 0, 0, '1.jpg', '2025-03-19');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (38, 'Cowboys & Aliens', 'Main Street, Rathfarnham,', 'bbb', 38, 0, 0, 0, '1.jpg', '2025-03-11');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (39, 'My Favorite Brunette', '202 E 11TH STREET', 'bbb', 39, 0, 0, 0, '1.jpg', '2025-07-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (40, 'Other People''s Money', 'PIAZZA FILIPPO MEDA 4', 'bbb', 40, 0, 0, 0, '1.jpg', '2025-08-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (41, 'Juwanna Mann', '320 N MAIN', 'ccc', 41, 0, 0, 0, '1.jpg', '2025-08-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (42, 'Time That Remains, The', '9600 W. BRYN MAWR', 'aaa', 42, 0, 0, 0, '1.jpg', '2025-03-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (43, 'Mishen (Target)', '2910 W. JACKSON ST', 'ccc', 43, 0, 0, 0, '1.jpg', '2025-05-20');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (44, 'Garden of Words, The (Koto no ha no niwa)', '200 WEST CONGRESS STREET', 'bbb', 44, 0, 0, 0, '1.jpg', '2024-12-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (45, 'Tuesday, After Christmas (Marti, dupa craciun)', '313 FREDERICA ST', 'aaa', 45, 0, 0, 0, '1.jpg', '2025-08-11');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (46, 'Prince of the City', 'Coolsingel 139', 'aaa', 46, 0, 0, 0, '1.jpg', '2025-04-17');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (47, 'Superstar: The Karen Carpenter Story', 'Schulstraße 38', 'aaa', 47, 0, 0, 0, '1.jpg', '2025-08-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (48, 'Empire of Silver (Bai yin di guo)', '12 PLACE DES ETATS UNIS CS 20001', 'bbb', 48, 0, 0, 0, '1.jpg', '2025-11-04');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (49, 'Pompeii', '1433 OXFORD STREET', 'aaa', 49, 0, 0, 0, '1.jpg', '2025-07-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (50, 'Land and Freedom (Tierra y libertad)', 'Teichstraße 24', 'bbb', 50, 0, 0, 0, '1.jpg', '2025-02-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (51, 'Mackintosh Man, The', '800 BROADWAY', 'ccc', 51, 0, 0, 0, '1.jpg', '2025-05-30');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (52, 'Dark Side of the Sun, The', '245 BELGRADE AVE', 'aaa', 52, 0, 0, 0, '1.jpg', '2025-11-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (53, 'Duck Season (Temporada de patos)', '610 W. RANDOL MILL RD.', 'aaa', 53, 0, 0, 0, '1.jpg', '2025-01-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (54, 'I''m Still Here', 'Bergstraße 6', 'ccc', 54, 0, 0, 0, '1.jpg', '2025-03-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (55, 'Mike Birbiglia: What I Should Have Said Was Nothing', '310 HOWARD STREET', 'ccc', 55, 0, 0, 0, '1.jpg', '2025-07-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (56, 'Mulan', 'DRAWER 840', 'bbb', 56, 0, 0, 0, '1.jpg', '2025-08-15');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (57, 'Afflicted', 'Luitpoldstraße 14', 'aaa', 57, 0, 0, 0, '1.jpg', '2025-05-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (58, 'X-Files: I Want to Believe, The', 'Main Street, Manorhamilton,', 'bbb', 58, 0, 0, 0, '1.jpg', '2025-03-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (59, 'Are All Men Pedophiles', '118 JEFFERSON STREET', 'aaa', 59, 0, 0, 0, '1.jpg', '2025-09-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (60, 'Tenth Man, The', '333 E MAIN STREET', 'bbb', 60, 0, 0, 0, '1.jpg', '2025-04-27');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (61, 'Night They Raided Minsky''s, The (Night They Invented Striptease, The)', 'VIA NAZIONALE APPULA, 29', 'ccc', 61, 0, 0, 0, '1.jpg', '2025-08-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (62, 'Mistaken for Strangers', 'Bažnyčios g. 11', 'ccc', 62, 0, 0, 0, '1.jpg', '2025-07-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (63, 'Flintstones in Viva Rock Vegas, The', 'MAC N9301-041', 'bbb', 63, 0, 0, 0, '1.jpg', '2025-06-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (64, 'Hanna', '1220 E WARRENVILLE RD', 'aaa', 64, 0, 0, 0, '1.jpg', '2025-05-30');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (65, 'The Second Best Exotic Marigold Hotel', '80 SUGAR CREEK CENTER BLVD', 'bbb', 65, 0, 0, 0, '1.jpg', '2025-11-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (66, 'Man of Her Dreams (a.k.a. The Fiancé)', 'PIAZZA FILIPPO MEDA 4', 'aaa', 66, 0, 0, 0, '1.jpg', '2025-10-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (67, 'America''s Most Haunted Inns', '333 E MAIN ST', 'aaa', 67, 0, 0, 0, '1.jpg', '2024-12-31');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (68, 'Carnosaur 3: Primal Species', '28, Boulevard de Kockelscheuer', 'aaa', 68, 0, 0, 0, '1.jpg', '2024-12-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (69, 'Lucky Break (a.k.a. Paperback Romance)', '5050 KINGSLEY DRIVE', 'ccc', 69, 0, 0, 0, '1.jpg', '2025-10-29');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (70, 'Act of Killing, The', '1460 VALLEY RD', 'ccc', 70, 0, 0, 0, '1.jpg', '2025-10-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (71, 'Angst', '100 N. MARKET ST.', 'ccc', 71, 0, 0, 0, '1.jpg', '2025-06-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (72, 'Way Out West', 'VIALE ALTIERO SPINELLI, 30', 'ccc', 72, 0, 0, 0, '1.jpg', '2025-10-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (73, 'Hoodoo Ann', 'SUITE 5', 'bbb', 73, 0, 0, 0, '1.jpg', '2025-04-14');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (74, 'Sergeant York', 'PO BOX 1578', 'aaa', 74, 0, 0, 0, '1.jpg', '2025-08-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (75, 'Early Years: Erik Nietzsche Part 1, The (De unge år: Erik Nietzsche)', 'Landsvägen 40', 'bbb', 75, 0, 0, 0, '1.jpg', '2025-06-19');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (76, 'Syriana', 'Marktstraße 16', 'bbb', 76, 0, 0, 0, '1.jpg', '2024-12-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (77, 'Go-Between, The', 'THIRD FLOOR', 'aaa', 77, 0, 0, 0, '1.jpg', '2025-07-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (78, 'Sandlot, The', '12 PLACE DES ETATS UNIS', 'bbb', 78, 0, 0, 0, '1.jpg', '2025-09-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (79, 'Still Alice', 'VIA CERNAIA, 7', 'ccc', 79, 0, 0, 0, '1.jpg', '2025-04-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (80, 'Five Fingers', '1460 VALLEY ROAD', 'bbb', 80, 0, 0, 0, '1.jpg', '2025-10-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (81, 'Flesh for Frankenstein (a.k.a. Andy Warhol''s Frankenstein)', '1300 11TH STREET', 'ccc', 81, 0, 0, 0, '1.jpg', '2025-02-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (82, 'Officer and a Gentleman, An', 'Augustaanlage 61', 'aaa', 82, 0, 0, 0, '1.jpg', '2025-06-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (83, 'Boo to You Too! Winnie the Pooh', 'VIA GIANFRANCESCO MALFATTI, 2', 'bbb', 83, 0, 0, 0, '1.jpg', '2024-12-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (84, 'The Butterfly Effect', 'NY-31-17-0119', 'aaa', 84, 0, 0, 0, '1.jpg', '2025-11-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (85, 'Skyline', 'P.O. BOX 67', 'bbb', 85, 0, 0, 0, '1.jpg', '2025-06-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (86, 'Horror of Dracula (Dracula)', 'Raiffeisenplatz 1', 'bbb', 86, 0, 0, 0, '1.jpg', '2024-12-15');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (87, 'As You Like It', 'Hans-Strothoff-Platz 1', 'bbb', 87, 0, 0, 0, '1.jpg', '2025-11-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (88, 'Casshern', 'SUITE 600', 'bbb', 88, 0, 0, 0, '1.jpg', '2024-12-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (89, 'Squall, The', '1 PENNS WAY', 'ccc', 89, 0, 0, 0, '1.jpg', '2025-08-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (90, 'Skippy', 'Wallstraße 1', 'ccc', 90, 0, 0, 0, '1.jpg', '2024-12-31');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (91, 'Date with Judy, A', 'Am Ratsplatz 1', 'ccc', 91, 0, 0, 0, '1.jpg', '2025-03-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (92, 'Woodsman and the Rain (Kitsutsuki to ame)', 'PO BOX 1578', 'ccc', 92, 0, 0, 0, '1.jpg', '2025-11-12');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (93, 'Sheep Eaters (Lampaansyöjät)', 'Bridgetown, Kerrykeel, Letterkenny,', 'bbb', 93, 0, 0, 0, '1.jpg', '2025-04-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (94, 'Nicholas on Holiday', 'NY-31-17-0119', 'ccc', 94, 0, 0, 0, '1.jpg', '2025-09-21');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (95, 'Corridor, The (Koridorius)', 'VA2-430-01-01', 'bbb', 95, 0, 0, 0, '1.jpg', '2025-10-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (96, 'Deadly Voyage', 'VIA IV NOVEMBRE, 13', 'ccc', 96, 0, 0, 0, '1.jpg', '2025-07-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (97, 'Wonderful and Loved by All (Underbar och älskad av alla)', 'Teréz körút 55-57.', 'ccc', 97, 0, 0, 0, '1.jpg', '2025-02-17');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (98, 'King Kong Lives', '18 AVENUE FRANCOISE GIROUD', 'aaa', 98, 0, 0, 0, '1.jpg', '2025-10-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (99, '28 Hotel Rooms', '8001 VILLA PARK DRIVE', 'bbb', 99, 0, 0, 0, '1.jpg', '2025-05-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (100, 'Magnificent Obsession', 'Junghofstraße 26', 'ccc', 100, 0, 0, 0, '1.jpg', '2025-05-26');

create table member (
	id VARCHAR2(50) PRIMARY key,
	pw varchar2(4),
	name VARCHAR2(100),
	phone CHAR(13),
	email VARCHAR2(50),
	gender VARCHAR2(50),
	hobby varchar2(100)
);
insert into member (id, pw, name, phone, email, gender, hobby) values ('aaa', '1111', '홍길동', '527-250-1397', 'scourtman0@dion.ne.jp', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('bbb', '1111', '유관순', '464-698-2424', 'ltalmadge1@dmoz.org', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('ccc', '1111', '이순신', '732-250-3907', 'mrudman2@google.de', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('ddd', '1111', '강감찬', '455-174-5334', 'cfarlham3@msn.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('eee', '1111', '김구', '458-294-4527', 'cblythe4@java.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('fff', '1111', '김유신', '151-966-6939', 'jszymanek5@purevolume.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('ggg', '1111', '홍길순', '326-398-0593', 'sansell6@china.com.cn', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('hhh', '1111', '홍길자', '786-945-7245', 'vgibbin7@upenn.edu', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('iii', '1111', '관순스', '584-239-6651', 'cstenton8@utexas.edu', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('jjj', '1111', '순신스', '535-344-5994', 'fphilipard9@wunderground.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('kkk', '1111', '감찬스', '644-171-1968', 'rwhitehaira@issuu.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Barnewille', '1111', 'Lucine', '704-602-1273', 'lbarnewilleb@networksolutions.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Alflatt', '1111', 'Gregoire', '470-817-1993', 'galflattc@fda.gov', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Christofor', '1111', 'Connie', '466-719-4839', 'cchristoford@meetup.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Jura', '1111', 'Diana', '154-148-7078', 'djurae@buzzfeed.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Melmeth', '1111', 'Alphonse', '811-152-1582', 'amelmethf@psu.edu', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Booton', '1111', 'Niall', '692-100-0794', 'nbootong@ehow.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Banbrick', '1111', 'Natasha', '394-106-0369', 'nbanbrickh@surveymonkey.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lankford', '1111', 'Ethelin', '382-623-9853', 'elankfordi@canalblog.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Showalter', '1111', 'Elisabetta', '277-470-2640', 'eshowalterj@macromedia.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('De La Coste', '1111', 'Randie', '295-985-0650', 'rdelacostek@fotki.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Rous', '1111', 'Francisco', '339-721-0899', 'frousl@omniture.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lenthall', '1111', 'Gaelan', '897-984-7916', 'glenthallm@wp.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Franke', '1111', 'Lauryn', '865-535-1689', 'lfranken@last.fm', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Stockbridge', '1111', 'Brinn', '989-610-6322', 'bstockbridgeo@independent.co.uk', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Hollindale', '1111', 'Rourke', '566-532-2815', 'rhollindalep@netscape.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Phelipeaux', '1111', 'Patrizia', '244-855-4793', 'pphelipeauxq@yolasite.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Stemson', '1111', 'Spense', '608-568-3646', 'sstemsonr@miibeian.gov.cn', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Keymar', '1111', 'Kris', '157-427-1011', 'kkeymars@drupal.org', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Sherston', '1111', 'Everett', '322-625-5779', 'esherstont@nhs.uk', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Sich', '1111', 'Claudine', '194-334-2189', 'csichu@domainmarket.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Tubritt', '1111', 'Farlee', '807-884-9633', 'ftubrittv@twitpic.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Janecek', '1111', 'Krisha', '779-416-6908', 'kjanecekw@goo.gl', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Comrie', '1111', 'Rog', '766-388-5018', 'rcomriex@diigo.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Ings', '1111', 'Magnum', '181-270-8173', 'mingsy@oracle.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Craig', '1111', 'Dolores', '173-229-0127', 'dcraigz@cnet.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Antonovic', '1111', 'Oralie', '831-488-2460', 'oantonovic10@indiegogo.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Baake', '1111', 'Arman', '249-634-1188', 'abaake11@jalbum.net', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Tendahl', '1111', 'Roxana', '906-907-2794', 'rtendahl12@marriott.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Tivnan', '1111', 'Bail', '345-391-4878', 'btivnan13@themeforest.net', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Pideon', '1111', 'Dorice', '361-878-6398', 'dpideon14@msn.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lissaman', '1111', 'Templeton', '566-139-5253', 'tlissaman15@businesswire.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Brashier', '1111', 'Isidoro', '413-427-7127', 'ibrashier16@dmoz.org', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Di Giacomettino', '1111', 'Abigale', '258-724-6027', 'adigiacomettino17@networksolutions.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Duerden', '1111', 'Kurt', '296-272-4836', 'kduerden18@uol.com.br', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Bendel', '1111', 'Portie', '439-362-1630', 'pbendel19@google.it', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Battams', '1111', 'Wandie', '852-913-3363', 'wbattams1a@npr.org', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Redihalgh', '1111', 'Ryan', '711-912-9665', 'rredihalgh1b@sciencedirect.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Garnam', '1111', 'Vivyan', '582-433-4246', 'vgarnam1c@alexa.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Thomerson', '1111', 'Alexina', '684-246-3396', 'athomerson1d@reference.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Akrigg', '1111', 'Jamey', '610-234-4562', 'jakrigg1e@msn.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Aitkenhead', '1111', 'Hunter', '553-749-3805', 'haitkenhead1f@opera.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Tremblot', '1111', 'Faye', '424-969-7848', 'ftremblot1g@opera.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Heaney`', '1111', 'Weider', '242-747-0906', 'wheaney1h@washingtonpost.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Hugli', '1111', 'Marlyn', '208-211-1744', 'mhugli1i@icio.us', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Guyver', '1111', 'Daune', '860-751-2583', 'dguyver1j@vistaprint.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Duchart', '1111', 'Dallas', '925-312-2096', 'dduchart1k@github.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Lidierth', '1111', 'Roshelle', '352-867-1641', 'rlidierth1l@barnesandnoble.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Oldroyde', '1111', 'Gert', '401-688-0461', 'goldroyde1m@facebook.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Coyne', '1111', 'Nestor', '707-931-1487', 'ncoyne1n@xing.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Little', '1111', 'Carlota', '577-946-2995', 'clittle1o@skyrock.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Legan', '1111', 'Carmine', '575-551-6397', 'clegan1p@army.mil', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Dyshart', '1111', 'Arlana', '660-779-0504', 'adyshart1q@trellian.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Grazier', '1111', 'Sheryl', '696-881-6623', 'sgrazier1r@geocities.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Blewitt', '1111', 'Amye', '756-315-3374', 'ablewitt1s@cbslocal.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Beves', '1111', 'Morgan', '539-181-3243', 'mbeves1t@psu.edu', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Gilham', '1111', 'Had', '635-429-2110', 'hgilham1u@wisc.edu', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Soughton', '1111', 'Roley', '695-148-6404', 'rsoughton1v@oaic.gov.au', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Dowell', '1111', 'Caressa', '571-288-8449', 'cdowell1w@addthis.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Eads', '1111', 'Kurt', '926-419-4261', 'keads1x@fc2.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Arnholtz', '1111', 'Jodee', '925-115-1229', 'jarnholtz1y@yellowbook.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Caltun', '1111', 'Aleta', '811-760-9300', 'acaltun1z@japanpost.jp', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Matteoni', '1111', 'Maximo', '586-789-1710', 'mmatteoni20@usgs.gov', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Botler', '1111', 'Niko', '210-996-2292', 'nbotler21@furl.net', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Matuschek', '1111', 'Virgie', '419-923-5700', 'vmatuschek22@weebly.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Pardey', '1111', 'Redford', '519-534-4942', 'rpardey23@cbc.ca', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Pengilley', '1111', 'Rosamund', '462-688-6258', 'rpengilley24@liveinternet.ru', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Robinet', '1111', 'Dane', '253-638-7169', 'drobinet25@gmpg.org', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Melby', '1111', 'Padget', '167-552-6132', 'pmelby26@bbc.co.uk', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Hixley', '1111', 'Rowena', '616-252-8125', 'rhixley27@ning.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Eberle', '1111', 'Hilary', '938-855-1003', 'heberle28@nydailynews.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Milbourne', '1111', 'Northrup', '110-399-4422', 'nmilbourne29@surveymonkey.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Auchterlony', '1111', 'Yvon', '770-601-0501', 'yauchterlony2a@smugmug.com', 'M', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Thonason', '1111', 'Veronica', '861-537-5625', 'vthonason2b@dion.ne.jp', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Petris', '1111', 'Roderich', '984-241-0460', 'rpetris2c@elpais.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Wilsee', '1111', 'Roxanna', '939-666-4977', 'rwilsee2d@admin.ch', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Broadfield', '1111', 'Cherin', '594-427-1320', 'cbroadfield2e@yellowpages.com', 'F', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Ridgley', '1111', 'Jermaine', '586-423-7229', 'jridgley2f@wsj.com', 'M', '골프');
insert into member (id, pw, name, phone, email, gender, hobby) values ('McCreery', '1111', 'Kelly', '706-462-4747', 'kmccreery2g@google.co.jp', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Swyer-Sexey', '1111', 'Lynnette', '312-651-9792', 'lswyersexey2h@huffingtonpost.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Easterfield', '1111', 'Ellerey', '297-728-3581', 'eeasterfield2i@ibm.com', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Wadley', '1111', 'Kyla', '357-853-6076', 'kwadley2j@upenn.edu', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Slad', '1111', 'Kingston', '793-861-7193', 'kslad2k@51.la', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Jiru', '1111', 'Stormy', '646-149-1655', 'sjiru2l@list-manage.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Matsell', '1111', 'Lesly', '937-557-3187', 'lmatsell2m@va.gov', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Hanbury-Brown', '1111', 'Vivian', '616-317-0290', 'vhanburybrown2n@jimdo.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Nayer', '1111', 'Myrna', '844-977-1315', 'mnayer2o@samsung.com', 'F', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Liversidge', '1111', 'Olwen', '625-502-3708', 'oliversidge2p@purevolume.com', 'F', '조깅');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Crunden', '1111', 'Benedicto', '636-946-0937', 'bcrunden2q@miibeian.gov.cn', 'M', '게임');
insert into member (id, pw, name, phone, email, gender, hobby) values ('Eastham', '1111', 'Dillie', '151-519-9374', 'deastham2r@mtv.com', 'M', '조깅');


create table stuscore (
	sno number(4) PRIMARY key,
	name VARCHAR2(100),
	kor number(3),
	eng number(3),
	math number(3),
	total number(3),
	avg number(10,7),
	sdate DATE
);
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (1, 'Florette', 75, 24, 12, 111, 37, '2025-02-27');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (2, 'Eimile', 70, 31, 98, 199, 66.3333333333, '2025-02-26');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (3, 'Katrina', 35, 54, 56, 145, 48.3333333333, '2025-10-02');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (4, 'Nert', 45, 45, 77, 167, 55.6666666667, '2024-12-11');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (5, 'Eugenia', 63, 79, 69, 211, 70.3333333333, '2025-01-14');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (6, 'Barris', 90, 95, 37, 222, 74, '2024-12-17');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (7, 'Clarke', 45, 77, 14, 136, 45.3333333333, '2025-07-21');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (8, 'Kippy', 4, 91, 63, 158, 52.6666666667, '2025-07-07');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (9, 'Farand', 89, 47, 42, 178, 59.3333333333, '2025-05-19');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (10, 'Miran', 5, 80, 50, 135, 45, '2025-03-29');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (11, 'Lilly', 83, 67, 24, 174, 58, '2025-08-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (12, 'Lucho', 54, 64, 54, 172, 57.3333333333, '2025-10-24');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (13, 'Nickolaus', 67, 50, 7, 124, 41.3333333333, '2025-08-09');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (14, 'Maible', 94, 17, 7, 118, 39.3333333333, '2025-04-07');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (15, 'Thacher', 41, 21, 100, 162, 54, '2025-02-20');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (16, 'Skipper', 90, 78, 43, 211, 70.3333333333, '2025-08-07');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (17, 'Franzen', 52, 51, 97, 200, 66.6666666667, '2025-10-23');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (18, 'Samara', 52, 53, 41, 146, 48.6666666667, '2025-05-15');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (19, 'Tuesday', 52, 18, 35, 105, 35, '2025-10-22');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (20, 'Hephzibah', 76, 11, 66, 153, 51, '2025-08-27');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (21, 'Kelcie', 17, 23, 44, 84, 28, '2025-01-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (22, 'Sigfrid', 56, 19, 61, 136, 45.3333333333, '2025-07-16');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (23, 'Gabbie', 88, 32, 90, 210, 70, '2025-06-14');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (24, 'Wilmette', 44, 29, 24, 97, 32.3333333333, '2025-02-23');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (25, 'Lenette', 18, 23, 88, 129, 43, '2025-08-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (26, 'Annadiana', 36, 23, 80, 139, 46.3333333333, '2025-10-24');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (27, 'Cale', 1, 10, 81, 92, 30.6666666667, '2025-09-11');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (28, 'Emory', 94, 47, 97, 238, 79.3333333333, '2025-11-20');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (29, 'Estel', 39, 97, 6, 142, 47.3333333333, '2025-09-30');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (30, 'Tandy', 25, 27, 1, 53, 17.6666666667, '2025-01-29');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (31, 'Roderigo', 18, 91, 84, 193, 64.3333333333, '2025-09-16');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (32, 'Vita', 93, 96, 10, 199, 66.3333333333, '2025-05-22');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (33, 'Paige', 74, 83, 9, 166, 55.3333333333, '2025-01-09');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (34, 'Trace', 68, 56, 38, 162, 54, '2025-04-20');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (35, 'Dale', 67, 87, 94, 248, 82.6666666667, '2025-01-21');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (36, 'Conney', 47, 42, 55, 144, 48, '2025-01-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (37, 'Annalee', 66, 91, 47, 204, 68, '2025-11-02');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (38, 'Juliana', 11, 47, 16, 74, 24.6666666667, '2025-10-04');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (39, 'Tybalt', 47, 52, 55, 154, 51.3333333333, '2025-06-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (40, 'Ebonee', 87, 96, 49, 232, 77.3333333333, '2025-08-12');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (41, 'Kaleena', 73, 73, 21, 167, 55.6666666667, '2025-04-15');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (42, 'Annamarie', 77, 82, 66, 225, 75, '2024-12-21');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (43, 'Elisha', 57, 11, 54, 122, 40.6666666667, '2025-03-12');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (44, 'Christabella', 31, 57, 15, 103, 34.3333333333, '2025-03-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (45, 'Yorgos', 42, 4, 51, 97, 32.3333333333, '2025-10-28');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (46, 'Andrew', 58, 72, 21, 151, 50.3333333333, '2025-07-21');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (47, 'Garvy', 66, 96, 9, 171, 57, '2025-08-14');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (48, 'Adriaens', 82, 20, 44, 146, 48.6666666667, '2025-02-24');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (49, 'Boote', 60, 3, 61, 124, 41.3333333333, '2025-02-27');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (50, 'Cordie', 95, 7, 66, 168, 56, '2025-06-19');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (51, 'Breena', 20, 20, 62, 102, 34, '2025-06-03');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (52, 'Jaymee', 28, 29, 73, 130, 43.3333333333, '2024-12-29');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (53, 'Farrell', 54, 7, 40, 101, 33.6666666667, '2025-05-25');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (54, 'Allegra', 62, 61, 2, 125, 41.6666666667, '2024-12-04');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (55, 'Vivia', 12, 82, 90, 184, 61.3333333333, '2025-06-26');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (56, 'Sandra', 1, 45, 79, 125, 41.6666666667, '2025-05-29');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (57, 'Mari', 78, 48, 9, 135, 45, '2025-04-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (58, 'Gibby', 16, 27, 59, 102, 34, '2025-01-31');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (59, 'Catina', 3, 53, 21, 77, 25.6666666667, '2025-07-16');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (60, 'Lynnelle', 58, 30, 39, 127, 42.3333333333, '2025-03-07');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (61, 'Jana', 35, 94, 4, 133, 44.3333333333, '2025-02-16');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (62, 'Bourke', 31, 90, 42, 163, 54.3333333333, '2025-06-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (63, 'Goran', 97, 13, 84, 194, 64.6666666667, '2025-08-22');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (64, 'Chloette', 67, 82, 59, 208, 69.3333333333, '2025-06-03');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (65, 'Elene', 59, 96, 88, 243, 81, '2025-08-18');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (66, 'Archibaldo', 85, 89, 22, 196, 65.3333333333, '2025-04-03');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (67, 'Tobe', 19, 54, 53, 126, 42, '2025-09-03');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (68, 'Petrina', 16, 9, 29, 54, 18, '2025-06-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (69, 'Vittoria', 92, 34, 70, 196, 65.3333333333, '2025-01-28');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (70, 'Hana', 70, 79, 50, 199, 66.3333333333, '2025-06-30');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (71, 'Eunice', 19, 40, 46, 105, 35, '2025-05-24');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (72, 'Miriam', 47, 28, 93, 168, 56, '2025-07-30');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (73, 'Daphene', 33, 96, 18, 147, 49, '2025-03-10');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (74, 'Debra', 53, 7, 42, 102, 34, '2025-10-02');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (75, 'Bryan', 14, 3, 88, 105, 35, '2025-06-07');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (76, 'Vivyan', 47, 11, 75, 133, 44.3333333333, '2025-11-04');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (77, 'Marlena', 93, 70, 66, 229, 76.3333333333, '2024-12-02');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (78, 'Petronilla', 67, 20, 44, 131, 43.6666666667, '2025-03-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (79, 'Noble', 28, 94, 82, 204, 68, '2025-11-22');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (80, 'Doro', 35, 100, 22, 157, 52.3333333333, '2025-06-16');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (81, 'Aharon', 27, 4, 98, 129, 43, '2025-02-19');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (82, 'Deena', 49, 42, 73, 164, 54.6666666667, '2025-04-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (83, 'Wyndham', 35, 35, 87, 157, 52.3333333333, '2025-06-23');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (84, 'Guglielmo', 8, 100, 85, 193, 64.3333333333, '2025-06-23');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (85, 'Vikki', 47, 12, 29, 88, 29.3333333333, '2025-07-19');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (86, 'Hernando', 85, 57, 60, 202, 67.3333333333, '2025-07-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (87, 'Levon', 23, 54, 25, 102, 34, '2025-01-21');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (88, 'Wells', 16, 58, 42, 116, 38.6666666667, '2025-04-28');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (89, 'Cristabel', 21, 100, 63, 184, 61.3333333333, '2025-04-05');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (90, 'Oswald', 100, 88, 69, 257, 85.6666666667, '2025-08-11');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (91, 'Dusty', 11, 23, 57, 91, 30.3333333333, '2025-03-28');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (92, 'Heindrick', 33, 36, 81, 150, 50, '2025-09-06');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (93, 'Verla', 27, 40, 73, 140, 46.6666666667, '2025-03-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (94, 'Chilton', 65, 53, 39, 157, 52.3333333333, '2025-07-02');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (95, 'Wilmette', 32, 21, 42, 95, 31.6666666667, '2025-10-01');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (96, 'Jacenta', 36, 70, 54, 160, 53.3333333333, '2025-01-11');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (97, 'Paolina', 91, 83, 51, 225, 75, '2025-01-26');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (98, 'Karalee', 32, 82, 43, 157, 52.3333333333, '2024-12-21');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (99, 'Paxton', 98, 96, 93, 287, 95.6666666667, '2025-11-14');
insert into stuscore (sno, name, kor, eng, math, total, avg, sdate) values (100, 'Wendell', 71, 23, 6, 100, 33.3333333333, '2025-10-13');


SELECT * FROM board ORDER BY bno;

SELECT * FROM MEMBER;

SELECT * FROM stuscore ORDER BY sno;

UPDATE stuscore SET avg = total/3;

ALTER TABLE stuscore MODIFY avg NUMBER(10,7);

SELECT * FROM STUSCORE ORDER BY kor DESC ,eng asc;

CREATE sequence stuscore_seq;

SELECT stuscore_seq.nextval FROM dual;

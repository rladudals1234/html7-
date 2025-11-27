import oracledb

def getConnection():
    return oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")

# db연결실행
conn = getConnection()
cursor = conn.cursor()
# 월급    년봉        원화          =>천단위 ,표시해서 출력
# -------------------------------
# 2000   2000*12    2000*12*1743

# query = "select salary, to_char(salary*12,'999,999,999'), to_char(salary*12*1743,'999,999,999,999') from employees"
# cursor.execute(query)
# rows = cursor.fetchall()
# print(f"월급\t\t년봉\t\t원화")
# print("-"*50)
# for row in rows:
#     print("{}\t{}\t{}".format(*row))
# conn.close()

####
while True:
    score = int(input("점수를 입력하시오.>> "))
    # 입력한 점수보다 합계점수가 높은 학생이 몇명인지 출력하시오.
    # stuscore테이블 total컬럼을 비교해서
    # 입력한 점수보다 점수가 높은 학생이 몇명인지 출력하시오.
    cursor.execute(f"select count(*) from stuscore where total > {score}")
    row = cursor.fetchone()
    print("입력 :", score)
    print("입력한 점수보다 높은 학생수 : ",row[0])
    
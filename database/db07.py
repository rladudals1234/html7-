# choice = input("숫자를 입력하시오.>> ").strip() #공백제거
# if choice == "1":
#     print("정답")
# else:
#     print("오답")

import oracledb

def getConnection():
    return oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")

# db연결실행
conn = getConnection()
cursor = conn.cursor()
# 1. member테이블에서 phone컬럼을 분리해서 가져와서
# 국번 전화번호1 전화번호2
#----------------------
# 527 250      1397
query = "select substr(phone,1,3), substr(phone,5,3), substr(phone,9,4) from member"
cursor.execute(query)
rows = cursor.fetchall()
print(f"국번\t전화번호1\t전화번호2")
print("-"*50)
for row in rows:
    print("{}\t{}\t{}".format(*row))

# 2. member테이블에서 phone컬럼을 가져와서 파이썬에서 분리해서 출력
query = "select phone from member"
cursor.execute(query)
rows = cursor.fetchall()
print(f"국번\t전화번호1\t전화번호2")
print("-"*50)
for row in rows:
    # row1 = row[0].split("-")[0].strip()
    # row2 = row[0].split("-")[1].strip()
    # row3 = row[0].split("-")[2].strip()
    # print("{}\t{}\t{}".format(row1, row2, row3))
    phone = row[0].split("-")
    # phone = [p.strip() for p in row[0].split("-")]    # 안에 추가로 for문 사용되서 X (strip)
    print("{}\t{}\t{}".format(*phone))
conn.close()

import oracledb

def getConnection():
    return oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")

conn = getConnection()
# print("연결 : ",conn)

# query구문
query = "select * from member"  ##sql실행
cursor = conn.cursor()          ##창
cursor.execute(query)
# 데이터를 가져옴.
rows = cursor.fetchall()
# 데이터출력
for row in rows:
    print(row)
print("-"*100)
conn.close()
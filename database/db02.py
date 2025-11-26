import oracledb

# arr = [1,2,3,4,5]
# print(arr[2])

def getConnection():
    return oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")

conn = getConnection()
# query = "select * from member where name like '%홍%'"
# query = "select * from member where name like '%홍%'"
# query = "select * from employees where salary in(6000,7000,8000)"
query = "select ID,PW,NAME,PHONE,EMAIL,GENDER,HOBBY from member"
cursor = conn.cursor()
cursor.execute(query)
rows = cursor.fetchall()
print(f"아이디\t비밀번호\t이름\t전화번호\t이메일\t성별\t취미")
for row in rows:
    #print(f"{row[0]}\t{row[1]}\t{row[2]}\t{row[3]}\t{row[4]}\t{row[5]}\t{row[6]}")
    print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*row))
    #print(row)
conn.close()

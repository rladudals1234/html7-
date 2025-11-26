import oracledb

def getConnection():
    conn = oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")
    print("연결 : ",conn)
    return conn

conn = getConnection()
cursor = conn.cursor()
cursor.execute("select * from stuscore order by kor desc, eng asc")
rows = cursor.fetchall()

for row in rows:
    print("{}\t{:15s}{}\t{}\t{}\t{}\t{:.2f}\t{}\t".format(*row))
    #print(f"{row[0]}\t{row[1]}\t{row[2]}\t{row[3]}\t{row[4]}\t{row[5]}\t{row[6]}\t{row[7]}")
conn.close()

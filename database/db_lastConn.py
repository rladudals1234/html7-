import oracledb

def getConnection():
    conn = oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")
    print("연결 : ",conn)
    return conn
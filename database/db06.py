import oracledb

def getConnection():
    conn = oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")
    cursor = conn.cursor()
    return conn, cursor
def insertData(name, kor, eng, math, total, avg):
    conn, cursor = getConnection()
    cursor.execute(f"insert into stuscore(sno,name,kor,eng,math,total,avg,sdate)\
        values(stuscore_seq.nextval,'{name}',{kor}, {eng}, {math}, {total}, {avg}, sysdate)")
    conn.commit()
    conn.close()

def updateData(sno, name, kor, eng, math, total, avg):
    conn, cursor = getConnection()
    cursor.execute(f"update stuscore set name='{name}',kor={kor},eng={eng},math={math},total={total},avg={avg}, sdate=sysdate where sno={sno}")
    conn.close()
    
def searchData(sno):
    conn, cursor = getConnection()
    cursor.execute("select * from stuscore where 1=1 and sno={sno} order by sno asc")
    rows = cursor.fetchall()
    conn.close()
    return rows

def deleteData(sno):
    conn, cursor = getConnection()
    cursor.execute(f"delete from stuscore where sno={sno}")
    conn.commit()
    conn.close()

title = ["번호","이름","국어","영어","수학","합계","평균","날짜"]
while True:
    print("1.입력")
    print("2.출력")
    print("3.수정")
    print("4.삭제")
    print("0.종료")
    choice = input("원하는 번호를 입력하시오.>> ")
    if choice == "1":
        print("[ 학생성적입력 ]")
        name = input("이름을 입력하시오.>> ")
        kor = int(input("국어점수를 입력하시오.>> "))
        eng = int(input("영어점수를 입력하시오.>> "))
        math = int(input("수학점수를 입력하시오.>> "))
        total = kor+eng+math
        avg = total/3
        insertData(name, kor, eng, math, total, avg)
    elif choice == "2":
        print("[ 학생성적출력 ]")
        print("-"*100)
        print("{}\t{:13s}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
        #print("번호\t학생명\t국어\t영어\t수학\t합계\t평균\t날짜")
        print("-"*100)
        conn, cursor = getConnection()
        cursor.execute("select * from stuscore order by sno asc")
        rows = cursor.fetchall()
        for row in rows:
            print("{}. {}".format(*row))
        print("-"*100)
        conn.close()
    elif choice == "3":
        print("[ 학생성적수정 ]")
        
        #updateData(sno, name, kor, eng, math, total, avg)
    elif choice == "4":
        print("[ 학생성적삭제 ]")
        conn, cursor = getConnection()
        conn.close()
    elif choice == "0":
        print("[ 프로그램을 종료 ]")
        break
    
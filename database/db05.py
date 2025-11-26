import oracledb

def getConnection():
    return oracledb.connect(user="ora_user", password="1111", dsn="localhost:1521/xe")

conn = getConnection()
cursor = conn.cursor()
cursor.execute("select * from stuscore order by kor desc, eng asc")
rows = cursor.fetchall()
title = ["번호","이름","국어","영어","수학","합계","평균","날짜"]
while True:
    print("[ 학생성적프로그램 ]")
    print("-"*70)
    print("1.학생성적입력")
    print("2.학생성적출력")
    print("3.학생성적수정")
    print("4.학생성적삭제")
    print("0.프로그램종료")
    print("-"*70)
    choice = input("원하는 번호를 입력하시오.>> ")
    if choice == "1":
        print("[ 학생성적입력 ]")
        name = input("이름을 입력하시오.>> ")
        kor = int(input("국어점수를 입력하시오.>> "))
        eng = int(input("영어점수를 입력하시오.>> "))
        math = int(input("수학점수를 입력하시오.>> "))
        total = kor+eng+math
        avg = total/3
        cursor.execute(f"insert into stuscore(sno,name,kor,eng,math,total,avg,sdate)\
            values(stuscore_seq.nextval,'{name}',{kor}, {eng}, {math}, {total}, {avg}, sysdate)")
        conn.commit()
    elif choice == "2":
        print("[ 학생성적출력 ]")
        print("-"*100)
        print("{}\t{:13s}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
        #print("번호\t학생명\t국어\t영어\t수학\t합계\t평균\t날짜")
        print("-"*100)
        cursor.execute("select * from stuscore order by sno asc")
        rows = cursor.fetchall()
        for row in rows:
            print("{}\t{:13s}\t{}\t{}\t{}\t{}\t{:.2f}\t{}\t".format(*row))
        print("-"*100)
    elif choice == "3":
        print("[ 학생성적수정 ]")
        cursor.execute("select * from stuscore order by sno asc")
        rows = cursor.fetchall()
        for row in rows:
            print("{}. {}".format(*row))
        sno = int(input("수정할 학생번호를 입력하시오.>> "))
        name = input("수정할 이름을 입력하시오.>> ")
        kor = int(input("수정할 국어점수를 입력하시오.>> "))
        eng = int(input("수정할 영어점수를 입력하시오.>> "))
        math = int(input("수정할 수학점수를 입력하시오.>> "))
        total = kor+eng+math
        avg = total/3
        cursor.execute(f"update stuscore set kor={kor},eng={eng},math={math},total={total},avg={avg} where sno={sno}")
        conn.commit()
    elif choice == "4":
        print("[ 학생성적삭제 ]")
        cursor.execute("select * from stuscore order by sno asc")
        rows = cursor.fetchall()
        for row in rows:
            print("{}. {}".format(*row))
        sno = int(input("삭제할 학생번호를 입력하시오.>> "))
        if input("정말삭제하시겠습니까? (y/n)>> ") == "y":
            cursor.execute("delete from stuscore where sno={}".format(sno))
            conn.commit()
    elif choice == "0":
        print("[ 프로그램을 종료합니다. ]")
        print()
        break
conn.close()
from db_lastConn import *
title = ["번호","이름","국어","영어","수학","합계","평균","날짜","등수","등급"]

# 1. 성적입력 - stuscore3테이블 : 데이터 없음
def stuInput():
    conn = getConnection()
    cursor = conn.cursor()
    name = input("이름을 입력하세요.>> ")
    kor = int(input("국어점수를 입력하세요.>> "))
    eng = int(input("영어점수를 입력하세요.>> "))
    math = int(input("수학점수를 입력하세요.>> "))
    total = kor + eng + math
    avg = total / 3
    query=f"insert into stuscore3 (sno, name, kor, eng, math, total, avg, sdate, rank, grade) \
        values (stuscore3_seq.nextval,'{name}', {kor}, {eng}, {math}, {total}, {avg}, sysdate, 0, '')"
    cursor.execute(query)
    conn.commit()
    conn.close()
    print(name,"학생성적이 입력되었습니다.")

# 2. 성적출력 - stuscore3테이블 : 데이터 있음
def stuOutput():
    conn = getConnection()
    cursor = conn.cursor()
    query = "select * from stuscore3 order by sno"
    cursor.execute(query)
    rows = cursor.fetchall()
    print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
    print("-"*80)
    for r in rows:
        # print(datetime.datetime.strftime(r[7],"%Y-%m-%d"))
        # print("{}\t{}\t{}\t{}\t{}\t{}\t{:.2f}\t{}\t{}\t{}\t{}".format(*r))
        print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}\t{r[4]}\t{r[5]}\t{r[6]:.2f}\t{r[7].strftime("%Y-%m-%d")}\t{r[8]}\t{r[9]}")
    conn.close()

# 3. 성적수정
# def stuUpdate():
#     conn = getConnection()
#     cursor = conn.cursor()
#     name = input("수정할 학생이름을 입력하세요.>> ")
#     if not name:
#         print("이름을 입력하지 않았습니다. 수정이 취소됩니다.")
#         conn.close()
#         return
#     query = f"select * from stuscore3 where name like '%{name}%'"
#     cursor.execute(query)
#     rows = cursor.fetchall()
#     if len(rows)>0:
#         print("{}\t{}\t".format(*title))
#         print("-"*80)
#         for r in rows:
#             print(f"{r[0]}\t{r[1]}")
#     else:
#         print("수정하려는 학생성적이 없습니다.")
#         conn.close()
#         return
#     sno = input("해당 학생들 중에 수정하려는 학생번호를 입력하세요.>>")
#     query = f"select * from stuscore3 where sno = {sno} and name like '%{name}%'"
#     cursor.execute(query)
#     r = cursor.fetchone()
#     # r = list(r)  # 튜플로 넘어와서 수정이 안됨. -> 리스트 타입으로 변경
#     if r:
#         print("1. 이름 수정")
#         print("2. 국어점수 수정")
#         print("3. 영어점수 수정")
#         print("4. 수학점수 수정")
#         print("5. 전체성적 수정")
#         print("0. 수정 취소")
#         choice = input("메뉴에서 번호를 선택하세요.>> ")
#         stuname = ""
#         kor = ""
#         eng = ""
#         math = ""
#         if choice == "1":
#             stuname = input("수정할 이름을 입력하세요.>> ")
#         elif choice == "2":
#             kor = int(input("수정할 국어점수를 입력하세요.>> "))
#             # r[2]                           # 현재 국어점수(다른 DB에서 수정할 수 있어서 제거) - 빠른 작성으로 받아서 사용해도 상관없음
#             # r[choice] = int(input(f"수정할 {title[choice]}점수를 입력하세요.>> ")) - 전체 성적 수정없으면 choice조건절 없어도 됨(r[choice+1])
#             # r[5] = r[2] + r[3] + r[4] - kor # 수정 후 합계
#         elif choice == "3":
#             eng = int(input("수정할 영어점수를 입력하세요.>> "))
#         elif choice == "4":
#             math = int(input("수정할 수학점수를 입력하세요.>> "))
#         elif choice == "5":
#             kor = int(input("수정할 국어점수를 입력하세요.>> "))
#             eng = int(input("수정할 영어점수를 입력하세요.>> "))
#             math = int(input("수정할 수학점수를 입력하세요.>> "))
#         else:
#             print("수정하려는 항목이 없습니다.")
#             conn.close()
#             return
#         ''' query = f"""
#         update stuscore3 set kor={r[2]}, eng={r[3]}, math={r[4]} 
#         total={r[2]+r[3]+r[4]}, avg={(r[2]+r[3]+r[4])/3}
#         where sno={r[0]}
#         """ '''
#         updates = []
#         if stuname != "":
#             updates.append(f"name='{stuname}'")
#         if kor != "":
#             updates.append(f"kor={kor}")
#         if eng != "":
#             updates.append(f"eng={eng}")
#         if math != "":
#             updates.append(f"math={math}")
#         query = f"update stuscore3 set {','.join(updates)} where sno={sno}"
#         cursor.execute(query)
#         query = f"update stuscore3 set total=kor+eng+math, avg=(kor+eng+math)/3 where sno={sno}"
#         cursor.execute(query)
#         conn.commit()
#         conn.close()
#         print(sno,"번 학생성적이 수정되었습니다.")
#     else:
#         print("입력한 학생번호가 존재하지 않습니다.")
#         conn.close()
#         return

# 3. 학생성적수정
def stuUpdate():
    ## 3.성적수정
    # 1) 학생검색
    name = input("수정하려는 학생이름을 입력하세요.>> ")
    # db연결
    conn = getConnection()
    cursor = conn.cursor()
    query = f"select * from stuscore3 where name like '%{name}%'"
    cursor.execute(query)
    rows = cursor.fetchall()
    # print("개수 : ",len(rows))
    # 출력부분
    print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}".format(*title))
    print("-"*80)
    if len(rows)>0:
        for r in rows:
            print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}\t{r[4]}\t{r[5]}\t{r[6]:.2f}\t{r[7].strftime("%y-%m-%d")}\t{r[8]}\t{r[9]}")
        print()
        choice = input("수정하려는 학생번호(sno)를 입력하세요.>> ")
        query = f"select * from stuscore3 where sno = {choice}"
        cursor.execute(query)
        r = cursor.fetchone()
        r = list(r)  # 튜플타입을 리스트타입으로 변경
        if r:
            print(f"[ {r[1]} 학생 성적수정 ]")
            print("1. 국어점수")
            print("2. 영어점수")
            print("3. 수학점수")
            choice2 = int(input("원하는 과목을 선택하세요.>> "))
            # title[2] 국어, title[3] 영어, title[4] 수학
            if 1<= choice2 <= 3:
                print(f"{title[choice2+1]} 현재점수 : ",r[choice2+1])
                r[choice2+1] = int(input(f"{title[choice2+1]} 변경 점수를 입력하세요.>> "))
                r[5] = r[2]+r[3]+r[4]
                r[6] = r[5]/3
                query = f"""
                update stuscore3 set kor={r[2]},eng={r[3]},math={r[4]},
                total={r[5]},avg={r[6]}
                where sno={r[0]}
                """
                cursor.execute(query)
                conn.commit()
                conn.close()
                print(f"{title[choice2+1]} 과목수정을 완료하였습니다. ")
            else:
                print("과목선택을 잘못하셨습니다. 다시 입력하세요.")
            print()
        else:
            print("번호를 잘못 입력하셨습니다. 다시 시작해주세요.")
    else:
        print("수정하려는 학생이 없습니다. 다시 검색하세요. ")
    print()

# 4. 성적삭제
def stuDelete():
    conn = getConnection()
    cursor = conn.cursor()
    name = input("삭제하려는 학생이름을 입력하세요.>> ")
    query = f"select * from stuscore3 where name like '%{name}%'"
    cursor.execute(query)
    r = cursor.fetchone()
    if r:   # 검색해서 있을 경우
        print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
        print("-"*80)
        print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}\t{r[4]}\t{r[5]}\t{r[6]:.2f}\t{r[7].strftime('%Y-%m-%d')}\t{r[8]}\t{r[9]}")
    else:
        print("삭제하려는 학생성적이 없습니다.")
        conn.close()
        return
    choice = input("정말 학생성적을 삭제하시겠습니까? (1.삭제/0.취소) >> ")
    if choice == "1":
        query = f"delete from stuscore3 where name='{name}'"  # 여러행의 이름이 동일한 경우 주의
        cursor.execute(query)
        conn.commit()
        conn.close()
        print(name,"학생이 성적이 삭제되었습니다.")
    else:
        print(f"{name} 학생 삭제가 취소되었습니다.")
        conn.close()
        return

# 5. 학생검색
def stuSearch():
    conn = getConnection()
    cursor = conn.cursor()
    name = input("검색할 학생이름을 입력하세요.>> ")
    query = f"select * from stuscore3 where name like '%{name}%'"
    cursor.execute(query)
    rows = cursor.fetchall()
    print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
    print("-"*80)
    if len(rows)>0:
        for r in rows:
            print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}\t{r[4]}\t{r[5]}\t{r[6]:.2f}\t{r[7].strftime('%Y-%m-%d')}\t{r[8]}\t{r[9]}")
    else:
        print("검색된 학생이 없습니다.")
    conn.close()

# 5. 학생검색(수정)
def stuSearch2():
    conn = getConnection()
    cursor = conn.cursor()
    sno = input("수정하려는 학생번호를 입력하세요.>> ")
    query = f"select * from stuscore3 where 1=1 and sno = {sno}"
    cursor.execute(query)
    r = cursor.fetchone()
    if r:
        print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
        print("-"*80)
        print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}\t{r[4]}\t{r[5]}\t{r[6]:.2f}\t{r[7].strftime('%Y-%m-%d')}\t{r[8]}\t{r[9]}")
    else:
        print("검색된 학생이 없습니다.")
    conn.close()

# 6. 학생성적정렬
def stuOrder():
    print("1. 학생이름")
    print("2. 학생성적")
    choice = input("원하는 번호를 선택하세요.>> ")
    orderby = ""
    if choice == "1":
        orderby = " order by name asc"
    else:
        orderby = " order by total desc"
    conn = getConnection()
    cursor = conn.cursor()
    query = "select * from stuscore3"+orderby
    cursor.execute(query)
    rows = cursor.fetchall()
    print("{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\t".format(*title))
    print("-"*80)
    for r in rows:
        print(f"{r[0]}\t{r[1]}\t{r[2]}\t{r[3]}\t{r[4]}\t{r[5]}\t{r[6]:.2f}\t{r[7].strftime('%Y-%m-%d')}\t{r[8]}\t{r[9]}")
    conn.close()

# 7. 등수처리
def stuRank():
    conn = getConnection()
    cursor = conn.cursor()
    query = f"""UPDATE stuscore3 a SET 
            rank=(
                SELECT ranks from(
                    SELECT rank() over(ORDER BY avg desc) ranks, sno FROM stuscore3 b
                ) b
                WHERE a.sno = b.sno
            )"""
    cursor.execute(query)
    conn.commit()
    conn.close()
    print("등수처리가 완료되었습니다.")

# 8. 등급처리
def stuGrade():
    conn = getConnection()
    cursor = conn.cursor()
    query = f"""UPDATE stuscore3 a SET 
            grade = (
            SELECT b.grade FROM scoregrade b WHERE a.avg BETWEEN b.LOWGRADE AND b.HIGHGRADE
            )"""
    cursor.execute(query)
    conn.commit()
    conn.close()
    print("등급처리가 완료되었습니다.")
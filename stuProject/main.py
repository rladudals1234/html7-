# import db_lastConn
from stuConnect import *
from stuFunc import *


while True:
    print(" [   학생성적 처리 프로그램   ]")
    print("1. 성적입력")
    print("2. 성적출력")
    print("3. 성적수정")
    print("4. 성적삭제")
    print("5. 학생검색")
    print("6. 학생정렬")
    print("7. 등수처리")
    print("0. 프로그램종료")
    choice = input("원하는 번호를 입력하세요 : ")
    if choice == "1":
        print("학생성적입력")
        stuInput()
    elif choice == "2":
        print("학생성적출력")
        stuOutput()
    elif choice == "3":
        print("학생성적수정")
        stuUpdate()
    elif choice == "4":
        print("학생성적삭제")
        stuDelete()
    elif choice == "5":
        print("학생검색")
        stuSearch()
    elif choice == "6":
        print("학생정렬")
        stuOrder()
    elif choice == "7":
        print("등수처리")
        stuRank()
    elif choice == "0":
        print("프로그램종료")
        break
#List_Homework_01
student_name=["May","Jack","William"]
for i in range(2,0,-1):
    print(student_name[i],end=" ")
print(student_name[0])
#List_Homework_02
#在去利用個數來求平均數之前先利用條件判斷確認個數不為0，來避免因為個數為0而有分子不可為0的錯誤。
#List_Homework_03
times=eval(input("請輸入您要輸入幾個數字:"))
data=[]
for i in range(times):
    data.append(eval(input(f"第{i+1}個數字:")))
print(sorted(data))
print(sorted(data,reverse=True))
print(sorted(data)[-1])
print(sorted(data)[0])
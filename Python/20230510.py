#Class_Homework_01
class airline:
    L=["台北倫敦","台北東京","台北紐約"]
    P=["50000","8000","60000"]
    A=["英國航空","日本航空","長榮航空"]
    def __init__(self,l,p,a):
        self.l=l
        self.p=p
        self.a=a
    def __repr__(self):
        return f"{self.A[self.a]}-{self.L[self.l]}-{self.P[self.p]}"
print(airline(2,2,2))
#Format_Homework_01
import random
number=[]
string=""
for i in range(10):
    number.append(i)
for i in range(4):
    string+=str(number.pop(random.randint(0,len(number)-1)))
print(string)
#Format_Homework_02
import random
number=[]
string=""
for i in range(10):
    number.append(i)
for i in range(4):
    string+=str(number.pop(random.randint(0,len(number)-1)))
while True:
    A=0
    B=0
    temp=input("請輸入一個不重複四位數字(有出現然後位置也正確的話會有一個A，有出現但位置錯誤的話會有一個B，都不正確不會增加A或B):")
    x=set(temp)
    if len(x) <4:
        print('你輸入的並非四位數或有重複！')
        continue
    elif temp==string:
        print("恭喜你猜對了!")
        break
    else:
        for i in range(4):
            if temp[i] in string:
                if temp[i]==string[i]:
                    A+=1
                else:
                    B+=1
        print(f"{A}A{B}B")
        print("還沒對，繼續")
#Format_Homework_03
a=input("請輸入生日:")
a_list=a.split("/")
bir_month=int(a_list[0])
bir_day=int(a_list[1])
month_end=[31,29,31,30,31,30,31,31,30,31,30,31]
sign_day=[20,19,21,20,21,22,23,23,23,23,24,23,22]
sign_name=["魔羯座","水瓶座","雙魚座","白羊座","金牛座","雙子座","巨蟹座","獅子座","處女座","天秤座","天蠍座","射手座"]
print(f"生日{bir_month}月{bir_day}日，是",end="")
if bir_month>12 or bir_day>month_end[bir_month-1]:
    print("輸入不存在的日期，無法轉換。")
elif bir_day<sign_day[bir_month-1]:
    print(sign_name[bir_month-1]+"。")
elif bir_day>sign_day[bir_month-1] and bir_day<month_end[bir_month-1]:
    print(sign_name[bir_month]+"。")
else:
    if bir_month<len(sign_name):
        print(sign_name[bir_month]+"。")
    else:
        print(sign_name[bir_month-len(sign_name)]+"。")
#Format_Homework_04
kanji=["年","月","日"]
a=input("請輸入年月日，(例:2021年1月1日):")
for i in kanji:
    a=a.replace(i,"/")
a=a.rstrip("/")
a_list=a.split("/")
string=""
for i in range(len(a_list)):
    if i!=0:
        if len(a_list[i])==1:
            a_list[i]="0"+a_list[i]
    string+=a_list[i]
print(f"數字字串:{string}")
#Read_and_Write_File_Homework_01
import random
w=["但我不能放歌","悄悄是別離的笙簫","夏蟲也為我沉默","沉默是今晚的康橋","悄悄的我走了","正如我悄悄的來","我揮一揮衣袖","不帶走一片雲彩"]
n=random.randint(1,3)
f=open("file.csv","a")
for i in range(n):
    m=random.randint(3,5)
    p=random.sample(w,m)
    print(" ".join(p),file=f)
#Numpy_Homework_01
import numpy as np
jpy=np.array([13000,8000,15000,50000])
twd=jpy*0.26
discount=twd*0.98
for i in range(len(discount)):
    if discount[i]>=3000 and discount[i]<=4000:
        print(f"第{i+1}間符合預算")
    elif discount[i]<3000:
        print(f"第{i+1}間低於預算")
    else:
        print(f"第{i+1}間高於預算")
#Numpy_Homework_02
import numpy as np
A_w=np.array([40,60,70])
B_w=np.array([60,50,65])
A_h=np.array([150,168,176])
B_h=np.array([180,170,140])
BMI_A=A_w/((A_h/100)**2)
BMI_B=B_w/((B_h/100)**2)
print("A班學生BMI列表:")
for i in BMI_A:
    print(round(i,2))
print("B班學生BMI列表:")
for i in BMI_B:
    print(round(i,2))
print(f"A班BMI平均:{round(BMI_A.sum()/len(BMI_A),2)}")
print(f"B班BMI平均:{round(BMI_B.sum()/len(BMI_B),2)}")
print("以上數值皆僅取至小數點後第二位")
#Numpy_Homework_03
import numpy as np
jpy=np.array([13000,8000,15000,50000])
twd=jpy*0.26
discount=twd*0.98
d_b_f=(discount>=3000) & (discount<=4000)
d_b_l=discount<3000
for i in range(len(d_b_f)):
    if d_b_f[i]:
        print(f"第{i+1}間符合預算")
    elif d_b_l[i]:
        print(f"第{i+1}間低於預算")
    else:
        print(f"第{i+1}間高於預算")
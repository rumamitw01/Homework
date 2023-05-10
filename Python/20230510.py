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
    elif temp =='給我答案':
            print(string)
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
#Class_Homework_01
class airline:
    L=["�x�_�۴�","�x�_�F��","�x�_�ì�"]
    P=["50000","8000","60000"]
    A=["�^����","�饻���","���a���"]
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
    temp=input("�п�J�@�Ӥ����ƥ|��Ʀr(���X�{�M���m�]���T���ܷ|���@��A�A���X�{����m���~���ܷ|���@��B�A�������T���|�W�[A��B):")
    x=set(temp)
    if len(x) <4:
        print('�A��J���ëD�|��ƩΦ����ơI')
        continue
    elif temp =='���ڵ���':
            print(string)
    elif temp==string:
        print("���ߧA�q��F!")
        break
    else:
        for i in range(4):
            if temp[i] in string:
                if temp[i]==string[i]:
                    A+=1
                else:
                    B+=1
        print(f"{A}A{B}B")
        print("�٨S��A�~��")
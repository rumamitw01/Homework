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
#Format_Homework_03
a=input("請輸入生日")
a_list=a.split("/")
month_end={1:31,2:29,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31}
star_sign_start={"Aries":,"Taurus":,"Gemini":,"Cancer":,"Leo":,"Virgo":,"Libra":,"Scorpio":,"Sagittarius":,"Capricorn":,"Aquarius":,"Pisces":}
star_sign_end={"Aries":,"Taurus":,"Gemini":,"Cancer":,"Leo":,"Virgo":,"Libra":,"Scorpio":,"Sagittarius":,"Capricorn":,"Aquarius":,"Pisces":}
'''牡羊座 Aries：3月21日~4月19日

金牛座 Taurus：4月20日~5月20日

雙子座 Gemini：5月21日~6月21日

巨蟹座 Cancer：6月22日~7月22日

獅子座 Leo：7月23日~8月22日

處女座 Virgo：8月23日~9月22日
天秤座 Libra：9月23日~10月23日

天蠍座 Scorpio：10月24日~11月21日

射手座 Sagittarius：11月22日～12月20日

摩羯座 Capricorn：12月21日 ~ 1月20日

水瓶座 Aquarius：1月21日 ~ 2月19日

雙魚座 Pisces：2月20日 ~ 3月20日
'''

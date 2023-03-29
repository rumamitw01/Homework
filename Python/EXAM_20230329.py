#1
n=int(input("大樓樓層總數："))
print("樓層：",end="")
temp=1
while temp<=(n-1):
    temp+=1
    if str(temp).count("1")>0:
        n+=1
        continue
    else:
        print(temp,end=",")
if str(temp+1).count("1")>0:
    print(temp+2)
else:
    print(temp+1)
#2
init_list=[38,25,28,1,16,29]
temp_list=[]
final_list=[]
for i in range(1,40):
    temp_list.append(i)
for j in temp_list:
    if init_list.count(j)!=0:
        final_list.append(j)
print(final_list)
#3
temp_list=[1000,1250,1500,2000]
money=0
temp=input("請輸入要結帳的商品(A:1000,B:1250,C:1500,2000)並以英文逗號隔開:")
t_list=temp.split(",")
for i in range(len(t_list)):
    money+=temp_list[ord(t_list[i])-65]*0.8
if money>3000:
    for j in range(len(sorted(t_list))-1,0,-1):
        money-=temp_list[ord(t_list[i])-65]*0.8
        t_list.pop()
        if money<3000:
            break
for k in t_list:
    print(k,end=",")
print(money)
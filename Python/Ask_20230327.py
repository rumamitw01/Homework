#移除逗號
n=int(input("give an integer"))
for i in range(1,n):
    print(i,end=",")
print(n)
#右上三角形
a=int(input())
for i in range(a):
    for j in range(i):
        print(" ",end="")
    for k in range(a-i,0,-1):
        print("*",end="")
    print("")
#右下三角形
a=int(input())
for i in range(a):
    for j in range(a-i,-1,-1):
        print(" ",end="")
    for k in range(i+1):
        print("*",end="")
    print("")
#空心等腰三角形
row=eval(input())
for i in range(row-1):
    for j in range(row-i,1,-1):
        print(" ",end="")
    for k in range(0,i*2+1):
        if k==0 or k==i*2:
            print("*",end="")
        else:
            print(" ",end="")
    print()
for k in range(0,(row-1)*2+1):
    print("*",end="")
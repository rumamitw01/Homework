#Expression_Homework_02
bs=input("Basic Salary:")
fee=input("Fee:")
eb=input("Extra Bonus:")
total=int(bs)+int(fee)+int(eb)
print("The total salary is",total)
#Expression_Homework_03
l=input("Length:")
w=input("Width:")
s=float(int(l)*int(w))
print("The area of rectangle is",s)
#if...else_Homework_01
'''
因為input讀入的型別為字串，
但是條件判斷的時候所給條件中的p2需要是整數，
所以程式才會判斷是Wrong。
'''
#if...else_Homework_02
temp_movie=[]
age=int(input("Please enter your age:"))
temp_movie.append("Frozen II")
if age>=6:
    temp_movie.append("Minions")
if age>=12:
    temp_movie.append("A Star Is Born")
if age>=18:
    temp_movie.append("Lust, Caution")
string=""
for i in range(0,len(temp_movie)-1):
    string+=temp_movie[i]+"\n"
string+=temp_movie[len(temp_movie)-1]
print("The following movie is suitable for you:")
print(string)
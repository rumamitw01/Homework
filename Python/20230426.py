#Function_Homework_01
def WC(kg):
    lb=kg*2.205
    return lb
i=float(input("Weight(Kilogram):"))
print(f"Weight(Pound):{WC(i)}")

#Function_Homework_02
mb=10000
day=6
p=divmod(mb,day)
print(f"Maximum Budget:${mb}")
print(f"Days of travel:{day} days")
print(f"Budget per day:${p[0]}")
print(f"Remain Budget:${p[1]}")

#Function_Homework_03
f=input("Filename:")
if f.lower().endswith("jpg"):
    print("Correct!")
else:
    print("Wrong format!")

#Function_Homework_04
data=[["Name","S1","S2","S3","S4"],
      ["Bill","34210","9000","186500","78900"],
      ["May","23600","23900","127800","125000"],
      ["Jack","145000","83400","100000","90000"]]
for i in range(len(data)):
    print(data[i][0].rjust(4),end=" ")
    for j in range(1,len(data[i])-1):
        if j==2:
            print(data[i][j].rjust(6),end=" ")
        else:
            print(data[i][j].rjust(7),end=" ")
    print(data[i][len(data)].rjust(7))

#Function_Homework_04_Another_Solution
data=["Name","S1","S2","S3","S4",
       "Bill","34210","9000","186500","78900",
       "May","23600","23900","127800","125000",
       "Jack","145000","83400","100000","90000"]
for i in range(len(data)-1):
    if i==0:
        print(data[i].rjust(4),end=" ")
        continue
    if i%5==0:
        print(data[i].rjust(4),end=" ")
    elif i%5==2:
        print(data[i].rjust(6),end=" ")
    else:
        print(data[i].rjust(7),end=" ")
    if i%5==4:
        print()
print(data[len(data)-1].rjust(7))
#Function_Homework_05
time="11:30:26"
print(time)
time=time.replace(":"," Hours ",1)
time=time.replace(":"," Minutes ",1)
time+=" Seconds"
print(time)

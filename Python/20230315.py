#for_loop_Homework_01
maxnum=int(input("Give an integer:"))
temp_odd=""
for i in range(0,maxnum+1):
    if i%2==1:
        temp_odd+=str(i)+" "
print(temp_odd.rstrip())
#for_loop_Homework_02
maxnum=int(input("Give an integer for number of layers:"))
for i in range(maxnum+1,1,-1):
    for j in range(i-2):
        print("@",end=" ")
    print("@")
#for_loop_Homework_03
maxfloor=int(input("Give an integer for truely highest floor number:"))
print(f"Floors:\n{maxfloor}")
print("Numbers")
for i in range(1,maxfloor+1):
    if i==4:
        print("",end="")
    else:
        print(i,end=" ")
print(maxfloor+1)
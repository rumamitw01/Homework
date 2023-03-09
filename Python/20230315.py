#for_loop_Homework_01
maxnum=int(input("Give an integer:"))
temp_odd=""
for i in range(0,maxnum+1):
    if i%2==1:
        temp_odd+=str(i)+" "
print(temp_odd.rstrip())
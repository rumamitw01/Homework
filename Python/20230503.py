#Map_and_Filter_and_Lambda_Homework_01
a=list(map(lambda x: int("2"*x),range(1,10)))
b=list(map(lambda y: y**2,a))
print(a)
print(b)
#Map_and_Filter_and_Lambda_Homework_02
a={"A":1360,"B":2500,"C":900,"D":7770,"E":5200}
item=list(filter(lambda x: x[1]<=4000,a.items()))
price=list(map(lambda y: y[1],item))
product=list(map(lambda y: y[0],item))
print(price)
print(product)
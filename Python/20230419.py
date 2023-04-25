#Dict_Homework_01
Season={"Spring":"Blossoming","Summer":"Hot","Fall":"Cool","Winter":"Cold"}
n=input("Season(Spring,Summer,Fall, or Winter):")
if Season.get(n) == None:
    print("The season doesn't exist.")
else:
    print(f"Season {n} is {Season.get(n)}.")
#Dict_Homework_02
Product={"iPhone":1000,"TV":500,"PC":800}
n=input("Product:")
if n in Product:
    print(f"{n}'s price is {Product[n]}.")
else:
    s=input("Price:")
    Product[n]=s
    print(Product)

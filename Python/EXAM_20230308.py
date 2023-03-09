#Q1
l=input("請輸入長度:")
w=input("請輸入寬度:")
print(f"長度 {l}，寬度 {w}，矩形面積 {float(l)*float(w)}")
#Q2
x=input("請輸入利率(每年%數):")
y=input("請輸入年限(年):")
z=input("請輸入目標金額(萬元):")
period=(1+(float(x)/100))**float(y)
first=(float(z)/period)*10000
print(f"儲蓄利率 {x}%，要達成{y}年{z}萬的目標，一開始需要儲存{round(first)}元")
#Q3
buy=float(input("請輸入消費金額:"))
if buy>=500 and buy<1000:
    discount=round(buy*0.1)
elif buy>=1000 and buy<2000:
    discount=round(buy*0.2)
elif buy>=2000:
    discount=round((buy*0.3))+100
else:
    discount=0
print(f"消費金額 {int(buy)}，優惠金額 {int(discount)}。")
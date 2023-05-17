#Pandas_Homework_01_1
import numpy as np
import pandas as pd
import gdown

url="https://drive.google.com/uc?id=1LWNCMAjTH1wWH918wQIHBPT0gyqFf1_d"
f="grade.csv"
gdown.download(url,f,quiet=False)
f=open("grade.csv","r",encoding="Big5")
t=pd.read_csv(f,engine="python")
t.head(3)

#Pandas_Homework_01_2
import numpy as np
import pandas as pd
import gdown

url="https://drive.google.com/uc?id=1LWNCMAjTH1wWH918wQIHBPT0gyqFf1_d"
f="grade.csv"
gdown.download(url,f,quiet=False)
f=open("grade.csv","r",encoding="Big5")
t=pd.read_csv(f,engine="python")
t.tail(3)

#Pandas_Homework_01_3
import numpy as np
import pandas as pd
import gdown

url="https://drive.google.com/uc?id=1LWNCMAjTH1wWH918wQIHBPT0gyqFf1_d"
f="grade.csv"
gdown.download(url,f,quiet=False)
f=open("grade.csv","r",encoding="Big5")
t=pd.read_csv(f,engine="python")
t.sample(3)

#Pandas_Homework_02
import numpy as np
import pandas as pd
import gdown

url="https://drive.google.com/uc?id=1LWNCMAjTH1wWH918wQIHBPT0gyqFf1_d"
f="grade.csv"
gdown.download(url,f,quiet=False)
f=open("grade.csv","r",encoding="Big5")
t=pd.read_csv(f,engine="python")
t["英數平均"]=(t.英+t.數)/2
t[t["英數平均"]>=60]
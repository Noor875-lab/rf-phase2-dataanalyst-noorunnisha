import pandas as pd 
df=pd.read_csv("grocery_chain_data.csv")
df.head()

import sqlite3
conn = sqlite3.connect("grocery.db")
pd.read_sql("SELECT name FROM sqlite_master WHERE type='table';", conn)

df.to_sql("transactions",conn,if_exists="replace",index=False)
conn.commit()

pd.read_sql("select * from transactions limit 5",conn)

pd.read_sql("SELECT name FROM sqlite_master WHERE type='table';", conn)

pd.read_sql("select * from 'transaction' limit 5",conn)

pd.read_sql("""select sum(final_amount) as total_sales from 'transaction'""",conn)

pd.read_sql("""select store_name, sum(final_amount) as store_sales from 'transaction' group by store_name order by store_sales desc """,conn)

pd.read_sql(""" select product_name,sum(quantity) 
as total_quantity from 'transaction' group by 
product_name order by total_quantity desc limit 10""",
conn)

pd.read_sql(""" select substr(transaction_date,1,7) as 
month, sum(final_amount) as monthly_sales from 
'transaction' group by month order by month limit 5"""
,conn)

pd.read_sql(""" select store_name,sum(loyalty_points) as total_points from 'transaction' group by store_name order by total_points desc""",conn)


library(RPostgreSQL)
library(ggplot2)
DBI::dbDriver("PostgreSQL")
#驱动加载
con = dbDriver("PostgreSQL") 
#数据库连接
pgdb_con = dbConnect(con,user = "postgres",password="123456",host = "localhost")
#总体数据量
alldata = dbGetQuery(pgdb_con,statement  =  "SELECT count(*) FROM bikedata")
#单车数据量
bick1data = dbGetQuery(pgdb_con,statement  =  "SELECT count(*) FROM bikedata where biketype='1'")
#助力车数据量
bick2data = dbGetQuery(pgdb_con,statement  =  "SELECT count(*) FROM bikedata where biketype='2'")
#绘制柱状图
table=data.frame(type=c("allnumber","bick1number","bick2number"),number=c(alldata,bick1data,bick2data))
#调用绘图数据库
ggplot(data=table,aes(type,number))+geom_col()

#0-5数据获取整理
bick2data0_5 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 05:00:00' AND starttime>'2017-05-10 00:00:00'")

#5-7数据获取整理
bick2data5_7 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 07:00:00' AND starttime>'2017-05-10 05:00:00'")

#7-10数据获取整理
bick2data7_10 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 10:00:00' AND starttime>'2017-05-10 07:00:00'")

#10-14数据获取整理
bick2data10_14 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 14:00:00' AND starttime>'2017-05-10 10:00:00'")

#14-17数据获取整理
bick2data14_17 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 17:00:00' AND starttime>'2017-05-10 14:00:00'")

#17-19数据获取整理
bick2data17_19 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 19:00:00' AND starttime>'2017-05-10 17:00:00'")

#19-21数据获取整理
bick2data19_21 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 21:00:00' AND starttime>'2017-05-10 19:00:00'")

#21-24数据获取整理
bick2data21_24 = dbGetQuery(pgdb_con,statement  =  "SELECT id,start_loc,end_loc FROM bikeanaly_data WHERE starttime<'2017-05-10 24:00:00' AND starttime>'2017-05-10 21:00:00'")

#绘制柱状图
table=data.frame(type=c("bick2data0_5","bick2data5_7","bick2data7_10","bick2data10_14","bick2data14_17","bick2data17_19","bick2data19_21","bick2data21_24",),number=c(bick2data0_5,bick2data5_7,bick2data7_10,bick2data10_14,bick2data14_17,bick2data17_19,bick2data19_21,bick2data21_24))
#调用绘图数据库
ggplot(data=table,aes(type,number))+geom_col()



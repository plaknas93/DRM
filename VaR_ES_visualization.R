
library(ggplot2)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

data= read.csv(file='D:/RWorks/DRM/Data/data_nifty_14_apr_23_24.csv')
head(data)

ggplot(data=data,aes(x=pf_loss))+geom_histogram(col='black', fill='cornflower blue')+ggtitle("Nifty 50 Distribution (PF value = Rs 100, Time period: 14th April 2023 to 14th April 2024")+xlab('PF daily returns')+ylab("Frequency")

?VaR
?getSymbols
data=getSymbols(symbol='RELIANCE.NS',from=2023-04-14,to=2024-04-14,auto.assign = F)

sdate = as.Date(“14-04-2023”)
edate = as.Date(“2019-12-31”)

# Samsung Electronics (005930), Naver (035420)
ss_stock=getSymbols(‘005930.KS’,from=sdate,to=edate,auto.assign = F)
nv_stock=getSymbols(‘035420.KS’,from=sdate,to=edate,auto.assign = F)


VaR(data, p=0.95,method='historical')

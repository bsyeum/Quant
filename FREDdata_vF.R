install.packages("fredr")
install.packages("devtools")
devtools::install_github("sboysel/fredr")

getwd()
setwd('C:/Users/USER/OneDrive/Coding/2022QAE/2022EDA')
dir()
#FRED 및 TradingEconomics에서 매크로 데이터 받기
library(fredr)
library(dplyr)
library(ggplot2)
library(purrr)
library(dplyr)
library(rvest)
library(stringr)
library(tidyverse)
library(ggplot2)
library(quantmod)
library(magrittr)
library(lubridate)
library(stringr)
library(nycflights13)

fredr_set_key("f6d9f557575af9fda52f4f8685193d2a")
# FRED_API_KEY=f6d9f557575af9fda52f4f8685193d2a

######################
####1. 원화 실질실효환율 Effective rate##############################################
krw <- fredr(
  series_id = "RBKRBIS",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31") 
)
tail(krw)
class(krw)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(krw, file = "eff_usdkrw.csv")

##################원화 실질실효환율 검색해서 찾기###############
effective_krw <- fredr_series_search_text(
  search_text = "RBKRBIS",
  order_by = "popularity",
  sort_order = "desc",
  limit = 1
)
effective_krw

#실질실효환율원화 id만 추출해서 저장
eff_usdkrw <- effective_krw$id
eff_usdkrw

#추출된 id를 그래프로 작성
eff_usdkrw %>%  fredr(observation_start = as.Date("1994-01-01"), observation_end = as.Date("2022-03-31")) %>% ggplot(data = ., mapping = aes(x = date, y = value)) + geom_line(linetype = 'solid', color = 'blue', size = 1) + labs(x = "observation date", y = 'usdkrw', color = "Series")


####2. vix데이터 추출하기##############################################
vix <- fredr(
  series_id = "VIXCLS",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(vix)

#vix 검색해서 찾기
vix_fred <- fredr_series_search_text(
  search_text = "VIXCLS",
  order_by = "popularity",
  sort_order = "desc",
  limit = 1
)
vix_fred

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(vix, file = "vix_fred.csv")

# #vix의 id만 추출해서 저장 
# vix_fred <- vix_fred$id
# vix_fred
# 
# #vix의 그래프 그리기
# vix_fred %>% fredr(observation_start = as.Date("1994-01-01"), observation_end = as.Date("2022-03-31")) %>%
#   ggplot(data = ., aes(x = date, y = value))+
#   geom_line(linetype = 'solid', color = 'black', size=1)+
#   ggtitle('VIXCLS')


#########################################################################################
####10-2 treasury spread데이터 추출하기##############################################
t10y2y <- fredr(
  series_id = "T10Y2Y",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(t10y2y)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(t10y2y, file = "t10y2y.csv")


#########################################################################################
####OECD데이터 추출하기##############################################
oecd <- fredr(
  series_id = "USALOLITONOSTSAM",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(oecd)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(oecd, file = "oecd.csv")

#########################################################################################
####10y Breakeven Interest rate 추출하기##############################################
bei10 <- fredr(
  series_id = "T10YIE",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(bei10)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(bei10, file = "bei10.csv")


#########################################################################################
####M2 추출하기##############################################
M2 <- fredr(
  series_id = "M2SL",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(M2)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(M2, file = "M2.csv")


#########################################################################################
####10y 추출하기##############################################
y10 <- fredr(
  series_id = "DGS10",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(y10)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(y10, file = "y10.csv")

#########################################################################################
####10y 추출하기##############################################
y2 <- fredr(
  series_id = "DGS2",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(y2)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(y10, file = "y2.csv")

#########################################################################################
####high yield spread 추출하기##############################################
hy_spread <- fredr(
  series_id = "BAMLH0A0HYM2",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(hy_spread)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(hy_spread, file = "hy_spread.csv")

#########################################################################################
####high yield spread 추출하기##############################################
ig_spread <- fredr(
  series_id = "BAMLC0A0CM",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(ig_spread)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(ig_spread, file = "ig_spread.csv")



#########################################################################################
####marketcap/GDP spread 추출하기##############################################
MK_GDP <- fredr(
  series_id = "DDDM01USA156NWDB",
  observation_start = as.Date("1990-01-01"),
  observation_end = as.Date("2022-03-31"))
head(MK_GDP)

#다운로드 받은 파일을 생성한 폴더 내 csv 파일로 저장
write.csv(MK_GDP, file = "mk_gdp.csv")



#######################################################################################################################
#######################################################################################################################


#!/bin/sh
hadoop fs -rmr '/access'
hadoop fs -put $1 '/access' 



hadoop fs -rmr '/prg/dayout'
 rm static/day.csv
pig day.pig && mv static/day.csv static/day_bak.csv    #execute pig script and move the day.csv so that
						       #in next step we wont get error as file already exist

hadoop fs -getmerge '/prg/dayout' static/day.csv       #saving output from pig to day.csv in csv format

sed -i -e '1iage,population\' static/day.csv           #adding age, population to first line 
						       #so we can use them as variable name in d3.js javascript

cat static/day.csv | sed 's/,/\t/g' > static/day.tsv   #to convert csv file to tsv file 

#this is next module for ip chart
hadoop fs -rmr '/prg/ipout'
rm static/ip.csv
pig ip.pig && mv static/ip.csv static/ip_bak.csv
hadoop fs -getmerge '/prg/ipout' static/ip.csv
sed -i -e '1iFood by Deliciousness,
Source: Andrew Parnell,
Metadata Notes: Things I think are yummy,
,age,population\' static/ip.csv
cat static/ip.csv | sed 's/,/\t/g' > static/ip.tsv


hadoop fs -rmr '/prg/brout'
rm static/br.csv
pig br.pig && mv static/br.csv static/br_bak.csv
hadoop fs -getmerge '/prg/brout' static/br.csv
sed -i -e '1iage,population\' static/br.csv
cat static/br.csv | sed 's/,/\t/g' > static/br.tsv



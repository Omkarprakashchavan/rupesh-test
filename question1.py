from os import error
import os
import sys
import re
import pandas

try:
    access_logfile = open(sys.argv[1], 'r')
except FileNotFoundError:
    print("Input File does not exist")
    exit
Lines = access_logfile.readlines()
pattern = re.compile(r'(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})')
ip_list=[]
url_list=[]
error404 = 0
for line in Lines:
    if re.search('\s404\s', line):
        error404+=1
    urls = re.findall('(https?://\S+)', line)
    if len(urls) > 0:
        strippedString = str(urls).lstrip("['").rstrip("\"']")
        url_list.append(strippedString)
        ip_list.append(pattern.search(line)[0])
df = pandas.DataFrame(list(zip(url_list, ip_list)), columns =['Url', 'IP'])
df_group = df.groupby('Url').first()
top_10 = df[['Url','IP']].groupby(['Url'])['IP'].size().nlargest(10).reset_index(name='Top10')
print("===============================================================================================")
print("1. Requests resulted in a 'Not Found, Page Not Found' to the client :", error404)
print("===============================================================================================")
print("2. Print the IP address and request URL, grouped by request URL :") 
print(df_group)
print("===============================================================================================")
print("3. top 10 most requested request URL, including how many times they were requested :")
print(top_10)
print("===============================================================================================")
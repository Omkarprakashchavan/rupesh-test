#!/bin/bash
echo $1                                                                                   # Display file to be process

while IFS= read -r LINE; do
  count=$((count+1))
  RESULT=$(grep -s [[:space:]]404[[:space:]] $LINE)                                       # "Not Found, Page Not Found" not found, hence considering 404 error
  urls=$(echo $LINE | grep -Eo -s "(http|https)://[a-zA-Z0-9./?=_%:-_]*")
  if [[ ! -z $RESULT ]]                                                                   # Checking if result is not None
    then
      error404=$error404+1                                                                # Printing the results in log_result file
  fi
  if [[ ! -z $urls ]]
    then
      ip_add=$(echo $LINE | grep -o -s '^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}')
      echo "$urls|$ip_add"> urls_ip.txt
      urlcount=$((urlcount+1))
  fi
done <$1                                                                                    # Reading the access.log file line by line
echo $urlcount $count
echo "1. Requests resulted in a 'Not Found, Page Not Found' to the client:  `cat log_result.txt | wc -l`"

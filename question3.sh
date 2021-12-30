#!/bin/bash

# Help function created to guide the user
Help()
{
   # Display Help
   echo -e "\e[1;35m This script accepts the instances.txt files as input file to process.\e[0m"
   echo -e "\e[1;35m Input file is format is given as below:\e[0m"
   echo -e "\e[1;35m machines		instances\e[0m"
   echo -e "\e[1;35m xxxxx.local    xxxxx.xx.local\e[0m"
   echo
   echo -e "\e[1;35m 1. Use first command line argument to pass input file\e[0m"
   echo -e "\e[1;35m 2. Use second command line argument to pass output format to display\e[0m"
   echo -e "\e[1;35m   -  Use 'machines' as paramater to view machines\e[0m"
   echo -e "\e[1;35m   -  Use 'instances' as paramater to view instances\e[0m"
   echo -e "\e[1;35m 3. Use third command line argument filter output [OPTIONAL]\e[0m"
   echo
}

# Exit the script if inpput file is not provided
if [[ ! -f "$1" ]]; then echo -e "\e[1;31m $1 does not exists. Please provide correct file \e[0m"; exit; fi
firstline=`head -n +1 $1`
echo $firstline
if [ $firstline != *"machines"* ] && [ $firstline != *"instances"* ]; then 
    echo -e "incorrect file provided"
    exit
fi


# Exit and provide messege if less than 2 command lines arguments are given to the script
if [ $# -lt 2 ]; then  
    echo -e "\e[1;35m Atleast two command line arguments are required \e[0m"
    echo -e "\e[1;35m 1. Use first command line argument to pass input file \e[0m"
    echo -e "\e[1;35m 2. Use second command line argument to pass output format to display  'instances' OR 'machines' \e[0m"
    exit
fi

# Validate the second command line argument and process output
case "$2" in
  machines)
    if [[ -z $3 ]]
    then
        output=`tail -n +2 $1 | awk -F ' ' '{print $1}'` || ( echo -e "\e[1;31m Error while processing $1 \e[0m")
    else
        output=`tail -n +2 $1 | awk -F ' ' '{print $1}' | grep $3` || ( echo -e "\e[1;31m Error while processing $1 \e[0m")
    fi
    echo $output
    exit;;

  instances)
    if [[ -z $3 ]]
    then
        output=`tail -n +2 $1 | awk -F ' ' '{print $2}'` || ( echo -e "\e[1;31m Error while processing $1 \e[0m")
    else
        output=`tail -n +2 $1 | awk -F ' ' '{print $2}' | grep $3` || ( echo -e "\e[1;31m Error while processing $1 \e[0m")
    fi
    echo $output
    exit;;
  *)
    echo -e "\e[1;31m You can only use 'machines' OR 'instances' as second command line argument\e[0m "
    exit;;
esac

# Get help
while getopts ":h" option; do
   case $option in
      h|help|Help) # display Help
         Help
         exit;;
     \?) # Invalid option
         echo -e "\e[1;31m Error: Invalid option\e[0m"
         exit;;
   esac
done
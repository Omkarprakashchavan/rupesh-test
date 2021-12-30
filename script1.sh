#!/bin/bash

DIRECTORY1="/tmp/dir1"
DIRECTORY2="/tmp/dir2"
RESULT="null"

FILECONTENTS=$(cat <<EOF
Lorem ipsum dolor sit amet, consectetur |adipiscing elit, sed do eiusmod tempor
|incididunt ut labore et dolore magna aliqua. |Ut enim ad minim veniam, quis nostrud
|exercitation ullamco laboris nisi ut aliquip |ex ea commodo consequat.
EOF
)

PRECHECK()
{

    #PART 1                                                                                 # Precheck function checks if script has been executed by ROOT user or not
    if [ "$(whoami)" != "root" ]                                                            # Checks if user is not root then exit the script with code 1
    then
        echo -e "You need to run the script as root\n"
        exit 1
    fi

    #PART 2
    for i in $DIRECTORY1 $DIRECTORY2; do                                                    
        if [ ! -d $i ]                                                                      # Checks if directory1 and directory2 exists
        then
            echo -e "Required directory ${i} does not exist..yet"
            mkdir $i                                                                        # if directory doesn't exists then create it
        else
            echo -e "Required directory ${i} exists"                                        # if directory doesn't exists then print messege
        fi
    done

}

EVENODD()
{
    NUMBER=$1                                                                               # Accept command line argument from calling function
    if [ $((NUMBER%2)) -eq 0 ]                                                              # checks if given number is even
    then
        RESULT='even'                                                                       # if number is Even then set result to EVEN
    else
        RESULT='odd'                                                                        # if number is ODD then set result to ODD
    fi
}

MAIN()
{
    #PART 1
    echo $FILECONTENTS | tr '|' '\n' > $DIRECTORY1/file1                                    # This line replace | from $FILECONTENTS to newline and writes to $DIRECTOTY1/file1
    local status=$?                                                                         # creates local variable to store the status of last executed command
    if [ $status -ne 0 ]    
    then
        echo "Unable to create/populate ${DIRECTORY1}/file1"                                # if last executed command is not successful then exit
        exit 1
    fi
    
    #PART 2
    COUNT=2
    while read -r line;                                                                     # with reference PART 1, this section reads $DIRECTORY1/file1
    do  
        echo "Creating file${COUNT} in ${DIRECTORY1}"
        echo $line > $DIRECTORY1/file$COUNT;                                                # for each line from $DIRECTORY1/file, it creates seperate file
        let COUNT=COUNT+1                                                                   # counter increament by 1
    done < $DIRECTORY1/file1

    #PART 4
    for i in `ls $DIRECTORY1`;                                                              # list all files available in $DIRECTORY1
    do
        echo "Archiving ${i} to ${DIRECTORY2}"
        cp $DIRECTORY1/$i $DIRECTORY2/$i.bak                                                # Copying files from $DIRECTORY1 to $DIRECTORY2 as bck file
        local status=$?
        if [ $status -ne 0 ]                                                                # Checks last executed status
        then
            echo "Unable to archive ${DIRECTORY1}/${i}"                                     # if last executed command is not successful then print messege
        fi
    done

    echo -e "\nContents of Archive:"
    echo `ls ${DIRECTORY2}`                                                                 # print available files in $DIRECTORY2

    #PART 5
    echo -e "\nNumbers Game"
    for i in `ls $DIRECTORY1/`;                                                             # runs loop for each file in $DIRECTORY1
    do
        local NUMBER=`echo $i | sed 's/[a-z]//g'`                                           # removes alphabets from filename and store the filename in NUMBER variable
        EVENODD $NUMBER                                                                     # Calls EVENODD function and pass filename (by removing alphabetes its only number now) stored in above line 
        if [[ $RESULT == "even" ]];                                                         # Check if Even number of filename in $DIRECTORY1
        then
            echo "${i} has an ${RESULT} number in its name, deleting"
            rm -f $DIRECTORY1/$i                                                            # if filename have even number then delete file which have even number
        fi
    done

}

PRECHECK                                                                                    # Calling PRECHECK Function
MAIN                                                                                        # Calling Main function
exit 0                                                                                      # Exit the script
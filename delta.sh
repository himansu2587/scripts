#!/bin/bash

CUR_DIR=`pwd`
DIR=$CUR_DIR/loglistenerdelta

start_module() {
      CHECK=`ps -ef | egrep "script|delta" | grep -v grep | wc -l`
      if [[ "$CHECK" -gt "2" ]]
      then
       echo -e "\e[31mIt looks like the Audit tool is already in running state. Please check and kill it if required and start again.\e[0m"
      elif [[ "$CHECK" -gt "0" ]]
      then
       nohup sh $CUR_DIR/conf/script.sh >/dev/null 2>&1 &
       PROCESS=`ps -ef | egrep "script|delta" | grep -v grep | wc -l`
        if [[ $PROCESS -eq 3 ]]
        then
         echo -e "\e[40;38;5;82m\e[5mThe script is started successfully. Ver 1.0.\e[0m"
         echo -e "The new data can be found at \e[1;4m$DIR \e[0mlocation. Please check \e[1;4mdelta.log \e[0mfile."
         echo -e "\e[31m\e[5mNOTE: \e[0mdelta.log file is the temporary file. It will append the data to delta.xml file once the script stops."
        else
         echo -e "\e[31mThe tool is not started properly. Please check properly. Please check\e[0m"
        fi
       else
        echo "Something error happens. Please check the MOP and try again."
       fi
}

stop_module() {
      ps -ef | grep script | grep -v grep | awk '{print $2}' | xargs kill
      echo -e "\e[40;38;5;82m\e[5mThe script is stopped successfully.\e[0m"
      echo -e "Now,the new data or log can be found at \e[1;4m$DIR \e[0mlocation. Please check \e[1;4mdelta.xml \e[0mfile."

      #Copy the data to delta.xml file
      cat $DIR/delta.log >> $DIR/delta.xml

      #Adding the encoding line if not exist in the delta.xml file
      grep -q '^<?xml version="1.0" encoding="ISO-8859-1" ?>' $DIR/delta.xml || sed  -i '1i <?xml version="1.0" encoding="ISO-8859-1" ?>' $DIR/delta.xml

      #Adding starting of commands if not exists
      grep -q '^<commands>' $DIR/delta.xml || sed  -i '2i <commands>' $DIR/delta.xml

      #Adding commands section at the end of line if not exists
      sed -i '/\/commands/d' $DIR/delta.xml
      grep -q '^</commands>' $DIR/delta.xml || sed  -i '$a </commands>' $DIR/delta.xml

      #Remove the Audit line
      sed -i '/Audit/d' $DIR/delta.xml

      #Remove the existing delta.log file to avoie any duplicate issue
      rm -rf $DIR/delta.log
      ps -ef | grep delta | grep -v grep | awk '{print $2}' | xargs kill

}

ready_module() {
      read -p "Are you ready to start the rename Service Provider ID process (y/n)? ::" ANSWER
      while true
      do
        case $ANSWER in
         [yY]* )
              while IFS=',' read -r f1 f2
              do
                echo "The rename process is started....."
                grep -q $f1 $DIR/delta.xml
                if [[ "$?" = "0" ]]
                then
                 echo "The source SP ID is found......"
                 echo "Replace the SP ID Process going on......"
                 sleep 5
                 sed -i "s/$f1/$f2/g" $CUR_DIR/loglistenerdelta/delta.xml
                 echo -e "\e[40;38;5;82m\e[5mThe New Service Provider ID "$f2" has been replaced with the existing Service Provider ID "$f1" successfully.\e[0m"
                else
                 echo -e "\e[31mThe given Service Provider ID is not found in delta.xml file.Please check the ID again and retry.\e[0m"

                fi
              done < $CUR_DIR/conf/spEntList.txt
              break;;
         [nN]* )  exit;;

         * )     echo "Please enter Y or N...."; break ;;
         esac
      done
}

merge_module() {
    cat test.xml test1.xml > detla.xml
    sed -i -e '/ISO\-8859\-1/d' -e '/commands/d' $DIR/delta.xml
    grep -q '^<?xml version="1.0" encoding="ISO-8859-1" ?>' $DIR/delta.xml || sed  -i '1i <?xml version="1.0" encoding="ISO-8859-1" ?>' $DIR/delta.xml
    grep -q '^<commands>' $DIR/delta.xml || sed  -i '2i <commands>' $DIR/delta.xml
    grep -q '^</commands>' $DIR/delta.xml || sed  -i '$a </commands>' $DIR/delta.xml
}

if [ $# != 1 ]; then                # If Argument is not exactly one
    echo "It looks like wrong arguement passed.Please Enter the valid one"
    exit 1                         # Exit the program
fi


ARGUMENT=$(echo "$1" | awk '{print tolower($0)}')     # Converts Argument in lower case. This is to make user Argument case independent.

if   [[ $ARGUMENT == start ]]; then

    start_module

elif [[ $ARGUMENT == stop ]]; then

    stop_module

elif [[ $ARGUMENT == ready ]]; then

    ready_module

elif [[ $ARGUMENT == merge ]]; then

    merge_module

else
    echo "Only one valid argument accepted: START | STOP | READY
          case doesn't matter. "
fi

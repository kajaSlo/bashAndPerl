#!/bin/bash

pathToServerFile=`basename /home/kaja/Pulpit/skryptowe/zadanie4/server.sh`
#echo "$pathToServerFile"

doesServerExist=false

if [ -f "$pathToServerFile" ]
then
	doesServerExist=true
fi

if [[ "$doesServerExist" == false ]]
then
	ln -s PJS2_Kaja_Slomska_skrypt5.sh server.sh
	doesServerExist=true
fi

pathToClientFile=`basename /home/kaja/Pulpit/skryptowe/zadanie4/client.sh`
#echo "$pathToClientFile"

doesClientExist=false

if [ -f "$pathToClientFile" ]
then
	doesClientExist=true
fi

if [[ "$doesClientExist" == false ]]
then
	ln -s PJS2_Kaja_Slomska_skrypt5.sh client.sh
	doesClientExist=true
fi



server=false
client=false
sOption=false
cOption=false
port=4444
ipNumber="127.0.0.1"
rcFile=$HOME/.licznik.rc


output=""
found=false


if [[ ! -f "$rcFile" ]]; then
	touch $rcFile
fi

searchTextwordInFile=$( cat $HOME/.licznik.rc | grep file= )

if ! [[ "$searchTextwordInFile" =~ ^file=(.*) ]];then
        file=ports.txt
fi
# zakladam, że nie istnieje opcja, że soursowanie pliku .rc jest zakomentowane, sprawdzam czy w nim jest linijka odpowiedzialna za nadpisanie zmiennej, jak to bedzie zakomentowane to nie zadziala
source $HOME/.licznik.rc;

if [[ ! -f "$file" ]]; then
	touch $file
fi


case $0 in
		
		"./client.sh")	client=true ;;
		"./server.sh")	server=true ;;
		
	esac

while getopts ":p:sci:" arguments;
do
	case $arguments in
		"p")	port=$OPTARG ;;
		"s")	sOption=true ;;
		"c")	cOption=true ;;
		"i")	ipNumber=$OPTARG ;;

	esac
done
#echo "$sOption"

if [[ "$cOption" == false ]] && [[ $0 == "./PJS2_Kaja_Slomska_skrypt5.sh" ]]; then
	server=true ;	
fi

isAddressValid=false
domainToIp=$(dig +short $ipNumber)

if [[ "$domainToIp" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
	isAddressValid=true
fi


if [[ "$isAddressValid" == false ]]; then
	echo "It's not a valid IP address or a domain address"
        exit 1
fi

if [[ "$sOption" == true ]] && [[ "$cOption" == true ]]; then
	echo "You can't put both -s and -c arguments"
	exit 1	
fi


if [[ "$0" == "./server.sh" ]] && [[ "$sOption" == true ]]
then
	echo "You cannot run ./server.sh with -s option"
	exit 1
fi

if [[ "$0" == "./server.sh" ]] && [[ "$cOption" == true ]]
then
	echo "You cannot run ./server.sh with -c option"
	exit 1
fi
 
 
 
if [[ "$0" == "./client.sh" ]] && [[ "$sOption" == true ]]
then
	echo "You cannot run ./client.sh with -s option"
	exit 1
fi
 
if [[ "$0" == "./client.sh" ]] && [[ "$cOption" == true ]]
then
	echo "You cannot run ./client.sh with -c option"
	exit 1
fi



if [[ "$server" == true ]] || [[ "$sOption" == true ]]; then

    netcat -l -p $port

	while read LINE; do
		portFromFile=$(echo "$LINE" | awk -F ":" '{print $1}')
		counter=""
		if [[ $portFromFile -eq $port ]]; then
			found=true
			counter=$(( $(echo "$LINE" | awk -F ":" '{print $2}') + 1))
			echo -e "$portFromFile -> $counter" 
		else
			counter=$(echo "$LINE" | awk -F ":" '{print $2}')
		fi
		size=${#LINE}
		if [ $size -gt 0 ]; then
			 
			output+="${portFromFile}:${counter}\n"
		fi
	done < $file

	if [[ $found = false ]]; then
		output+="$port:1"
		echo -e "$port -> 1" 
	fi 

	echo -e "${output}" > $file 
fi

if [[ "$client" == true ]] || [[ "$cOption" == true ]]; then
	echo "It's me, a client"|netcat -q 1 $ipNumber $port
fi


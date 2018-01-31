#!/usr/bin/tcsh
# Kaja Słomska grupa 2
set pathToServerFile=`basename /server.csh`


set doesServerExist=false


ls "$pathToServerFile" >& /dev/null
if ( $status == 0 ) then
    foreach file ( "$pathToServerFile" )
        set doesServerExist=true
    end
endif

if ( "$doesServerExist" == false ) then
	ln -s PJS2_Kaja_Slomska_skrypt5.csh server.csh
	set doesServerExist=true
endif

set pathToClientFile=`basename /client.csh`


set doesClientExist=false


ls "$pathToClientFile" >& /dev/null
if ( $status == 0 ) then
    foreach file ( "$pathToClientFile" )
        set doesClientExist=true
    end
endif

if ( "$doesClientExist" == false ) then
	ln -s PJS2_Kaja_Slomska_skrypt5.csh client.csh
	set doesClientExist=true
endif

set server=false
set client=false
set sOption=false
set cOption=false
set port=4444
set ipNumber="127.0.0.1"
set rcFile=$HOME/.licznik.csh


set output=""
set found=false


if ( ! -f "$rcFile" ) then
	touch $rcFile
endif

set searchTextwordInFile=`cat $HOME/.licznik.csh | grep file1= `

if ( "$searchTextwordInFile" == "" ) then
        set file1=ports.txt
endif

source $HOME/.licznik.csh;

if ( ! -f "$file1" ) then
	touch $file1
endif

switch ( $0 )

	case "./server.csh":
		set server=true ;
	breaksw
	case "./client.csh":
		set client=true ;
	breaksw
endsw

set i=1
while (1)
	if ( $#argv < $i ) then
      break 
   	endif

	switch ($argv[$i])
  		case "-p":
			@ i++
			set port=$argv[$i]
			
			@ i++
			breaksw
		case "-s":
			set sOption=true
			@ i++
			breaksw
		case "-c":
			set cOption=true
			@ i++
			breaksw
		case "-i":
			@ i++
			set ipNumber=$argv[$i]
			@ i++				
			breaksw
		
	endsw
end

if ( $0 == "./PJS2_Kaja_Slomska_skrypt5.csh") then
	if ( "$cOption" == false ) then

	set server=true ;
   endif
endif


set isAddressValid=false
set domainToIp=`dig +short $ipNumber`

if ( "$domainToIp" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ) then
	set isAddressValid=true
endif

if ( "$isAddressValid" == false ) then
	echo "It's not a valid IP address or a domain address"
        exit 1
endif

if (( "$sOption" == true ) && ( "$cOption" == true )) then
	echo "You can't put both -s and -c arguments"
	exit 1	
endif


if (( "$0" == "./server.csh" ) && ( "$sOption" == true )) then
	echo "You cannot run ./server.csh with -s option"
	exit 1
endif

if (( "$0" == "./server.csh" ) && ( "$cOption" == true )) then
	echo "You cannot run ./server.csh with -c option"
	exit 1
endif
 
 
if (( "$0" == "./client.csh" ) && ( "$sOption" == true )) then
	echo "You cannot run ./client.csh with -s option"
	exit 1
endif
 
if (( "$0" == "./client.csh" ) && ( "$cOption" == true )) then
	echo "You cannot run ./client.csh with -c option"
	exit 1
endif

if (( "$server" == true ) || ( "$sOption" == true )) then

    netcat -l -p $port

	foreach LINE ( "`cat $file1`" )
	set portFromFile = `echo "$LINE" | awk -F ":" '{print $1}'`
	set counter = ""
	if ( "$portFromFile" == "$port" ) then
		set found = true
		set counter = `echo "$LINE" | awk -F ":" '{print $2}'`
		@ counter += 1 
		echo "${portFromFile} -> ${counter}"
	else
		set counter = `echo "$LINE" | awk -F ":" '{print $2}'`
	endif
	set size = ${#LINE}
	if ( $size > 0 ) then
		set output = "${output}${portFromFile}:${counter}\n"
	endif
end
if ( $found == false ) then
	set output = "${output}${port}:1\n"
	echo "${port} -> 1"
endif
printf $output > $file1
endif

if (( "$client" == true ) || ( "$cOption" == true )) then
	echo "It's me, a client"|netcat -q 1 $ipNumber $port
endif



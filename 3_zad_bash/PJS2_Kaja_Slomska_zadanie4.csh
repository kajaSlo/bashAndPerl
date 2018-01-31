#!/usr/bin/tcsh
#Kaja Słomska grupa 2

echo "Remember to seperate each port with comma"

set first_argument=`dig +short "$1"`
set second_argument=`dig +short "$2"`

set S=`tcsh fromIpToInt.csh $first_argument`
set E=`tcsh fromIpToInt.csh $second_argument`

if (( "$S" > "$E" )) then
set z=$S
set S=$E
set E=$z
endif

foreach INT ( `seq $S $E` )

set IP=`tcsh fromIntToIp.csh $INT`
set variable = "$IP"
foreach m ( $3:as/,/ / )
    if ("$m" != "42" && "$m" != "53" ) then
        set checkifaDomainResponded=`nc -z -v -w5 $IP $m |& cat`

        set domainIsResponding = true
        if  (( "$checkifaDomainResponded" =~ *"timed out: Operation now in progress"* )) then
                set domainIsResponding = false
        endif
	if  (( "$checkifaDomainResponded" =~ *"Name or service not known"* )) then #dodac to basha!!!!!!!
                set domainIsResponding = false
        endif
	if  (( "$checkifaDomainResponded" =~ *"failed: Connection refused"* )) then #dodac to basha!!!!!!!
                set domainIsResponding = false
        endif

        if ( "$domainIsResponding" == false ) then
                echo " Connection is CLOSED for domain $IP on port $m"
        endif
    endif

if (( "$m" == "42" || "$m" == "53" )) then

      set checkifanUDPDomainResponded=`nc -u -v -w5 $IP $m |& cat`
        set didConnectionWithUdpFinishedWithSuccess=false
        if (( "$checkifanUDPDomainResponded" =~ *"udp"* )) then
                set didConnectionWithUdpFinishedWithSuccess=true
        endif
        if (( "$didConnectionWithUdpFinishedWithSuccess" == false )) then
                echo " Connection is CLOSED for domain $IP on port $m"
        endif

        if (( "$didConnectionWithUdpFinishedWithSuccess" == true )) then
		set arrUdp = `echo "$checkifanUDPDomainResponded" | tr -s ' ' "\012"`

                echo "$arrUdp[6]" ": connection is opened for domain $IP on port $m"
        endif

    endif


if (( "$m" == "80")) then #dodać do basha!
	if (( $domainIsResponding == true )) then
		set server=`printf "HEAD / HTTP/1.0\r\n\r\n" |nc $IP $m|grep Server`
		set whichServerResponded = `nc -z -v -w5 $IP $m |& cat`
	
		set isItAHttpServer = false

		set withoutProblematicCharacters = `echo "$whichServerResponded" | tr -s '[' " "`
		set withoutProblematicCharacters2 = `echo "$withoutProblematicCharacters" | tr -s ']' " "`
	
		set arr = `echo "$withoutProblematicCharacters2 " | tr -s ' ' "\012"`
		foreach i ($arr) 
			if (( $i =~ *"http"* )) then 
		      	  	set isItAHttpServer = true
		        	set httpvar=$i
			endif       
		end
		if ( "$isItAHttpServer" == true && "$server" =~ *"erver"* ) then
	       	    echo "$1" " -->" $httpvar ": $server"
		else if ( $isItAHttpServer == true  && !( $server =~ *"erver"* )) then
		    echo $httpvar " connection is opened for domain $IP on port $m"
		endif
	endif
endif


    if (( "$m" == "22" )) then
        set sshServer=`printf "\n\n" | nc $IP $m`
        if (( $domainIsResponding == true )) then
             set sshServer=`printf "\n\n" | nc $IP $m`
              set sshResponse=`nc -z -v -w5 $IP $m |& cat`

		set withoutProblematicCharactersSsh = `echo "$sshResponse" | tr -s '[' " "`
		set withoutProblematicCharacters2Ssh = `echo "$withoutProblematicCharactersSsh" | tr -s ']' " "`
	
		set arrSsh = `echo "$withoutProblematicCharacters2Ssh " | tr -s ' ' "\012"`
                

                foreach i ($arrSsh) 

                if (( $i =~ *"ssh"* )) then 

                        set sshvar=$i
                endif
                end

                 echo "$1" " -->" $sshvar ": $sshServer" 

        endif
    endif

end
end

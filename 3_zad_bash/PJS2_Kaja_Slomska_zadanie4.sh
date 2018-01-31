#!/bin/bash
#Kaja Słomska grupa 2
echo "Remember to seperate each port with comma" 
first_ip_is_a_domain=false
second_ip_is_a_domain=false


function convert_ip_to_int()
{
  local IP="$1"
  local A_domain=`echo $IP | cut -d. -f1`
  local B_domain=`echo $IP | cut -d. -f2`
  local C_domain=`echo $IP | cut -d. -f3`
  local D_domain=`echo $IP | cut -d. -f4`
  local INT

  INT=`expr 256 "*" 256 "*" 256 "*" $A_domain`
  INT=`expr 256 "*" 256 "*" $B_domain + $INT`
  INT=`expr 256 "*" $C_domain + $INT`
  INT=`expr $D_domain + $INT`

  echo $INT
}



function conver_int_to_ip()
{
  local INT="$1"

  local D_domain=`expr $INT % 256`
  local C_domain=`expr '(' $INT - $D_domain ')' / 256 % 256`
  local B_domain=`expr '(' $INT - $C_domain - $D_domain ')' / 65536 % 256`
  local A_domain=`expr '(' $INT - $B_domain - $C_domain - $D_domain ')' / 16777216 % 256`

  echo "$A_domain.$B_domain.$C_domain.$D_domain"
}

function validate_ip_addresses()
{
OIFS="$IFS"
IFS=','
read -a splitPorts <<< "${2}"
IFS="$OIFS"

for m in "${splitPorts[@]}"
do
 
    if ! [[ $m == "42" ]] && ! [[ $m == "53" ]];then
        checkifaDomainResponded=$(nc -z -v -w5 $1 $m 2>&1)

        domainIsResponding=true
        if  [[ $checkifaDomainResponded == *"timed out: Operation now in progress"* ]]; then
                domainIsResponding=false
        fi
	if  [[ $checkifaDomainResponded == *"Name or service not known"* ]]; then
                domainIsResponding=false
        fi
	if  [[ $checkifaDomainResponded == *"failed: Connection refused"* ]]; then
                domainIsResponding=false
        fi

        if  [[ $domainIsResponding == false ]]; then
                echo " Connection is CLOSED for domain $1 on port $m"
        fi
    fi
   
    #-------------------------------------------------------------------

    if [[ "$m" == "80" ]]; then
        server=$(printf "HEAD / HTTP/1.0\r\n\r\n" |nc "$1" $m|grep Server)

        whichServerResponded=$(nc -z -v -w5 "$1" $m 2>&1)


        arr=($whichServerResponded)
        isItAHttpServer=false
        for i in ${arr[@]}; do

        if [[ $i == *"http"* ]]; then #checking if connection with serwer was established
                isItAHttpServer=true
                httpvar=$i
        fi
        done

        if [[ $isItAHttpServer == true ]] && [[ $server == *"erver"* ]] ; then
        echo "$1" " -->" " $httpvar: " "$server"
        elif [[ $isItAHttpServer == true ]] && ! [[ $server == *"erver"* ]] ; then
            echo " $httpvar" " connection is opened for domain "$1" on port $m"
        fi
    fi

    if [[ "$m" == "22" ]]; then
        sshServer=$(printf "\n\n" | nc $1 $m)
        if [[ $domainIsResponding == true ]]; then
             sshServer=$(printf "\n\n" | nc $1 $m)
              sshResponse=$(nc -z -v -w5 $1 $m 2>&1)


                sshArr=($sshResponse)

                for i in ${sshArr[@]}; do

                if [[ $i == *"ssh"* ]]; then #checking if connection with serwer was established

                        sshvar=$i
                fi
                done

                echo "$1" " -->" "$sshvar: " "$sshServer"

        fi
    fi

    if [[ $m == "25" ]];then
        var4=''
        i=0

          while IFS= read -r line
          do
           var4=$(echo $line)
          done < <(nslookup -query=mx $1|head -n5)  #port 25

        isThereAServerWithWhichAnSmtpConnectionWillBeEstablished=false
        if  [[ $var4 == *"mail exchanger"* ]]; then

           isThereAServerWithWhichAnSmtpConnectionWillBeEstablished=true
        fi
        serverName=$(echo $var4 | awk '{print $NF}') #SMPT server

        var=''
        j=0
        doesServerSendAResponse=false
        b="220"
        varWithResponseFromTheServer=''
         while IFS= read -r lineSMPT
          do
           var=$(echo $lineSMPT)
            varWithResponseFromTheServer=$(echo "$var")
            if [[ $varWithResponseFromTheServer == *"220"* ]]; then # checking if a connection with that server was successful

                doesServerSendAResponse=true
            fi
            j=$((j + 1))

          done < <( printf "\r\n\r\nQUIT"; sleep 2 |nc "$serverName" 25)  #Connecting with smtp server

        if [[ "$doesServerSendAResponse" == true ]];then
            echo "$1" " -->" "smtp server: " "$serverName"
        elif [[ "$doesServerSendAResponse" == false ]] && [[ $isThereAServerWithWhichAnSmtpConnectionWillBeEstablished == true ]]; then
            echo "$1" " -->" "smtp server: " "$serverName" " did not response"
        fi
    fi
    if [[ $m == "42" ]] || [[ $m == "53" ]];then

      checkifanUDPDomainResponded=$(nc -u -v -w5 $1 $m 2>&1)

        didConnectionWithUdpFinishedWithSuccess=false
        if  [[ $checkifanUDPDomainResponded == *"udp"* ]]; then
                didConnectionWithUdpFinishedWithSuccess=true
        fi

        if  [[ $didConnectionWithUdpFinishedWithSuccess == false ]]; then
                echo " Connection is CLOSED for domain $1 on port $m"
        fi

        if  [[ $didConnectionWithUdpFinishedWithSuccess == true ]]; then


              UDPArr=($checkifanUDPDomainResponded)

                for i in ${UDPArr[@]}; do

                if [[ $i == *"udp"* ]]; then #checking if connection with serwer was established

                        udpvar=$i
                fi
                done

                echo "$udpvar: " "connection is opened for domain $1 on port $m"
        fi

    fi
done
}

#.........................................start
for i in $1;do
    if [[ $1 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        first_ip_is_a_domain=true
        continue
    else
        cmd='dig +short $1'
        first_argument=$(eval $cmd)
       # echo "IP address of a domain given as a 1st argument: " "$first_argument"
    fi
done

for i in $2;do
    if [[ $2 =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        second_ip_is_a_domain=true
        continue
    else
        cmd2='dig +short $2'
        second_argument=$(eval $cmd2)
       # echo "IP address of a domain given as a 2nd argument: " "$second_argument"
    fi
done
#---------------
if $first_ip_is_a_domain && $second_ip_is_a_domain;then
    S=`convert_ip_to_int $1`
    E=`convert_ip_to_int $2`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP" "$3"


    done
fi

if  [[ $first_ip_is_a_domain == false ]] &&  [[ $second_ip_is_a_domain == false ]];then
    S=`convert_ip_to_int $first_argument`
    E=`convert_ip_to_int $second_argument`
	
    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP" "$3"

    done
fi

#..................................................
if  [[ $first_ip_is_a_domain == false ]] &&  [[ $second_ip_is_a_domain == true ]];then
    S=`convert_ip_to_int $first_argument`
    E=`convert_ip_to_int $2`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP" "$3"

    done
fi
#..................................................
if  [[ $first_ip_is_a_domain == true ]] &&  [[ $second_ip_is_a_domain == false ]];then
    S=`convert_ip_to_int $1`
    E=`convert_ip_to_int $second_argument`

    if (( "$S" > "$E" )) ;then
        z=$S
        S=$E
        E=$z
    fi

    for INT in `seq $S 1 $E`
    do

    IP=`conver_int_to_ip $INT`

    validate_ip_addresses "$IP" "$3"

    done
fi

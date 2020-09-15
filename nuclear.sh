#!/bin/bash

echo '
       dddddd     dddd   dddd        dddd      ddddddddddd   dddd            ddddddddddddddd       dddddd          dddddddddddd    
      ddddddd    dddd   dddd        dddd   ddddd            dddd            dddd                 dddddddd         dddd      dddd 
     dddd ddd   dddd   dddd        dddd  ddddd             dddd            dddd                 dddd  ddd        dddd        dddd 
    dddd  ddd  dddd   dddd        dddd   dddd             dddd            ddddddddddd         dddd    ddd       ddddd dddddddddd  
   dddd   ddd dddd    dddd       dddd    ddddd           dddd            dddd                dddd     ddd      ddddd ddddd        
  dddd    ddddddd     ddddd    ddddd      dddddd        dddd            dddd                dddd      ddd     dddd     dddd      
 dddd     dddddd        ddddddddd             dddddd   ddddddddddddd   dddddddddddddd      dddddddd   ddd    ddddd        dddd     
'
echo 'nuclei automation script by bobby'

dir=/root/Recon/$1

sudo mkdir $dir

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

for url in $(cat $1); do
        echo '_____________________________________________'
        echo  "${red} Testing : ${green} ${url} ${reset}"
        echo '---------------------------------------------'
        
	    echo '_____________________________________________________________________________________________'
        echo  "${red} Performing : ${green} Subdomain Scanning & Resolving and doing Nuclei Scan ${reset}"
        echo '----------------------------------------------------------------------------------------------'		
        subfinder -d $url -silent |httpx -silent |sort -u| nuclei -c 200 -silent -t /root/nuclei-templates/ -o $dir/$1_nuclei
	echo '______________________________________________________________________'
        echo  "${red} Performing : ${green} Http request smuggling ${reset}"
        echo '----------------------------------------------------------------------'
        echo https://$url | python3 /root/Tools/smuggler/smuggler.py > $dir/$1_smuggler
done

#!/bin/bash
sudo apt-get install golang;

echo 'Making Directories'
dir=/root/Tools
mkdir $dir
echo 'Installing Tools'
git clone https://github.com/projectdiscovery/nuclei.git; cd nuclei/v2/cmd/nuclei/; go build; mv nuclei /usr/local/bin/; nuclei -h
git clone https://github.com/projectdiscovery/nuclei-templates $dir/nuclei-templates
git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/v2/cmd/subfinder
go build .
mv subfinder /usr/local/bin/
subfinder -h
git clone https://github.com/projectdiscovery/httpx.git; cd httpx/cmd/httpx; go build; mv httpx /usr/local/bin/; httpx -h
git clone https://github.com/defparam/smuggler $dir/smuggler
cp nuclear.sh $dir/


echo '
alias nuclear=/root/Tools/nuclear.sh
'>> ~/.bashrc

source ~/.bashrc

#!/bin/bash
#sudo apt-get install golang;

echo 'Making Directories'
dir=/root/Tools
mkdir $dir
echo 'Installing Tools'
GO111MODULE=on go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
git clone https://github.com/projectdiscovery/nuclei-templates $dir/nuclei-templates
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/cmd/subfinder
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx
git clone https://github.com/defparam/smuggler $dir/smuggler
cp nuclear.sh $dir/


echo '
alias nuclei=/root/go/bin/nuclei
alias httpx=/root/go/bin/httpx
alias subfinder=/root/fo/bin/subfinder
alias nuclear=/root/Tools/nuclear.sh
'>> ~/.bashrc

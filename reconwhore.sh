#!/bin/bash
# ReconWhore v1.5
# Author: @NSR
# https://github.com/thelinuxchoice/usercheck

trap 'printf "\n";partial;exit 1' 2

banner() {


echo '==========================================================='
figlet ReconWhore
echo '==========================================================='

printf "Scans A Username And Cross-References Across Multiple Adult\n"
printf "Social Networks To Validate That Person As Being Active Or \n"
printf "Otherwise inconsistent catfish/fake/stalker/trolling...\n"
printf "If accounts are found, it redundanly attemps to pull personally\n"
printf "posted content from their account with any personally identifiable\n"
printf "information from various sources such as age/dob/phone/addresses.\n"
 echo 
}

partial() {

if [[ -e $username ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt\n" $username
fi
}

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Username:\e[0m ' username

if [[ -e /var/log/omnisint/forensics/reconwhore/$username.log ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Creating reconwhore backup for last file:\e[0m\e[1;77m %s.log" $username
zip -r reconwhore.zip /var/log/omnisint/forensics/reconwhore/$username.log 
fi
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m\n" $username



#FIND THEM ON FETLIFE
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Fetlife: \e[0m"
check_fetlife=$(curl -s "https://www.fetlife.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_fetlife == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.fetlife.com/%s\n" $username
printf "https://www.fetlife.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log

elif [[ $check_fetlife == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi




#FIND THEM ON ONLYFANS
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OnlyFans: \e[0m"
check_onlyfans=$(curl -s "https://www.onlyfans.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_onlyfans == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.onlyfans.com/%s\n" $username
printf "https://www.onlyfans.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log

elif [[ $check_onlyfans == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi


#FIND THEM ON ADULTFRIENDFINDER.COM
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] AdultFriendFinder: \e[0m"
check_adultfriend=$(curl -s "https://www.adutfriendfinder.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_adultfriend == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.adultfriendfinder.com/%s\n" $username
printf "https://www.adultfriendfinder.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log

elif [[ $check_adultfriend == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi


#FIND THEM ON ALT.COM
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Alt: \e[0m"
check_alt=$(curl -s "https://www.alt.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_alt == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.alt.com/%s\n" $username
printf "https://www.alt.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log

elif [[ $check_alt == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi



#FIND THEM ON Whiplr.COM
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Whiplr: \e[0m"
check_whiplr=$(curl -s "https://www.whiplr.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_whiplr == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.whiplr.com/%s\n" $username
printf "https://www.whiplr.com/%s\n" $username >> /var/log/omnisint/forensics//reconwhore/$username.log

elif [[ $check_whiplr == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi


#FIND THEM ON xnxx
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_xnxx=$(curl -s "https://www.xnxx.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_xnxx == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.xnxx.com/%s\n" $username
    printf "https://www.xnxx.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_xnxx == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi

#FIND THEM ON redtube
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_redtube=$(curl -s "https://www.redtube.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_redtube == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.redtube.com/%s\n" $username
    printf "https://www.redtube.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_redtube == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi

#FIND THEM ON pornhub
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_pornhub=$(curl -s "https://www.pornhub.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_pornhub == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.pornhub.com/%s\n" $username
    printf "https://www.pornhub.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_pornhub == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi

#FIND THEM ON youporn
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_youporn=$(curl -s "https://www.youporn.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_youporn == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.youporn.com/%s\n" $username
    printf "https://www.youporn.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_youporn == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi

#FIND THEM ON myfreecams
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_myfreecams=$(curl -s "https://www.myfreecams.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_myfreecams == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.myfreecams.com/%s\n" $username
    printf "https://www.myfreecams.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_myfreecams == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi

#FIND THEM ON onlyfans
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_onlyfans=$(curl -s "https://www.onlyfans.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_onlyfans == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.onlyfans.com/%s\n" $username
    printf "https://www.onlyfans.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_onlyfans == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi

#FIND THEM ON fansly
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] $i: \e[0m"
check_fansly=$(curl -s "https://www.fansly.com/your_username_here" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)

if [[ $check_fansly == *'1'* ]]; then
    printf "\e[1;92m Found!\e[0m https://www.fansly.com/%s\n" $username
    printf "https://www.fansly.com/%s\n" $username >> /var/log/omnisint/forensics/reconwhore/$username.log
elif [[ $check_fansly == *'0'* ]]; then
    printf "\e[1;93mNot Found!\e[0m\n"
fi
partial
}
banner
scanner


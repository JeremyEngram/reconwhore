#!/bin/bash
# ReconWhore v1.5
# Author: @NSR
# https://github.com/thelinuxchoice/usercheck

trap 'printf "\n";partial;exit 1' 2

# Set the username and log file path
username=""
log_dir="/var/log/omnisint/forensics/reconwhore"

banner() {
    echo '==========================================================='
    figlet ReconWhore
    echo '==========================================================='

    echo " Refactored from userecon, reconwhore cross-refereces multiple "
    echo " OSINT-based datapoints for person-based recon including, "
    echo " usernames, legal names, email, social networks, and extends to.."
    echo " adult sites, members only content sites, public records... more!"
    echo '==========================================================='

    printf "Scans A Username And Cross-References Across Multiple Adult\n"
    printf "Social Networks To Validate That Person As Being Active Or \n"
    printf "Otherwise inconsistent catfish/fake/stalker/trolling...\n"
    printf "If accounts are found, it redundanly attemps to pull personally\n"
    printf "posted content from their account with any personally identifiable\n"
    printf "information from various sources such as age/dob/phone/addresses.\n"
}

partial() {
    if [[ -e "$log_dir/$username.log" ]]; then
        printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.log\n" "$log_dir/$username"
    fi
}

scanner() {
    read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Username:\e[0m ' username

    # Create log directory if it doesn't exist
    mkdir -p "$log_dir"

    # Change ownership and permissions for the log file
    touch "$log_dir/$username.log"
    chmod 600 "$log_dir/$username.log"
    chown "$(whoami)" "$log_dir/$username.log"

    # Backup the last log file if it exists
    if [[ -e "$log_dir/$username.log" ]]; then
        printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Creating reconwhore backup for last file:\e[0m\e[1;77m %s.log\n" "$log_dir/$username"
        zip -r "/home/$(whoami)/reconwhore.zip" "$log_dir/$username.log"
    fi

    printf "\n"
    printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m\n" "$username"
}

banner
scanner

# ReconWhore v1.0
# Author: @NSR
# https://github.com/JeremyEngram/ReconWhore


Some of "Found!" result is wrong/incorrect
Edit "grep -o 'sometexthere' ; echo $?" to fix the problem

Find usernames, legal names, emails, phone, address (majority untested)...etc  iterate across countless social networks, public records, even adult sites!
This is useful if you are running an investigation to determine the usage of the same username+email+name on different social networks, public records searches or 
for validating characteristics about a person or persons of interest for persona_development in Offensive-OSINT Operations.

URL2DatasetScraper = first run tool to gather a list of sussinctly scraped urls from public records data source.
populatereconwhore = creates an array of "double-quoted" list of arrays from the list of scraped urls and populates.
populatesiteslistfunction.sh = interate the populated dataset array to/from csv list of urls recurively on the fly.

=> [from there it goes directly into reconwhore.sh as a replaced or appended list of checks from counltess other sites.]

## TODO:

- [ ] Alphabetize the checks
- [ ] Add the website name to the created document
- [ ] Add more checks
- [ ] Possibly add in controlled variations?
- [ ] Add triple (maybe more?) checking to determine which are false-positives, or false negatives
- [ ] 

# Installation 

$ sudo apt update && apt upgrade

$ git clone https://github.com/JeremyEngram/ReconWhore.git

$ cd ReconWhore

$ ./ReconWhore

$ ./populatesiteslistfunction.sh  

### This tool has been tested in many os like parrot os , kali linux ,ubuntu os all of them works perfectly fine  !

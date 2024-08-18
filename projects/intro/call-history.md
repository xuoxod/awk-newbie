## awk -F "," 'NR!=1{print $2"\t "$1"\t "$3"\n"}' ./nodes-on-my-network.csv

---

## awk '$1 ~ /^Linux1/'

---

## awk '/^[[:blank:]]\*Linux1/ {print}'

---

awk -F "," 'NR!=1{print $2"\t"$1"\t "$3}' ./nodes-on-my-network.csv

---

awk -F "," 'NR!=1{print "\nURL: "$1"\nUsername: "$2"\nPWD: "$3"\n\n"} {print "+++++++++++++++++++++++++\n\n"}' ~/Documents/information/files/passwords/logins.csv

---

awk -F "," 'NR!=1{print "URL:\t\t" $1"\nName:\t\t "$2"\nPWD:\t\t "$3"\n\n"}NR==1{print " "$1" "$2" "$3}' ~/Documents/information/files/passwords/logins.csv

---

awk -F "," 'NR!=1{print "URL:\t\t" $1"\nName:\t\t "$2"\nPWD:\t\t "$3"\n\n"}NR==1{print "\n\n "$1" "$2" "$3"\n\n"}' ~/Documents/information/files/passwords/logins.csv

---

awk -F "," 'NR!=1{print "URL:\t\t" $1"\nName:\t\t "$2"\nPWD:\t\t "$3"\n\n"}NR==1{print "\n\n "$1" "$2" "$3"\n\n"}' ~/Documents/information/files/passwords/logins.csv

---

awk -F "," 'NR!=1{print "\n\n"$1"\n"$2"\n"$3"\n\n"}NR==1{print "\n\n\t "$1" \t "$2" \t"$3"\n\n"}' ./nmap-host-scan.csv

---

## awk -F "," 'NR!=1{print "\n\n"$1"\t"$2"\t"$3"\n\n"}NR==1{print "\n\n\t "$1" \t "$2" \t"$3"\n\n"}' ./nmap-host-scan.csv

---

## awk -F "," 'NR!=1{print "\n\n"$1"\t"$2"\t"$3"\n"}NR==1{print "\n\n\t "$1" \t "$2" \t"$3"\n\n"}' ./nmap-host-scan.csv

---

## awk -F "," 'NR!=1{print "\n"$1"\t"$2"\t"$3}NR==1{print "\n\n\t "$1" \t "$2" \t"$3"\n\n"}' ./nmap-host-scan.csv

---

awk -F "," 'NR!=1{print "\n"$1"\t"$2"\t"$3}NR==1{print "\n\n\t "$1" \t "$2" \t"$3"\n"}' ./nmap-host-scan.csv

---

awk -F "," 'NR!=1{print "\n"$1"\t"$2"\t"$3}NR==1{print "\n\n\t "$1" \t "$2" \t"$3}' ./nmap-host-scan.csv

---

awk -v USER_DEFINED_LIMIT=11 -f main.awk "$f1"

---

c;awk -F , -v USER_DEFINED_LIMIT=3 -f main.awk "$logins"

---

## awk -F , -v USER_DEFINED_LIMIT=3 -f main.awk "$logins"

---

## awk -F "," 'NR!=1{printf "%34s %34s\n",$3,$1}' $filepath

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

---

web app fuzzing framework
fast
replaces every occurrence of "FUZZ" with wordlist contents

basic
```bash
wfuzz options -z payload,params url
```

specify a wordlist
```bash
wfuzz -z file,/usr/share/wordlists/list.txt http://targetname.com/FUZZ
```
-z : specifies type, file above
FUZZ will be replaced with the wordlist items

API version
```shell
wfuzz -d {"email":"robot001@example.com","password":"FUZZ"}' --hc 405 -H Content-Type: application/json' -z file,/home/bikeride/tools/wordlists/rockyou.txt http://127.0.0.1:8888/api/v2/auth
```
  - -hc hides 405

specify a payload
```bash
wfuzz -X POST -z list,admin-dashboard-docs-api-test http://targetname.com/FUZZ
```
-X : HTTP method (POST)
-z : list

specify range
```bash
wfuzz -z range,500-1000 http://targetname.com/account?user_id=FUZZ
```
-z : range from 500-1000

specify multiple positions
```bash
wfuzz -z list,A-B-C -z range,1-3 http://targetname.com/FUZZ/user_id=FUZZ1
```
FUZZ will use the list A/B/C
FUZZ1 will use range 1 to 3
FUZZ2, FUZZ3, etc

# Include results
```bash
wfuzz -z file,/usr/share/wordlists/list.txt –sc 200 http://targetname.com/FUZZ
```
-sc : filters for 200
Others
--sl : filter for # of lines
--sw : filter on # of words
--sh : filter on # characters

# Exclude Results
```bash
wfuzz -z file,/usr/share/wordlists/list.txt –hc 404 http://targetname.com/FUZZ
```
-hc : response codes
others
--hl : filter for # of lines
--hw : filter on # of words
--hh : filter on # characters

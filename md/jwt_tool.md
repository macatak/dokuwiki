[[basic use]]
```bash
python3 <path to jwt tool>/jwt_tool <jw_token>
```
Example
```bash
python3 jwt_tool.py <jwt>
```
output
```text
=====================
Decoded Token Values:                          
=====================                                                  

Token header values:                              
[+] alg = "RS256"

Token payload values:                             
[+] sub = "spam@eggs.com"
[+] role = "user"
[+] iat = 1694294657    ==> TIMESTAMP = 2023-09-09 15:24:17 (UTC)
[+] exp = 1694899457    ==> TIMESTAMP = 2023-09-16 15:24:17 (UTC)

Seen timestamps:                                  
[*] iat was seen
[*] exp is later than iat by: 7 days, 0 hours, 0 mins

----------------------                            
JWT common timestamps:                            
iat = IssuedAt                                    
exp = Expires                                     
nbf = NotBefore                                   
----------------------  
```
[[Playbook Attack]] - hunt for common misconfiguration
needs validation!!
```shell
python3 jwt_tool.py -t https://www.Mtarget site>.com/ -rc "Header: <jwt>" -M pb
```
[[Algorithm Attacks]]
generate none tokens
```shell
python3 jwt_tool.py <jwt> -X a
```
Check  multiple algorithms
needs validation
providing the Public Key in PEM format
```shell
python3 jwt_tool.py <jwt> -V -pk public.pem`
```

[[Crack Attack]]
will either return “CORRECT key!”
```shell
jwt_tool <jwt> -C -d /wordlist.txt
```

Crack passwords
```shell


```

Needs a GitHub clone and some packages
```shell
https://github.com/ticarpi/jwt_tool.git
python3 -m pip install termcolor cprint pycryptodomex requests
```

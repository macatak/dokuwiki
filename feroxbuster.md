  - basic search
```bash
feroxbuster -u http://10.10.245.141
```

  - nicer formatting
```bash
feroxbuster -C 404 -T 3 --silent -u http://83.136.252.24
```

  - Add a proxy or port (HTB does this)
```shell-session
feroxbuster -u http://94.237.48.48 -p 94.237.48.48:56612
```
  - All together
```shell-session
feroxbuster -C 404 -T 3 --silent -p 94.237.48.48:56612 -u http://94.237.48.48
```
  - adds .pdf, .js, .html, .php, .txt, .json, and .docx to each url
```bash
feroxbuster -u http://127.1 -x pdf -x js,html -x php txt json,docx
```

  - resume from a state file 
```bash
feroxbuster --resume-from <STATE_FILE>
```




--resume-from <STATE_FILE>
  State file from which to resume a partially complete scan, file is in same folder where the scan was run (.state file)

```bash
searchsploit afd windows local
searchsploit MS14-040
```

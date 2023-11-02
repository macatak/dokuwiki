[[mitmweb]] - Can export to create API docs
  - create an Open API 3.0 YAML file
  - can imported as a collection into Postman.
  - can be viewed in a browser

start
```bash
mitmweb
```

#  cert
1. set a proxy to send to 8080
2. open a browser to http://mitm.it/
3. pick the cert (Firefox needs it's own)
4. install it



# use

1. explore the app with the proxy on
2. Go to the webserver - http://127.0.0.1:8081/#/flows
3. File -> Save
4. Creates a file called flows

Create a collection with mitmproxy2swagger
install
```bash
pip3 install mitmproxy2swagger
```
Run
Assumes flow file is in same folder
```bash
mitmproxy2swagger -i flows -o spec.yml -p http://crapi.apisec.ai -f flow
```

creates a spec.yml. Open it and check the ignores, remove any that should be included

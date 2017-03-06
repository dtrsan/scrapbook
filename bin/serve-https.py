#!/usr/bin/env python

import BaseHTTPServer, SimpleHTTPServer
import os, ssl

port=8443

httpd = BaseHTTPServer.HTTPServer(('localhost', port), SimpleHTTPServer.SimpleHTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket, certfile=os.path.expanduser('~/.certs/localhost.pem'), server_side=True)
print ("Listening at https://0.0.0.0:%d" % port)
print ("Press CTRL+C to quit...")
httpd.serve_forever()


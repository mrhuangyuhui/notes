# CURL

```bash
$ curl -h
Usage: curl [options...] <url>
Options: (H) means HTTP/HTTPS only, (F) means FTP only
 -I, --head          Show document info only
 -i, --include       Include protocol headers in the output (H/F)
```

```bash
$ curl -I www.163.com
HTTP/1.1 200 OK
Expires: Tue, 03 Apr 2018 12:16:07 GMT
Date: Tue, 03 Apr 2018 12:14:47 GMT
Server: nginx
Content-Type: text/html; charset=GBK
Vary: Accept-Encoding,User-Agent,Accept
Cache-Control: max-age=80
X-Via: 1.1 VMxjpSin1xp38:5 (Cdn Cache Server V2.0), 1.1 xhtarhub202:5 (Cdn Cache Server V2.0)
Connection: keep-alive
```

GET 请求

```bash
curl -X GET localhost:8080
```

POST 请求

```bash
curl -X POST localhost:8080
```

Basic 认证

```bash
curl --basic -u user:password http://www.example.com/
```

Digest 认证

```bash
curl --digest -u user:password http://www.example.com/
```

## Blogs

<https://www.cnblogs.com/coderland/p/5883763.html>

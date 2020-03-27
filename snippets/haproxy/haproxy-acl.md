# HAProxy - ACL

[Using ACLs and fetching samples](http://cbonte.github.io/haproxy-dconv/1.8/configuration.html#7)

```bash
acl <aclname> <criterion> [flags] [operator] [<value>] ...
```

```bash
The following ACL flags are currently supported :

   -i : ignore case during matching of all subsequent patterns.
   -f : load patterns from a file.
   -m : use a specific pattern matching method
   -n : forbid the DNS resolutions
   -M : load the file pointed by -f like a map file.
   -u : force the unique id of the ACL
   -- : force end of flags. Useful when a string looks like one of the flags.
```

```bash
Available operators for integer matching are :

  eq : true if the tested value equals at least one value
  ge : true if the tested value is greater than or equal to at least one value
  gt : true if the tested value is greater than at least one value
  le : true if the tested value is less than or equal to at least one value
  lt : true if the tested value is less than at least one value
```

```bash
Some actions are only performed upon a valid condition. A condition is a
combination of ACLs with operators. 3 operators are supported :

  - AND (implicit)
  - OR  (explicit with the "or" keyword or the "||" operator)
  - Negation with the exclamation mark ("!")
```

[req.hdr](http://cbonte.github.io/haproxy-dconv/1.8/configuration.html#7.3.6-req.hdr)

```bash
ACL derivatives :
  hdr([<name>[,<occ>]])     : exact string match
  hdr_beg([<name>[,<occ>]]) : prefix match
  hdr_dir([<name>[,<occ>]]) : subdir match
  hdr_dom([<name>[,<occ>]]) : domain match
  hdr_end([<name>[,<occ>]]) : suffix match
  hdr_len([<name>[,<occ>]]) : length match
  hdr_reg([<name>[,<occ>]]) : regex match
  hdr_sub([<name>[,<occ>]]) : substring match
```

[path](http://cbonte.github.io/haproxy-dconv/1.8/configuration.html#7.3.6-path)

```bash
ACL derivatives :
  path     : exact string match
  path_beg : prefix match
  path_dir : subdir match
  path_dom : domain match
  path_end : suffix match
  path_len : length match
  path_reg : regex match
  path_sub : substring match
```

```bash
#---------------------------------------------------------------------
# Haproxy 所在主机的 IP 地址 192.168.31.134
#---------------------------------------------------------------------
frontend frontend_www
    bind 192.168.31.134:80 # 绑定 IP 地址和监听端口
    mode http
    option httplog
    option forwardfor # 记录客户端真是 IP 地址
    log global

    # 域名匹配 -i 表示不区分大小写
    acl host_web1 hdr_dom(host) -i www.web1.com
    acl host_web2 hdr_dom(host) -i www.web2.com
    acl host_web3 hdr_dom(host) -i www.web3.com
    # 如果符合规则，则转发到后端服务器群 backend_www
    use_backend backend_www if host_web1 || host_web2 || host_web3

backend backend_www
    mode http
    option redispatch
    option abortonclose
    # 转发到以下服务器
    server web1 192.168.31.211:80 weight 6 check inter 2000 rise 2 fall 3
    server web2 192.168.31.212:80 weight 6 check inter 2000 rise 2 fall 3
    server web3 192.168.31.213:80 weight 6 check inter 2000 rise 2 fall 3
```
[TOC]

# Keepalived Manual

http://www.keepalived.org

https://github.com/acassen/keepalived

## Installation

http://www.keepalived.org/doc/installing_keepalived.html

```bash
yum install -y keepalived
```

```bash
apt-get install -y keepalived
```

## Configuration

http://www.keepalived.org/doc/configuration_synopsis.html

## Commands

http://www.keepalived.org/doc/programs_synopsis.html

```bash
systemctl start keepalived
```

```
$ keepalived -h
Usage: keepalived [OPTION...]
  -f, --use-file=FILE          Use the specified configuration file
  -P, --vrrp                   Only run with VRRP subsystem
  -C, --check                  Only run with Health-checker subsystem
  -l, --log-console            Log messages to local console
  -D, --log-detail             Detailed log messages
  -S, --log-facility=[0-7]     Set syslog facility to LOG_LOCAL[0-7]
  -X, --release-vips           Drop VIP on transition from signal.
  -V, --dont-release-vrrp      Don't remove VRRP VIPs and VROUTEs on daemon stop
  -I, --dont-release-ipvs      Don't remove IPVS topology on daemon stop
  -R, --dont-respawn           Don't respawn child processes
  -n, --dont-fork              Don't fork the daemon process
  -d, --dump-conf              Dump the configuration data
  -p, --pid=FILE               Use specified pidfile for parent process
  -r, --vrrp_pid=FILE          Use specified pidfile for VRRP child process
  -c, --checkers_pid=FILE      Use specified pidfile for checkers child process
  -a, --address-monitoring     Report all address additions/deletions notified via netlink
  -x, --snmp                   Enable SNMP subsystem
  -A, --snmp-agent-socket=FILE Use the specified socket for master agent
  -s, --namespace=NAME         Run in network namespace NAME (overrides config)
  -m, --core-dump              Produce core dump if terminate abnormally
  -M, --core-dump-pattern=PATN Also set /proc/sys/kernel/core_pattern to PATN (default 'core')
  -i, --config_id id           Skip any configuration lines beginning '@' that don't match id
  -v, --version                Display the version number
  -h, --help                   Display this help message
```

## Tutorials

[Keepalived User Guide](http://www.keepalived.org/doc/)

## Examples

[How To Set Up Highly Available Web Servers with Keepalived and Floating IPs on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-highly-available-web-servers-with-keepalived-and-floating-ips-on-ubuntu-14-04)

[VPC 内通过 keepalived 搭建高可用主备集群](https://cloud.tencent.com/document/product/215/5850)

https://github.com/acassen/keepalived/tree/master/doc/samples

https://github.com/acassen/keepalived/blob/master/doc/samples/keepalived.conf.vrrp.localcheck

https://github.com/acassen/keepalived/blob/master/doc/samples/keepalived.conf.vrrp.scripts
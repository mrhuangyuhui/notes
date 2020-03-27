# Firewalld Manual

防火墙

<http://www.firewalld.org/>

[Using Firewalls in RHEL-7](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Security_Guide/sec-Using_Firewalls.html) (Red Hat Customer Portal)

## [Installation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-installing_firewalld)

```bash
yum install -y firewalld
```

## Commands

```bash
systemctl status firewalld
systemctl start firewalld
systemctl stop firewalld
systemctl restart firewalld
systemctl enable firewalld
systemctl disable firewalld
```

## Files

```bash
$ rpm -ql firewalld
/etc/firewalld
/etc/firewalld/firewalld.conf
/etc/firewalld/helpers
/etc/firewalld/icmptypes
/etc/firewalld/ipsets
/etc/firewalld/lockdown-whitelist.xml
/etc/firewalld/services
/etc/firewalld/zones
/usr/bin/firewall-cmd
```

## [Documentation](http://www.firewalld.org/documentation/)

### [Utilities](http://www.firewalld.org/documentation/utilities/)

#### [firewall-cmd](http://www.firewalld.org/documentation/utilities/firewall-cmd.html)

To get the firewalld version:
```
$ firewall-cmd --version
0.4.3.3
```

To get the firewall-cmd help output:
```
$ firewall-cmd --help
```

To get the firewalld state:
```
$ firewall-cmd --state
running
```

To get the active zones with bindings:
```
$ firewall-cmd --get-active-zones
public
  interfaces: em1
```

To get the zone of the interface em1
```
$ firewall-cmd --get-zone-of-interface=em1
public
```

### [Zone](http://www.firewalld.org/documentation/zone/)

- [Predefined Zones](http://www.firewalld.org/documentation/zone/predefined-zones.html)
- [Options](http://www.firewalld.org/documentation/zone/options.html)
- [Examples](http://www.firewalld.org/documentation/zone/examples.html)

**public**
```xml
<?xml version="1.0" encoding="utf-8"?>
<zone>
  <short>Public</short>
  <description>For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>
  <service name="ssh"/>
  <service name="dhcpv6-client"/>
</zone>
```


### [Service](http://www.firewalld.org/documentation/service/)

- [Options](http://www.firewalld.org/documentation/service/options.html)
- [Examples](http://www.firewalld.org/documentation/service/examples.html)

**ftp**
```xml
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>FTP</short>
  <description>FTP is a protocol used for remote file transfer. If you plan to make your FTP server publicly available, enable this option. You need the vsftpd package installed for this option to be useful.</description>
  <port protocol="tcp" port="21"/>
  <module name="nf_conntrack_ftp"/>
</service>
```

### [HowTo](http://www.firewalld.org/documentation/howto/)

#### [Enable and Disable firewalld](http://www.firewalld.org/documentation/howto/enable-and-disable-firewalld.html)

##### Install and enable `firewalld`

If the `iptables`, `ip6tables`, `ebtables` and `ipset` services are in use:
```bash
systemctl disable --now iptables.service
systemctl disable --now ip6tables.service
systemctl disable --now etables.service
systemctl disable --now ipset.service
dnf install firewalld firewall-config firewall-applet
systemctl unmask --now firewalld.service
systemctl enable --now firewalld.service
```

##### Install and enable `iptables`, `ip6tables`, `ebtables` and `ipset` services
```
If firewalld is enabled and you want to enable the iptables, ip6tables, ebtables and ipset services instead:

dnf install iptables-services ebtables ipset-service
systemctl mask --now firewalld.service
systemctl enable --now iptables.service
systemctl enable --now ip6tables.service
systemctl enable --now etables.service
systemctl enable --now ipset.service
```

####  [Get firewalld State](http://www.firewalld.org/documentation/howto/get-firewalld-state.html)

```bash
firewall-cmd --state
```

```bash
systemctl status firewalld
```

#### [Reload firewalld](http://www.firewalld.org/documentation/howto/reload-firewalld.html)

```
firewall-cmd --reload

firewall-cmd --complete-reload
```

#### [Open a Port or Service](http://www.firewalld.org/documentation/howto/open-a-port-or-service.html)

```bash
firewall-cmd --zone=public --add-port=80/tcp

firewall-cmd --permanent --zone=public --add-port=80/tcp
```

```bash
firewall-cmd --zone=public --add-service=http

firewall-cmd --permanent --zone=public --add-service=http
```

#### [Add a Service](http://www.firewalld.org/documentation/howto/add-a-service.html)

```bash
firewall-cmd --permanent --new-service=myservice

firewall-cmd --permanent --service=service --set-description=description
firewall-cmd --permanent --service=service --set-short=description
firewall-cmd --permanent --service=service --add-port=portid[-portid]/protocol
firewall-cmd --permanent --service=service --add-protocol=protocol
firewall-cmd --permanent --service=service --add-source-port=portid[-portid]/protocol
firewall-cmd --permanent --service=service --add-module=module
firewall-cmd --permanent --service=service --set-destination=ipv:address[/mask]
```

```bash
firewall-cmd --permanent --new-service-from-file=myservice.xml

firewall-cmd --permanent --new-service-from-file=myservice.xml --name=mynewservice
```

```
cp myservice.xml /etc/firewalld/services
```

### [Manual Pages](http://www.firewalld.org/documentation/man-pages/)

- [firewalld(1)](http://www.firewalld.org/documentation/man-pages/firewalld.html)
- [firewall-cmd(1)](http://www.firewalld.org/documentation/man-pages/firewall-cmd.html)

## [5.3. Configuring firewalld](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-configuring_firewalld) (Red Hat Customer Portal)

### [5.3.4. Viewing the Firewall Settings](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-configuring_firewalld#sec-Viewing_the_Firewall_Settings_Using_CLI)

To get a text display of the state of firewalld
```bash
firewall-cmd --state
```

To view the list of active zones with a list of the interfaces currently assigned to them
```
$ firewall-cmd --get-active-zones
public
  interfaces: eth0
```

To find out the zone that an interface is currently assigned to
```
$ firewall-cmd --get-zone-of-interface=eth0
public
```

To find out all the interfaces assigned to a zone
```
$ firewall-cmd --zone=public --list-interfaces
eth0
```


To find out all the settings of a zone
```bash
firewall-cmd --zone=public --list-all
```

To view the zone information
```bash
firewall-cmd --info-zone=public
```

To view the list of services **currently loaded**
```bash
firewall-cmd --get-services
```
This lists the names of the predefined services loaded from `/usr/lib/firewalld/services/` as well as any custom services that are **currently loaded**. 

To list the custom services that have been created but **not loaded**
```bash
firewall-cmd --permanent --get-services
```
This lists all services, including custom services configured in `/etc/firewalld/services/`, even if they are **not yet loaded**.

To show the settings of the ftp service
```bash
firewall-cmd --info-service=ftp
```

### [5.3.5. Changing the Firewall Settings](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-configuring_firewalld#sec-Changing_the_Firewall_Settings-CLI)

#### 5.3.5.2. Reloading the Firewall

To reload the firewall without interrupting user connections (without losing state information)
```bash
firewall-cmd --reload
```

To reload the firewall and interrupt user connections, discarding state information
```bash
firewall-cmd --complete-reload
```

#### 5.3.5.3. Add an Interface to a Zone

To add an interface to a zone
```bash
firewall-cmd --zone=public --add-interface=eth0
```

#### 5.3.5.6. Setting the Default Zone

To set the default zone
```bash
firewall-cmd --set-default-zone=public
```

#### 5.3.5.7. Opening Ports in the Firewall

To list all open ports for a zone
```bash
firewall-cmd --zone=dmz --list-ports       
```

To add a port to a zone
```bash
firewall-cmd --zone=dmz --add-port=8080/tcp
```

To add a range of ports to a zone
```bash
firewall-cmd --zone=public --add-port=5060-5061/udp
```

#### 5.3.5.8. Opening Protocols

To list all open protocols for a zone
```bash
firewall-cmd --zone=dmz --list-protocols
```

To add a protocol to a zone
```bash
firewall-cmd --zone=dmz --add-protocol=esp
```

#### 5.3.5.9. Opening Source Ports

To list all open source ports for a zone
```bash
firewall-cmd --zone=dmz --list-source-ports
```

To add a source port to a zone
```bash
firewall-cmd --zone=dmz --add-source-port=8080/tcp
```

To add a range of source ports to a zone 
```bash
firewall-cmd --zone=public --add-source-port=5060-5061/udp
```

#### 5.3.5.10. Adding a Service to a Zone

To add a service to a zone
```
firewall-cmd --zone=work --add-service=smtp
```

#### 5.3.5.11. Removing a Service from a Zone

To remove a service from a zone
```bash
firewall-cmd --zone=work --remove-service=smtp
```

#### 5.3.5.12. Adding a Service to a Zone by Editing XML Files

```bash
cp /usr/lib/firewalld/zones/work.xml /etc/firewalld/zones/
```








# APT Practice

https://www.debian.org/doc/manuals/debian-reference/ch02.en.html

https://www.debian.org/mirror/list.en.html

https://wiki.debian.org/SourcesList

```bash
$ cat /etc/apt/sources.list
```

[sources.list(5)](https://manpages.debian.org/stretch/apt/sources.list.5.en.html) man page
```bash
$ man sources.list
```

## Packages

Building
```
apt-get install -y build-essential libtool
```

Compress
```bash
apt-get install tar zip unzip
```

[GitLab](https://about.gitlab.com/installation/#ubuntu)
```bash
sudo apt-get install -y curl openssh-server ca-certificates

sudo apt-get install -y postfix
```

## apt

Show manual
```bash
$ man apt
```

Show help message
```bash
$ apt -h
apt 1.0.9.8.4 for amd64 compiled on Dec 11 2016 09:48:19
Usage: apt [options] command

CLI for apt.
Basic commands: 
 list - list packages based on package names
 search - search in package descriptions
 show - show package details

 update - update list of available packages

 install - install packages
 remove  - remove packages

 upgrade - upgrade the system by installing/upgrading packages
 full-upgrade - upgrade the system by removing/installing/upgrading packages

 edit-sources - edit the source information file
```

Update packages list
```bash
$ apt update

# Package repositories
$ cat /etc/apt/sources.list
```

Install packages
```
$ apt install apache2
```

Remove packages
```bash
$ apt remove apache2
```

List packages based on package names
```
$ apt list
```

Show installed packages
```bash
$ apt list --installed
```

Show versions and archive areas of available packages
```bash
$ apt list -a apache2
```

Show package information
```bash
$ apt show -a apache2
```

Search packages and descriptions
```bash
$ apt search apache2
```

https://www.debian.org/doc/manuals/refcard/refcard

https://wiki.debian.org/Apt

## aptitude

Show help message
```bash
$ aptitude -h
```

Show manual
```bash
$ man aptitude
```

Update the packages list
```bash
$ aptitude update
```

Perform a safe upgrade
```bash
$ aptitude safe-upgrade
```

Install/upgrade packages
```bash
$ aptitude install foo
```

Remove packages
```bash
$ aptitude remove bar
```

Remove packages and their configuration files
```bash
$ aptitude purge foo
```

Search for a package by name and/or expression
```bash
$ aptitude search foo
```

Display detailed information about a package
```bash
$ aptitude show foo
```

https://wiki.debian.org/Aptitude

http://aptitude.alioth.debian.org/doc/en/

## apt-get

https://wiki.debian.org/apt-get

Show help message
```bash
$ apt-get -h
apt 1.0.9.8.4 for amd64 compiled on Dec 11 2016 09:48:19
Usage: apt-get [options] command
       apt-get [options] install|remove pkg1 [pkg2 ...]
       apt-get [options] source pkg1 [pkg2 ...]

apt-get is a simple command line interface for downloading and
installing packages. The most frequently used commands are update
and install.

Commands:
   update - Retrieve new lists of packages
   upgrade - Perform an upgrade
   install - Install new packages (pkg is libc6 not libc6.deb)
   remove - Remove packages
   autoremove - Remove automatically all unused packages
   purge - Remove packages and config files
   source - Download source archives
   build-dep - Configure build-dependencies for source packages
   dist-upgrade - Distribution upgrade, see apt-get(8)
   dselect-upgrade - Follow dselect selections
   clean - Erase downloaded archive files
   autoclean - Erase old downloaded archive files
   check - Verify that there are no broken dependencies
   changelog - Download and display the changelog for the given package
   download - Download the binary package into the current directory

Options:
  -h  This help text.
  -q  Loggable output - no progress indicator
  -qq No output except for errors
  -d  Download only - do NOT install or unpack archives
  -s  No-act. Perform ordering simulation
  -y  Assume Yes to all queries and do not prompt
  -f  Attempt to correct a system with broken dependencies in place
  -m  Attempt to continue if archives are unlocatable
  -u  Show a list of upgraded packages as well
  -b  Build the source package after fetching it
  -V  Show verbose version numbers
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
See the apt-get(8), sources.list(5) and apt.conf(5) manual
pages for more information and options.
                       This APT has Super Cow Powers.
```

Show manual
```bash
$ man apt-get
```

Update packages list
```bash
$ apt-get update
```

Install packages
```bash
$ apt-get install apache2
```

Remove packages
```bash
$ apt-get remove apache2
```

## Packages

- [asciidoc](http://www.asciidoc.org)
```bash
Package: asciidoc
Homepage: http://www.asciidoc.org
Description: Highly configurable text format for writing documentation
 AsciiDoc is a text document format for writing articles, books, manuals and
 UNIX man pages. AsciiDoc files can be translated to HTML (with or without
 stylesheets), DocBook (articles, books and refentry documents) and LinuxDoc
 using the asciidoc command. AsciiDoc can also be used to build and maintain
 websites.
 .
 You write an AsciiDoc document the same way you would write a
 normal text document, there are no markup tags or weird format notations.
 AsciiDoc files are designed to be viewed, edited and printed directly or
 translated to other presentation formats
```

- [dh-autoreconf]()
```bash
Package: dh-autoreconf
Description: debhelper add-on to call autoreconf and clean up after the build
 dh-autoreconf provides a debhelper sequence addon named 'autoreconf' and two
 commands, dh_autoreconf and dh_autoreconf_clean.
 .
 The dh_autoreconf command creates a list of the files and their checksums,
 calls autoreconf and then creates a second list for the new files.
 .
 The dh_autoreconf_clean command compares these two lists and removes all
 files which have been added or changed (files may be excluded if needed).
 .
 For CDBS users, a rule is provided to call the dh-autoreconf programs at
 the right time.
```

- [docbook2x](http://docbook2x.sourceforge.net)
```bash
Package: docbook2x
Homepage: http://docbook2x.sourceforge.net
Description: Converts DocBook/XML documents into man pages and TeXinfo
 The main tools are:
  * docbook2x-man: converts a DocBook/XML refentry into a manual page,
    with table support
  * docbook2x-texi: converts a DocBook/XML refentry into an info page,
    most usable for Emacs users
```

- [gettext](http://www.gnu.org/software/gettext/)
```bash
Package: gettext
Homepage: http://www.gnu.org/software/gettext/
Description: GNU Internationalization utilities
 Interesting for authors or maintainers of other packages or programs
 which they want to see internationalized.
```

- [libapache2-svn](http://subversion.apache.org/)
```bash
Package: libapache2-svn
Homepage: http://subversion.apache.org/
Description: Apache Subversion server modules for Apache httpd (dummy package)
 This is a transition package to install the Apache Subversion server
 module for Apache httpd.  You may remove this package if nothing depends
 on it.
```

- [libcurl4-gnutls-dev](http://curl.haxx.se)
```bash
Package: libcurl4-gnutls-dev
Homepage: http://curl.haxx.se
Description: development files and documentation for libcurl (GnuTLS flavour)
 libcurl is an easy-to-use client-side URL transfer library, supporting DICT,
 FILE, FTP, FTPS, GOPHER, HTTP, HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S,
 RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, TELNET and TFTP.
 .
 libcurl supports SSL certificates, HTTP POST, HTTP PUT, FTP uploading, HTTP
 form based upload, proxies, cookies, user+password authentication (Basic,
 Digest, NTLM, Negotiate, Kerberos), file transfer resume, http proxy tunneling
 and more!
 .
 libcurl is free, thread-safe, IPv6 compatible, feature rich, well supported,
 fast, thoroughly documented and is already used by many known, big and
 successful companies and numerous applications.
 .
 This package provides the development files (ie. includes, static library,
 manual pages) that allow one to build software which uses libcurl.
 .
 SSL support is provided by GnuTLS.
```

- [libexpat1-dev](http://expat.sourceforge.net)
```bash
Package: libexpat1-dev
Homepage: http://expat.sourceforge.net
Description: XML parsing C library - development kit
 This package contains the header file and development libraries of
 expat, the C library for parsing XML.  Expat is a stream oriented XML
 parser.  This means that you register handlers with the parser prior
 to starting the parse.  These handlers are called when the parser
 discovers the associated structures in the document being parsed.  A
 start tag is an example of the kind of structures for which you may
 register handlers.
```

- libssl-dev
```bash
Package: libssl-dev
Description: Secure Sockets Layer toolkit - development files
 This package is part of the OpenSSL project's implementation of the SSL
 and TLS cryptographic protocols for secure communication over the
 Internet.
 .
 It contains development libraries, header files, and manpages for libssl
 and libcrypto.
```

- [subversion](http://subversion.apache.org/)
```bash
Package: subversion
Homepage: http://subversion.apache.org/
Description: Advanced version control system
 Apache Subversion, also known as svn, is a centralised version control
 system.  Version control systems allow many individuals (who may be
 distributed geographically) to collaborate on a set of files (source
 code, websites, etc).  Subversion began with a CVS paradigm and
 supports all the major features of CVS, but has evolved to support
 many features that CVS users often wish they had.
 .
 This package includes the Subversion client (svn), repository
 administration tools (svnadmin, svnlook) and a network server (svnserve).
```

- [xmlto](https://fedorahosted.org/xmlto/)
```bash
Package: xmlto
Homepage: https://fedorahosted.org/xmlto/
Description: XML-to-any converter
 xmlto is a front-end to an XSL toolchain. It chooses an appropriate
 stylesheet for the conversion you want and applies it using an external
 XSLT processor (currently, only xsltproc is supported). It also performs
 any necessary post-processing.
 .
 It supports converting from DocBook XML to DVI, XSL-FO, HTML and XHTML
 (one or multiple pages), epub, manual page, PDF, PostScript and plain
 text. It also supports converting from XSL-FO to DVI, PDF and PostScript.
 .
 DVI output requires dblatex or PassiveTeX. Other formats can be produced
 with any of the supported toolchains - dblatex, PassiveTeX or
 docbook-xsl/fop (but may require some extensions).
```

- [zlib1g-dev](http://zlib.net/)
```bash
Package: zlib1g-dev
Homepage: http://zlib.net/
Description: compression library - development
 zlib is a library implementing the deflate compression method found
 in gzip and PKZIP.  This package includes the development support
 files.
```





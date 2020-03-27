# YUM Packages

安装常用软件包 [`install-hot-packages.sh`](https://github.com/mrhuangyuhui/yum/blob/master/install-hot-packages.sh)

```bash
curl -L https://github.com/mrhuangyuhui/yum/raw/master/install-hot-packages.sh | bash
```

```bash
Name        : apr
Summary     : Apache Portable Runtime library
URL         : http://apr.apache.org/
Description : The mission of the Apache Portable Runtime (APR) is to provide a
            : free library of C data structures and routines, forming a system
            : portability layer to as many operating systems as possible,
            : including Unices, MS Win32, BeOS and OS/2.
```

```bash
Name        : apr-util
Summary     : Apache Portable Runtime Utility library
URL         : http://apr.apache.org/
Description : The mission of the Apache Portable Runtime (APR) is to provide a
            : free library of C data structures and routines.  This library
            : contains additional utility interfaces for APR; including support
            : for XML, LDAP, database interfaces, URI parsing and more.
```

```
Name        : asciidoc
Summary     : Text based document generation
URL         : http://www.methods.co.nz/asciidoc/
Description : AsciiDoc is a text document format for writing short documents,
            : articles, books and UNIX man pages. AsciiDoc files can be translated
            : to HTML and DocBook markups using the asciidoc(1) command.
```

```
Name        : autoconf
Summary     : A GNU tool for automatically configuring source code
URL         : http://www.gnu.org/software/autoconf/
Description : GNU's Autoconf is a tool for configuring source code and
            : Makefiles. Using Autoconf, programmers can create portable and
            : configurable packages, since the person building the package is
            : allowed to specify various configuration options.
            : 
            : You should install Autoconf if you are developing software and
            : would like to create shell scripts that configure your source code
            : packages. If you are installing Autoconf, you will also need to
            : install the GNU m4 package.
            : 
            : Note that the Autoconf package is not required for the end-user
            : who may be configuring software with an Autoconf-generated script;
            : Autoconf is only required for the generation of the scripts, not
            : their use.
```

```
Name        : automake
Summary     : A GNU tool for automatically creating Makefiles
URL         : http://www.gnu.org/software/automake/
Description : Automake is a tool for automatically generating `Makefile.in'
            : files compliant with the GNU Coding Standards.
            : 
            : You should install Automake if you are developing software and
            : would like to use its ability to automatically generate GNU
            : standard Makefiles.
```

```
Name        : cronie
Summary     : Cron daemon for executing programs at set times
URL         : https://fedorahosted.org/cronie
Description : Cronie contains the standard UNIX daemon crond that runs specified programs at
            : scheduled times and related tools. It is a fork of the original vixie-cron and
            : has security and configuration enhancements like the ability to use pam and
            : SELinux.
```

```
# epel
Name        : dh-autoreconf
Summary     : debhelper add-on to call autoreconf and clean up after the build
URL         : http://packages.debian.org/unstable/dh-autoreconf
Description : dh-autoreconf provides a debhelper sequence addon named 'autoreconf' and two
            : commands, dh_autoreconf and dh_autoreconf_clean.
            :  * The dh_autoreconf command creates a list of the files and their checksums,
            :    calls autoreconf and then creates a second list for the new files.
            :  * The dh_autoreconf_clean command compares these two lists and removes all
            :    files which have been added or changed (files may be excluded if needed).
            : For CDBS users, a rule is provided to call the dh-autoreconf programs at the
            : right time.
```

```
# epel
Name        : docbook2X
Summary     : Convert docbook into man and Texinfo
URL         : http://docbook2x.sourceforge.net/
Description : docbook2X converts DocBook documents into man pages and Texinfo
            : documents.
```

```
Name        : expat-devel
Summary     : Libraries and header files to develop applications using expat
URL         : http://www.libexpat.org/
Description : The expat-devel package contains the libraries, include files and documentation
            : to develop XML applications with expat.
```

```
Name        : firewalld
Summary     : A firewall daemon with D-Bus interface providing a dynamic firewall
URL         : http://www.firewalld.org
Description : firewalld is a firewall service daemon that provides a dynamic customizable
            : firewall with a D-Bus interface.

```

```
Name        : freetype-devel
Summary     : FreeType development libraries and header files
URL         : http://www.freetype.org
Description : The freetype-devel package includes the static libraries and header files
            : for the FreeType font rendering engine.
            : 
            : Install freetype-devel if you want to develop programs which will use
            : FreeType.
```

```
Name        : gcc
Summary     : Various compilers (C, C++, Objective-C, Java, ...)
URL         : http://gcc.gnu.org
Description : The gcc package contains the GNU Compiler Collection version 4.8.
            : You'll need this package in order to compile C code.
```

```
Name        : gd-devel
Summary     : The development libraries and header files for gd
URL         : http://www.libgd.org/Main_Page
Description : The gd-devel package contains the development libraries and header
            : files for gd, a graphics library for creating PNG and JPEG graphics.
```

```
Name        : gettext-devel
Summary     : Development files for gettext
URL         : http://www.gnu.org/software/gettext/
Description : This package contains all development related files necessary for
            : developing or compiling applications/libraries that needs
            : internationalization capability. You also need this package if you
            : want to add gettext support for your project.
```

```
Name        : libcurl-devel
Summary     : Files needed for building applications with libcurl
URL         : http://curl.haxx.se/
Description : The libcurl-devel package includes header files and libraries necessary for
            : developing programs which use the libcurl library. It contains the API
            : documentation of the library, too.
```

```
# [forensics](https://pkgs.org/download/libiconv-devel)
Name        : libiconv-devel
Summary     : libiconv header files
URL         : http://www.haible.de/bruno/packages-libcharset.html
Description : This package contains libiconv header files.
```

```
Name        : libjpeg-turbo-devel
Summary     : Headers for the libjpeg-turbo library
URL         : http://sourceforge.net/projects/libjpeg-turbo
Description : This package contains header files necessary for developing programs which
            : will manipulate JPEG files using the libjpeg-turbo library.
```

epel
```
Name        : libmcrypt
Summary     : Encryption algorithms library
URL         : http://mcrypt.sourceforge.net/
Description : Libmcrypt is a thread-safe library providing a uniform interface
            : to access several block and stream encryption algorithms.
```


```
Name        : libpng-devel
Summary     : Development tools for programs to manipulate PNG image format files
URL         : http://www.libpng.org/pub/png/
Description : The libpng-devel package contains header files and documentation necessary
            : for developing programs using the PNG (Portable Network Graphics) library.
            : 
            : If you want to develop programs which will manipulate PNG image format
            : files, you should install libpng-devel.  You'll also need to install
            : the libpng package.
```

```
Name        : libtool
Summary     : The GNU Portable Library Tool
URL         : http://www.gnu.org/software/libtool/
Description : GNU Libtool is a set of shell scripts which automatically
            : configure UNIX and UNIX-like systems to generically build shared
            : libraries. Libtool provides a consistent, portable interface which
            : simplifies the process of using shared libraries.
            : 
            : If you are developing programs which will use shared libraries,
            : but do not use the rest of the GNU Autotools (such as GNU Autoconf
            : and GNU Automake), you should install the libtool package.
            : 
            : The libtool package also includes all files needed to integrate
            : the GNU Portable Library Tool (libtool) and the GNU Libtool
            : Dynamic Module Loader (ltdl) into a package built using the GNU
            : Autotools (including GNU Autoconf and GNU Automake).
```



```
Name        : libxml2
Summary     : Library providing XML and HTML support
URL         : http://xmlsoft.org/
License     : MIT
Description : This library allows to manipulate XML files. It includes support
            : to read, modify and write XML and HTML files. There is DTDs support
            : this includes parsing and validation even with complex DtDs, either
            : at parse time or later once the document has been modified. The output
            : can be a simple SAX stream or and in-memory DOM like representations.
            : In this case one can use the built-in XPath and XPointer implementation
            : to select sub nodes or ranges. A flexible Input/Output mechanism is
            : available, with existing HTTP and FTP modules and combined to an
            : URI library.
```

```
Name        : libxml2-devel
Summary     : Libraries, includes, etc. to develop XML and HTML applications
URL         : http://xmlsoft.org/
Description : Libraries, include files, etc you can use to develop XML applications.
            : This library allows to manipulate XML files. It includes support
            : to read, modify and write XML and HTML files. There is DTDs support
            : this includes parsing and validation even with complex DtDs, either
            : at parse time or later once the document has been modified. The output
            : can be a simple SAX stream or and in-memory DOM like representations.
            : In this case one can use the built-in XPath and XPointer implementation
            : to select sub nodes or ranges. A flexible Input/Output mechanism is
            : available, with existing HTTP and FTP modules and combined to an
            : URI library.
```


```
Name        : libxslt-devel
Summary     : Development files for libxslt
URL         : http://xmlsoft.org/XSLT/
Description : The libxslt-devel package contains libraries and header files for
            : developing applications that use libxslt.
```


- [make](http://www.gnu.org/software/make/)
```
Name        : make
Summary     : A GNU tool which simplifies the build process for users
URL         : http://www.gnu.org/software/make/
Description : A GNU tool for controlling the generation of executables and other
            : non-source files of a program from the program's source files. Make
            : allows users to build and install packages without any significant
            : knowledge about the details of the build process. The details about
            : how the program should be built are provided for make in the program's
            : makefile.
```

```
# epel
Name        : mcrypt
Summary     : Replacement for crypt()
URL         : http://mcrypt.sourceforge.net/
Description : MCrypt is a replacement for the old crypt() package and crypt(1) command,
            : with extensions. It allows developers to use a wide range of encryption
            : functions, without making drastic changes to their code. It allows users
            : to encrypt files or data streams without having to be cryptographers.
```


```
# epel
Name        : mhash
Summary     : Thread-safe hash algorithms library
URL         : http://mhash.sourceforge.net/
Description : Mhash is a free library which provides a uniform interface to a
            : large number of hash algorithms.
            : 
            : These algorithms can be used to compute checksums, message digests,
            : and other signatures. The HMAC support implements the basics for
            : message authentication, following RFC 2104. In the later versions
            : some key generation algorithms, which use hash algorithms, have been
            : added. Currently, the library supports the algorithms: ADLER32, GOST,
            : HAVAL256, HAVAL224, HAVAL192, HAVAL160, HAVAL128, MD5, MD4, MD2,
            : RIPEMD128/160/256/320, TIGER, TIGER160, TIGER128, SHA1/224/256/384/512,
            : Whirlpool, SNEFRU128/256, CRC32B and CRC32 checksums.
```

## mod_dav_svn

```bash
Name        : mod_dav_svn
Summary     : Apache httpd module for Subversion server
URL         : http://subversion.apache.org/
Description : The mod_dav_svn package allows access to a Subversion repository
            : using HTTP, via the Apache httpd server.
```

## net-tools

ifconfig netstat route

```bash
Name        : net-tools
Summary     : Basic networking tools
URL         : http://sourceforge.net/projects/net-tools/
Description : The net-tools package contains basic networking tools,
            : including ifconfig, netstat, route, and others.
            : Most of them are obsolete. For replacement check iproute package.
```

```
Name        : openssl-devel
Summary     : Files for development of applications which will use OpenSSL
URL         : http://www.openssl.org/
Description : OpenSSL is a toolkit for supporting cryptography. The openssl-devel
            : package contains include files needed to develop applications which
            : support various cryptographic algorithms and protocols.
```

- [perl-devel](http://www.perl.org/)

```
Name        : perl-devel
Summary     : Header #files for use in perl development
URL         : http://www.perl.org/
Description : This package contains header files and development modules.
            : Most perl packages will need to install perl-devel to build.
```

- [php](http://www.php.net/)
```
Name        : php
Summary     : PHP scripting language for creating dynamic web sites
URL         : http://www.php.net/
Description : PHP is an HTML-embedded scripting language. PHP attempts to make it
            : easy for developers to write dynamically generated web pages. PHP also
            : offers built-in database integration for several commercial and
            : non-commercial database management systems, so writing a
            : database-enabled webpage with PHP is fairly simple. The most common
            : use of PHP coding is probably as a replacement for CGI scripts.
            : 
            : The php package contains the module (often referred to as mod_php)
            : which adds support for the PHP language to Apache HTTP Server.
```

- [php-fpm](http://www.php.net/)
```
Name        : php-fpm
Summary     : PHP FastCGI Process Manager
URL         : http://www.php.net/
Description : PHP-FPM (FastCGI Process Manager) is an alternative PHP FastCGI
            : implementation with some additional features useful for sites of
            : any size, especially busier sites.
```

- [php-mysql](http://www.php.net/)
```
Name        : php-mysql
Summary     : A module for PHP applications that use MySQL databases
URL         : http://www.php.net/
Description : The php-mysql package contains a dynamic shared object that will add
            : MySQL database support to PHP. MySQL is an object-relational database
            : management system. PHP is an HTML-embeddable scripting language. If
            : you need MySQL support for PHP applications, you will need to install
            : this package and the php package.
```


- [policycoreutils-python](http://www.selinuxproject.org)
```
Name        : policycoreutils-python
Summary     : SELinux policy core python utilities
URL         : http://www.selinuxproject.org
Description : The policycoreutils-python package contains the management tools use to manage
            : an SELinux environment.
```

- [postfix](http://www.postfix.org)
```
Name        : postfix
Summary     : Postfix Mail Transport Agent
URL         : http://www.postfix.org
Description : Postfix is a Mail Transport Agent (MTA), supporting LDAP, SMTP AUTH (SASL),
            : TLS
```

- [openssh-server](http://www.openssh.com/portable.html)
```
Name        : openssh-server
Summary     : An open source SSH server daemon
URL         : http://www.openssh.com/portable.html
Description : OpenSSH is a free version of SSH (Secure SHell), a program for logging
            : into and executing commands on a remote machine. This package contains
            : the secure shell daemon (sshd). The sshd daemon allows SSH clients to
            : securely connect to your SSH server.
```

- [subversion](http://subversion.apache.org/)
```
Name        : subversion
Summary     : A Modern Concurrent Version Control System
URL         : http://subversion.apache.org/
Description : Subversion is a concurrent version control system which enables one
            : or more users to collaborate in developing and maintaining a
            : hierarchy of files and directories while keeping a history of all
            : changes.  Subversion only stores the differences between versions,
            : instead of every complete file.  Subversion is intended to be a
            : compelling replacement for CVS.
```

## `telnet`

```bash
Name        : telnet
Summary     : The client program for the Telnet remote login protocol
URL         : http://web.archive.org/web/20070819111735/www.hcs.harvard.edu/~dholland/computers/old-netkit.html
Description : Telnet is a popular protocol for logging into remote systems over the
            : Internet. The package provides a command line Telnet client
```

- [xmlto](https://fedorahosted.org/xmlto/)
```
Name        : xmlto
Summary     : A tool for converting XML files to various formats
URL         : https://fedorahosted.org/xmlto/
Description : This is a package for converting XML files to various formats using XSL
            : stylesheets.
```

```
Name        : zlib-devel
Summary     : Header files and libraries for Zlib development
URL         : http://www.zlib.net/
Description : The zlib-devel package contains the header files and libraries
            : needed to develop programs that use the zlib compression and
            : decompression library.
```
# Java - Install

[Java Platform, Standard Edition Installation Guide](http://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html)

[Java SE Development Kit 8 Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

## SDKMAN

[`manuals/java/sdkman-manual.md`](/manuals/java/sdkman-manual.md)

```bash
sdk install java
```

## Linux

<https://docs.oracle.com/javase/8/docs/technotes/guides/install/linux_jdk.html#BJFGGEFG>

[JDK Installation for Linux Platforms](http://docs.oracle.com/javase/8/docs/technotes/guides/install/linux_jdk.html#BJFGGEFG)

### RPM

```bash
# Downloading RPM file
$ wget -O jdk-8u144-linux-x64.rpm http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm

# Installing
$ rpm -ivh jdk-8u144-linux-x64.rpm

# Verifying
$ java -version

# Changing directory to /etc/profile.d
$ cd /etc/profile.d

# Downloading the java_home.sh from https://gist.github.com/mrhuangyuhui/7950d16e559e01dee47696354d366284
JAVA_HOME=/usr/java/deault
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
PATH=$PATH:$JAVA_HOME/bin
export PATH

# Taking effects
$ source /etc/profile.d/java_home.sh

# Checking all files to be installed
$ rpm -q --whatprovides java
$ rpm -ql jdk1.8.0_144-1.8.0_144-fcs.x86_64
```

## Binary

```
# Creating installation directory
$ export INSTALL_ROOT=/usr/java; mkdir $INSTALL_ROOT; cd $INSTALL_ROOT

# Downloading the archive file and unpack it
$ wget -O jdk-8u144-linux-x64.tar.gz http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz
$ tar zxvf jdk-8u144-linux-x64.tar.gz

# Creating symlink
$ ln -s jdk1.8.0_144/ default

# Setting Environment variables
Refers to the above related section.

# Verifying
$ java -version
```

## Win

<https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html#CHDEBCCJ>

To set the `PATH` variable permanently, add the full path of the `jdk1.8.0\bin` directory to the `PATH` variable. Typically, this full path looks something like `C:\Program Files\Java\jdk1.8.0\bin`. Set the `PATH` variable as follows on Microsoft Windows:

Click Start, then Control Panel, then System.

Click Advanced, then Environment Variables.

Add the location of the bin folder of the JDK installation to the `PATH` variable in System Variables. The following is a typical value for the `PATH` variable:

```
C:\WINDOWS\system32;C:\WINDOWS;C:\Program Files\Java\jdk1.8.0\bin
```

```bash
# Verifying
java -version
```

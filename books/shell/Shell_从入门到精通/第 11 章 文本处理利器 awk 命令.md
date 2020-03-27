[toc]

# 第 11 章 文本处理利器 `awk` 命令

测试数据
```bash
$ ps aux > dog.txt
$ cat dog.txt 
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.2  0.6 128168  6808 ?        Ss   11:47   0:04 /usr/lib/systemd/systemd --switched-root --system --deserialize 20
root         2  0.0  0.0      0     0 ?        S    11:47   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S    11:47   0:00 [ksoftirqd/0]
root         5  0.0  0.0      0     0 ?        S<   11:47   0:00 [kworker/0:0H]
root         6  0.0  0.0      0     0 ?        S    11:47   0:00 [kworker/u2:0]
root         7  0.0  0.0      0     0 ?        S    11:47   0:00 [migration/0]
root         8  0.0  0.0      0     0 ?        S    11:47   0:00 [rcu_bh]
root         9  0.0  0.0      0     0 ?        R    11:47   0:00 [rcu_sched]
root        10  0.0  0.0      0     0 ?        S    11:47   0:00 [watchdog/0]
root        12  0.0  0.0      0     0 ?        S    11:47   0:00 [kdevtmpfs]
root        13  0.0  0.0      0     0 ?        S<   11:47   0:00 [netns]
root        14  0.0  0.0      0     0 ?        S    11:47   0:00 [khungtaskd]
root        15  0.0  0.0      0     0 ?        S<   11:47   0:00 [writeback]
root        16  0.0  0.0      0     0 ?        S<   11:47   0:00 [kintegrityd]
root        17  0.0  0.0      0     0 ?        S<   11:47   0:00 [bioset]
root        18  0.0  0.0      0     0 ?        S<   11:47   0:00 [kblockd]
root        19  0.0  0.0      0     0 ?        S<   11:47   0:00 [md]
root        25  0.0  0.0      0     0 ?        S    11:47   0:00 [kswapd0]
root        26  0.0  0.0      0     0 ?        SN   11:47   0:00 [ksmd]
root        27  0.0  0.0      0     0 ?        SN   11:47   0:00 [khugepaged]
root        28  0.0  0.0      0     0 ?        S<   11:47   0:00 [crypto]
root        36  0.0  0.0      0     0 ?        S<   11:47   0:00 [kthrotld]
root        37  0.0  0.0      0     0 ?        S    11:47   0:00 [kworker/u2:1]
root        38  0.0  0.0      0     0 ?        S<   11:47   0:00 [kmpath_rdacd]
root        39  0.0  0.0      0     0 ?        S<   11:47   0:00 [kpsmoused]
root        40  0.0  0.0      0     0 ?        S<   11:47   0:00 [ipv6_addrconf]
root        59  0.0  0.0      0     0 ?        S<   11:47   0:00 [deferwq]
root       103  0.0  0.0      0     0 ?        S    11:47   0:00 [kauditd]
root       177  0.0  0.0      0     0 ?        S<   11:47   0:00 [rpciod]
root       178  0.0  0.0      0     0 ?        S<   11:47   0:00 [xprtiod]
root       247  0.0  0.0      0     0 ?        S<   11:47   0:00 [ata_sff]
root       250  0.0  0.0      0     0 ?        S    11:47   0:00 [scsi_eh_0]
root       251  0.0  0.0      0     0 ?        S<   11:47   0:00 [scsi_tmf_0]
root       252  0.0  0.0      0     0 ?        S    11:47   0:00 [scsi_eh_1]
root       253  0.0  0.0      0     0 ?        S<   11:47   0:00 [scsi_tmf_1]
root       256  0.0  0.0      0     0 ?        S<   11:47   0:00 [virtscsi-scan]
root       257  0.0  0.0      0     0 ?        S    11:47   0:00 [scsi_eh_2]
root       258  0.0  0.0      0     0 ?        S<   11:47   0:00 [scsi_tmf_2]
root       270  0.0  0.0      0     0 ?        S<   11:47   0:00 [bioset]
root       271  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfsalloc]
root       272  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs_mru_cache]
root       273  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-buf/vda1]
root       274  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-data/vda1]
root       275  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-conv/vda1]
root       276  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-cil/vda1]
root       277  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-reclaim/vda]
root       278  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-log/vda1]
root       279  0.0  0.0      0     0 ?        S<   11:47   0:00 [xfs-eofblocks/v]
root       280  0.0  0.0      0     0 ?        S    11:47   0:00 [xfsaild/vda1]
root       357  0.0  0.1  34992  1972 ?        Ss   11:47   0:00 /usr/lib/systemd/systemd-journald
root       394  0.0  0.4  45760  4500 ?        Ss   11:47   0:00 /usr/lib/systemd/systemd-udevd
root       432  0.0  0.0  55452   880 ?        S<sl 11:47   0:00 /sbin/auditd
root       514  0.0  0.0      0     0 ?        S<   11:47   0:00 [ttm_swap]
root       520  0.0  0.0      0     0 ?        S<   11:47   0:00 [kvm-irqfd-clean]
root       521  0.0  0.0      0     0 ?        S<   11:47   0:00 [edac-poller]
root       543  0.0  0.0      0     0 ?        S<   11:47   0:00 [kworker/0:1H]
polkitd    550  0.0  1.0 534136 10996 ?        Ssl  11:47   0:00 /usr/lib/polkit-1/polkitd --no-debug
dbus       551  0.0  0.1  32616  1828 ?        Ssl  11:47   0:00 /bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       552  0.0  0.1 195040  1224 ?        Ssl  11:47   0:00 /usr/sbin/gssproxy -D
root       563  0.0  0.3 216632  3204 ?        Ssl  11:47   0:00 /usr/sbin/rsyslogd -n
root       566  0.0  0.1  24204  1664 ?        Ss   11:47   0:00 /usr/lib/systemd/systemd-logind
chrony     594  0.0  0.1 115640  1664 ?        S    11:47   0:00 /usr/sbin/chronyd
root       843  0.0  1.8 562400 18652 ?        Ssl  11:47   0:00 /usr/bin/python -Es /usr/sbin/tuned -l -P
root       969  0.0  0.2  89544  2076 ?        Ss   11:47   0:00 /usr/libexec/postfix/master -w
postfix    977  0.0  0.3  89648  3992 ?        S    11:47   0:00 pickup -l -t unix -u
postfix    978  0.0  0.3  89716  4016 ?        S    11:47   0:00 qmgr -l -t unix -u
root      1063  0.0  0.0 110044   844 ttyS0    Ss+  11:47   0:00 /sbin/agetty --keep-baud 115200 38400 9600 ttyS0 vt220
root      1066  0.0  0.0 110044   824 tty1     Ss+  11:47   0:00 /sbin/agetty --noclear tty1 linux
root      1069  0.0  0.1 126232  1636 ?        Ss   11:47   0:00 /usr/sbin/crond -n
root      1113  0.0  0.4 105996  4072 ?        Ss   11:47   0:00 /usr/sbin/sshd -D
root      1150  0.0  0.5 147844  5380 ?        Ss   11:48   0:00 sshd: root@pts/0
root      1153  0.0  0.1 115388  1976 pts/0    Ss+  11:48   0:00 -bash
root      1171  0.0  0.5 147844  5380 ?        Ss   11:55   0:00 sshd: root@pts/1
root      1174  0.0  0.2 115388  2048 pts/1    Ss   11:55   0:00 -bash
root      1207  0.0  0.1 125332  1076 ?        Ss   12:01   0:00 /usr/sbin/anacron -s
root      1214  0.0  0.0      0     0 ?        S    12:03   0:00 [kworker/0:1]
root      8297  0.0  0.0      0     0 ?        S    12:13   0:00 [kworker/0:2]
root      8298  0.0  0.1 151064  1788 pts/1    R+   12:18   0:00 ps aux
```

```bash
$ awk
Usage: awk [POSIX or GNU style options] -f progfile [--] file ...
Usage: awk [POSIX or GNU style options] [--] 'program' file ...
POSIX options:          GNU long options: (standard)
        -f progfile             --file=progfile
        -F fs                   --field-separator=fs
        -v var=val              --assign=var=val
Short options:          GNU long options: (extensions)
        -b                      --characters-as-bytes
        -c                      --traditional
        -C                      --copyright
        -d[file]                --dump-variables[=file]
        -e 'program-text'       --source='program-text'
        -E file                 --exec=file
        -g                      --gen-pot
        -h                      --help
        -L [fatal]              --lint[=fatal]
        -n                      --non-decimal-data
        -N                      --use-lc-numeric
        -O                      --optimize
        -p[file]                --profile[=file]
        -P                      --posix
        -r                      --re-interval
        -S                      --sandbox
        -t                      --lint-old
        -V                      --version

To report bugs, see node `Bugs' in `gawk.info', which is
section `Reporting Problems and Bugs' in the printed version.

gawk is a pattern scanning and processing language.
By default it reads standard input and writes standard output.

Examples:
        gawk '{ sum += $1 }; END { print sum }' file
        gawk -F: '{ print $1 }' /etc/passwd
```


## 11.2 `awk` 的模式匹配

### 11.2.1 关系表达式

打印第 2 列的 PID 小于 5 的行
```
$ ps aux | awk '$2 < 5 {print $2}'  
1
2
3
```

### 11.2.2 正则表达式

打印 postfix 开头的行
```bash
$ ps aux | awk '/^postfix/ {print}'       
postfix    977  0.0  0.3  89648  3992 ?        S    11:47   0:00 pickup -l -t unix -u
postfix    978  0.0  0.3  89716  4016 ?        S    11:47   0:00 qmgr -l -t unix -u
```

打印 postfix 或 dbus 开头的行
```bash
$ ps aux | awk '/^(postfix|dbus)/ {print}'
dbus       551  0.0  0.1  32616  1828 ?        Ssl  11:47   0:00 /bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
postfix    977  0.0  0.3  89648  3992 ?        S    11:47   0:00 pickup -l -t unix -u
postfix    978  0.0  0.3  89716  4016 ?        S    11:47   0:00 qmgr -l -t unix -u
```

### 11.2.3 混合模式

打印 postfix 或 dbus 开头并且 PID 小于 900 的行
```bash
$ ps aux | awk '/^(postfix|dbus)/ && $2 < 900 {print}'
dbus       551  0.0  0.1  32616  1828 ?        Ssl  11:47   0:00 /bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
```

### 11.2.4 区间模式

打印 polkitd 开头至 chrony 开头的行
```bash
$ awk '/^polkitd/, /^chrony/ {print}' dog.txt
polkitd    550  0.0  1.0 534136 10996 ?        Ssl  11:47   0:00 /usr/lib/polkit-1/polkitd --no-debug
dbus       551  0.0  0.1  32616  1828 ?        Ssl  11:47   0:00 /bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       552  0.0  0.1 195040  1224 ?        Ssl  11:47   0:00 /usr/sbin/gssproxy -D
root       563  0.0  0.3 216632  3204 ?        Ssl  11:47   0:00 /usr/sbin/rsyslogd -n
root       566  0.0  0.1  24204  1664 ?        Ss   11:47   0:00 /usr/lib/systemd/systemd-logind
chrony     594  0.0  0.1 115640  1664 ?        S    11:47   0:00 /usr/sbin/chronyd
```

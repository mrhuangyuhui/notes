# Flutter Issues

## lock

```
Waiting for another flutter command to release the startup lock...
```

[Waiting for another flutter command to release the startup lock... · Issue #17422 · flutter/flutter](https://github.com/flutter/flutter/issues/17422)

```bash
rm ~/flutter/current/bin/cache/lockfile
```

## idevice_id

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-issue-idevice_id-1.jpg)

```
“idevice_id” cannot be opened because the developer cannot be verified.
```

[idevice_id cannot run on catalina · Issue #42302 · flutter/flutter](https://github.com/flutter/flutter/issues/42302)

```bash
sudo xattr -d com.apple.quarantine $FLUTTER_HOME/bin/cache/artifacts/libimobiledevice/idevice_id
```

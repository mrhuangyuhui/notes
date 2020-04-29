# “idevice_id” cannot be opened because the developer cannot be verified

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-issue-idevice_id-1.jpg)

```
“idevice_id” cannot be opened because the developer cannot be verified.
```

[idevice_id cannot run on catalina · Issue #42302 · flutter/flutter](https://github.com/flutter/flutter/issues/42302)

```bash
sudo xattr -d com.apple.quarantine $FLUTTER_HOME/bin/cache/artifacts/libimobiledevice/idevice_id
```

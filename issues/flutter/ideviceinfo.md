# “ideviceinfo” cannot be opened because the developer cannot be verified

![img](https://gitee.com/mrhuangyuhui/images/raw/master/flutter/flutter-issue-ideviceinfo-1.jpg)

```
“ideviceinfo” cannot be opened because the developer cannot be verified.
```

[idevice_id cannot run on catalina · Issue #42302 · flutter/flutter](https://github.com/flutter/flutter/issues/42302)

```bash
sudo xattr -d com.apple.quarantine $FLUTTER_HOME/bin/cache/artifacts/libimobiledevice/ideviceinfo
```

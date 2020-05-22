# Waiting for another flutter command to release the startup lock

错误信息

```
Waiting for another flutter command to release the startup lock...
```

解决方法

```bash
rm ~/flutter/current/bin/cache/lockfile
```

相关文章：[Waiting for another flutter command to release the startup lock... · Issue #17422 · flutter/flutter](https://github.com/flutter/flutter/issues/17422)

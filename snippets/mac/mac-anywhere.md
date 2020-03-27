# Mac 显示“任何来源”选项

Mac 升级到 macOS Sierra 10.12 后，“通用”里有时没有“任何来源”这个选项。

显示"任何来源"选项在控制台中执行：

```bash
sudo spctl --master-disable
```

不显示"任何来源"选项（macOS 10.12 默认为不显示）在控制台中执行：

```bash
sudo spctl --master-enable
```
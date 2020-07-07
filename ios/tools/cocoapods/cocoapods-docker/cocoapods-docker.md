# CocoaPods - Docker

```bash
cd docker-cocoapods
docker build -t cocoapods .
```

```bash
docker run -it --rm -v `pwd`:/usr/src/myapp -w /usr/src/myapp cocoapods pod init
```

```bash
docker run -it --rm -v `pwd`:/usr/src/myapp -w /usr/src/myapp cocoapods pod install
```

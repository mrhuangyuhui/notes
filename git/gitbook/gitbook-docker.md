# GitBook Docker

```bash
docker build -t mrhuangyuhui/gitbook:latest -t mrhuangyuhui/gitbook:3.2.3 .
```

```bash
cd mybook

docker run -it -v `pwd`:/mybook -w /mybook -p 4000:4000 -p 35729:35279 mrhuangyuhui/gitbook sh
```

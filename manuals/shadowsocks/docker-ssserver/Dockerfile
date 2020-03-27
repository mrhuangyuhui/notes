FROM python:latest

RUN pip install git+https://github.com/shadowsocks/shadowsocks.git@master

EXPOSE 8388

ENTRYPOINT ["/usr/local/bin/ssserver"]

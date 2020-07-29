# Docker - Install

<https://docs.docker.com/install/>

## Mac

[Install Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/)

[Docker for Mac release notes](https://docs.docker.com/docker-for-mac/release-notes/)

[Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/)

非 root 用户授权

```bash
ubuntu$ sudo usermod -aG docker ubuntu

ubuntu$sudo chmod a+rw /var/run/docker.sock
# 重启 docker 服务
ubuntu$sudo systemctl restart docker
```

## Ubuntu

[Get Docker Engine - Community for Ubuntu](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

# docker-slc
docker-slc

# 安装docker
```
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

sudo usermod -aG docker username
```
# 使用
```
docker container list
docker pull ghostry/slc:latest

docker container stop gslc && docker container rm gslc && \
docker run --detach \
    --publish 9000-9002:9000-9002 \
    --name gslc \
    --restart always \
    --volume /data/shadowsocks:/etc/shadowsocks \
    ghostry/slc:latest
```

# 自己构建
```
git clone https://github.com/ghostry/docker-slc.git
cd docker-slc
docker build --no-cache -t ghostry/slc:latest .
```


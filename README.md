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
docker pull ghostry/slc:latest

docker container stop gslc && docker container rm gslc
docker run --detach \
    -p 1080:1080 \
    --name gslc \
    --restart always \
    -v /data/shadowsocks:/etc/shadowsocks \
    ghostry/slc:latest
docker container list
docker container restart gslc
```

# 自己构建
```
git clone https://github.com/ghostry/docker-slc.git
cd docker-slc
docker build --no-cache -t ghostry/slc:latest .
```


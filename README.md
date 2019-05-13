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
docker pull ghostry/slc
gslcname="gslc"
portnum=1080
docker container stop $gslcname
docker container rm $gslcname
docker run --detach \
    --user $(id -u):$(id -g) \
    -p $portnum:1080 \
    --name $gslcname \
    --restart always \
    -v ~/.$gslcname:/etc/shadowsocks \
    ghostry/slc
docker container ls
vi ~/.$gslcname/local.json
docker container restart $gslcname
```

# 自己构建
```
git clone https://github.com/ghostry/docker-slc.git
cd docker-slc
docker build --no-cache -t ghostry/slc:latest .
```


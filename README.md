# cegc-docker
本ソフトウエアはただいま作成中です。

## Deploy方法
```
mkdir workdir
cd workdir
git clone https://github.com/n-hamamoto/cegc-docker.git
cd cegc-docker/setup
./init.sh

ファイル編集

docker-compose up -d
(mysqldが立ち上がるのに時間がかかる)
docker exec -i php bash -c "cd conf && sh ./init.sh"
```

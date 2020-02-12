# cegc-docker
本ソフトウエアはただいま作成中です。

## Deploy方法
```
mkdir workdir
cd workdir
git clone https://github.com/n-hamamoto/cegc-docker.git
cd cegc-docker/setup
./init.sh
```
設定ファイルの編集  
設定ファイルは以下のディレクトリに格納されています。
- docker-compose.yml
- mysql/conf/
- php/conf/
- proxy/conf/

./mkconfig配下でサンプルを生成して配置することができます。[生成方法](./mkconfig)

```
docker-compose up -d
(mysqldが立ち上がるのに時間がかかる)
docker exec -i php bash -c "cd conf && sh ./init.sh"
```

### 謝辞
docker構成の作成には，[学認クラウドオンデマンド構築サービス](https://cloud.gakunin.jp/ocs/)のMoodleアプリケーションテンプレートを参考にさせていただきました。ご協力いただいた関係者の皆様に感謝申し上げます。

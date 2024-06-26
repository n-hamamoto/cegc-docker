# cegc-docker
本ソフトウエアは，docker/docker-composeを利用して，[情報倫理eラーニング成績確認システム(CEGC)](https://github.com/n-hamamoto/cegc)を動作させるためのファイルを提供しています。動作させるためには，以下が必要となります。
 - Docker及びdocker-composeが利用できるサーバ
 - SSL証明書
 - IdPと連携して動作するため，本サービスのmetadataを機関のIdPに登録していただく必要があります。

## インストール方法
Docker及びdocker-composeが利用できるサーバで，以下の手順でインストールを行います。
### ダウンロードと設定ファイルの配置
```
git clone https://github.com/n-hamamoto/cegc-docker.git
cd cegc-docker/setup
./init.sh
cd ..

```
### 設定ファイルの編集  
設定ファイルは``cegc-docker``配下の以下のディレクトリに格納されています。詳細な設定を行いたい場合には，各ファイルをご確認いただき，設定してください。
なお，mkconfig配下のスクリプトを利用して，機関のidpで認証するための最低限のサンプルを生成して配置することもできます。[生成方法](./mkconfig)
```
- php/html/conf/config.php
- docker-compose.yml
- mysql/conf/
- php/conf/
- proxy/conf/
```


### 起動
```
cegc-dockerに移動したのち，
docker-compose up -d
(mysqldが立ち上がるのに時間がかかる)
```
### DBの初期設定
DBに初期テーブルを設定します。
 SQLSTATE[HY000] [2002] Connection refusedと出る場合には，mysqlの起動待ちの可能性があるのでしばらくしてから再度実行してください。
```
docker exec -i php bash -c "cd conf && sh ./init.sh"
```
サービスのURLにアクセスして，ログインしてみてください。

## 設定変更について
設定ファイル(mysql/conf/, php/conf, proxy/conf/)を編集いただき，``docker-compose restart``，または，``docker-compose down; docker-compose up -d``を実行してください。

## ログファイルについて
docker-compose.ymlを確認いただければわかりますが，ログは以下に出力されます。

### /var/log/message
 - 各コンテナからのログは，先頭行の以下のラベルで区別されています。
  - docker/proxy/コンテナID:
  - docker/php/コンテナID: apache(php)のアクセスログ,エラーログ
  - docker/mysql/コンテナID:
### mysql/log/general.log, mysql/log/slow.log
 - 設定していればクエリログ，スロークエリログが出ます。
  - mysql/conf/etc/mysql/conf.d/mysql.cnf
### proxy/log/httpd/
 - ssl_access_log, ssl_error_logにproxyで受けたアクセスログ/エラーログがあります。
### proxy/log/shibboleth/
 - shibd.log: conf/etc/shibboleth/shibd.loggerで設定
 - trancaction.log: 受け渡した属性が出ています。onf/etc/shibboleth/shibd.loggerで設定します。
### proxy/log/shibboleth-www/
 - native.log: conf/etc/shibboleth/native.loggerで設定したログ

## logrotate
logrotateを定期実行するよう設定してください。
```
/etc/crontab
  0  4  *  *  * root       docker exec proxy logrotate -f /etc/logrotate.conf
```
## 自動登録について
定期的に自動登録を行う場合は，cronを設定してください。RHEL系の場合は，以下の通りです。

### /etc/cron.daily/cegc.cron

```
#!/bin/sh

docker exec -i php bash -c "cd upload && php ./sync-finaltest.php" >> /var/log/cegc.log
docker exec -i php bash -c "cd upload && php ./sync-tracking.php"  >> /var/log/cegc.log
```
作成後`chmod +x /etc/cron.daily/cegc.cron`

### /etc/logrotate.d/cegc.log
```
/var/log/cegc.log
{
    missingok
    daily
    copytruncate
    compress
    rotate 90
    notifempty
}
```
 
### 参考
1. https://meatwiki.nii.ac.jp/confluence/pages/viewpage.action?pageId=12158187

### 謝辞
docker構成の作成には，[学認クラウドオンデマンド構築サービス](https://cloud.gakunin.jp/ocs/)のMoodleアプリケーションテンプレートを参考にさせていただきました。ご協力いただいた関係者の皆様に感謝申し上げます。

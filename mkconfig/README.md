# サンプル設定の生成方法
スクリプトは``cegc-docker/mkconfig``をカレントディレクトリにして動作させることを前提としています。
```
cd mkconfig
```

1. ./import.sh  
設定変更が必要なファイルをコピーしてきます。
1. config.phpを編集してください。
```
$dbhost = 'mysql'; #固定
```
3. ./mkconf.pl  
config.phpを読み込み，サンプル設定ファイルを生成します。
1. ./certの下に本システムのサーバ証明書を配置してください。
1. ./deploy.sh  
サンプル設定ファイルをコンテナに配置します。

[戻る](https://github.com/n-hamamoto/cegc-docker/tree/master#%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%AE%E7%B7%A8%E9%9B%86)

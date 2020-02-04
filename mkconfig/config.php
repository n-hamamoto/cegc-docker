<?php
$dbhost = 'mysql';
$dbuser = ''; 		#データベースにアクセスするためのユーザ名
$dbpassword = '';	#データベースにアクセスするためのパスワード
$logdb   = '';		#データベース名

$inituser = '';		#最初に作るユーザ
$eppnDomain = '';       #eppnで利用しているドメイン(例：example.ac.jp)

$documentRoot = ''.'/'; #本システムのサーバ（例：example.ac.jp)

$idpdbhost   = 'idp.gunma-u.ac.jp'; 	#idpのホスト名
//useridを小文字に統一する
$lowercaseId = 1;

#-----ここから下は学認LMSでは設定不要--------
# 0: computedID, 1: storedID
$sw = 0; 
$salt = "";

# Stored IDの場合の設定
$idpdbuser   = '';   	#データベースにアクセスするためのユーザ名
$idpdbpassword   = '';	#データベースにアクセスするためのパスワード
$idpdb = ''; 		#データベース名

?>

#!/usr/bin/env perl

open(IN,"config.php");
while($l=<IN>){
    if($l=~/\$dbhost\s*\=\s*\'(.+)\'/){
	$dbhost=$1;
    }
    if($l=~/\$dbuser\s*\=\s*\'(.+)\'/){
	$dbuser=$1;
    }
    if($l=~/\$dbpassword\s*\=\s*\'(.+)\'/){
	$dbpassword=$1;
    }
    if($l=~/\$logdb\s*\=\s*\'(.+)\'/){
	$logdb=$1;
    }
    if($l=~/\$documentRoot\s*\=\s*\'(.+)(\/|)\'\.\'(.*)\'/){
	$documentRoot="$1"."$3";
	$serverfqdn=$1;
    }
    if($l=~/\$idpdbhost\s*\=\s*\'(.+)\'/){
	$idpdbhost=$1;
    }
}
close(IN);

open(IN,"docker-compose.yml.skel");
open(OUT,">docker-compose.yml");
while($l=<IN>){
    $l=~s/MYSQL_ROOT_PASSWORD=(.|\s+)*$/MYSQL_ROOT_PASSWORD=$dbpassword\n/;
    $l=~s/MYSQL_DATABASE=(.|\s+)*$/MYSQL_DATABASE=$logdb\n/;
    $l=~s/MYSQL_USER=(.|\s+)*$/MYSQL_USER=$dbuser\n/;
    $l=~s/MYSQL_PASSWORD=(.|\s+)*$/MYSQL_PASSWORD=$dbpassword\n/;
    print OUT $l;
}
close(IN);close(OUT);

open(IN,"proxy.conf.skel");
open(OUT,">proxy.conf");
while($l=<IN>){
    $l=~s/ServerName(.|\s+)*$/ServerName ${serverfqdn}:443\n/;
    $l=~s/\*\*+\sYOUR\sCERT\sNAME\s\*\*+/${serverfqdn}/g;
    print OUT $l;
}
close(IN);close(OUT);

open(IN,"shibboleth2.xml.skel");
open(OUT,">shibboleth2.xml");
while($l=<IN>){
    $l=~s/\*\*+\sYOUR\sSP\sNAME\s\*\*+/${serverfqdn}/;
    $l=~s/\*\*+\sYOUR\sIDP\sNAME\s\*\*+/${idpdbhost}/;
    $l=~s/\*\*+\sYOUR\sCERT\sNAME\s\*\*+/${serverfqdn}/g;
    print OUT $l;
}
close(IN);close(OUT);

print "SSL証明書を以下に作成してください。\n./cert/${serverfqdn}.key, ./cert/${serverfqdn}.cer\n";
//print "Shibbolet用のmetadataを以下に作成してください。\n./cert/${serverfqdn}.key, ./cert/${serverfqdn}.cer\n";

//print "$dbhost, $dbuser, $dbpassword, $logdb, $serverfqdn, $documentRoot\n";

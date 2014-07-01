# CentOSをベースに
FROM centos

# 作成者
MAINTAINER Soshi Katsuta

# RUN コマンドを使って、yum コマンドを実行してインストールする 
RUN yum update -y && yum -y upgrade
RUN yum install -y sudo
RUN yum install -y passwd
RUN yum install -y httpd
# PHP install
RUN yum install -y mysql-server
RUN yum install -y php php-mysql

# EXPOSE コマンドを使って、ポート8080を解放
EXPOSE 80

# ADD コマンドを使って、ホストOSからwarファイルを取得
ADD php/hello_world.php /var/www/html/

# ENTORYPOINT コマンドを使って、コンテナ起動時に実行するコマンドを与える
#ENTRYPOINT /etc/init.d/httpd start && /bin/bash
ENTRYPOINT apachectl start && /bin/bash


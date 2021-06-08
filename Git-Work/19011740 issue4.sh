#!/bin/bash

jdk_src="jdk-8u291-linux-x64.tar.gz"  # jdk安装包，解压之后文件名为jdk1.8.0_211
jdk_target="/usr/java"

if [ ! -d $jdk_target ];then
sudo mkdir -p $jdk_target
fi

sudo echo "Decompression jdk.tar.gz"
sudo tar zxvf $jdk_src -C $jdk_target

if [ -f /etc/bashrc ]; then
	`sudo echo "export JAVA_HOME=$jdk_target/jdk1.8.0_291" >> /etc/bashrc`
	`sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/bashrc`
	`sudo echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/bashrc`
	`source /etc/bashrc`
elif  [ -f /etc/bash.bashrc ]; then
	`sudo echo "export JAVA_HOME=$jdk_target/jdk1.8.0_291" >> /etc/bash.bashrc`
	`sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/bash.bashrc`
	`sudo echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/bash.bashrc`
	`source /etc/bash.bashrc`
else
	`sudo echo "export JAVA_HOME=$jdk_target/jdk1.8.0_291" >> /etc/profile`
	`sudo echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile`
	`sudo echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile`
	`source /etc/profile`
fi

echo "Finished"

#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java application'
echo 'into the local Maven repository, which will ultimately be stored in'
echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
echo 'volume).'
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following complex command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'The following complex command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

echo 'The following command runs and outputs the execution of your Java'
echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
java -jar target/${NAME}-${VERSION}.jar

# https://github.com/google/cadvisor/issues/1131
# apk update && apk add ca-certificates && update-ca-certificates && apk add openssl

# # #Download AzCopy
# wget -O azcopy_v10.tar.gz https://aka.ms/downloadazcopy-v10-linux

# tar -xf azcopy_v10.tar.gz
# #Expand Archive
# tar -xvf azcopy_v10.tar.gz
# # chmod 0755 azcopy_linux_amd64_10.3.4/install.sh
# chmod 0755 azcopy_linux_amd64_10.3.4/azcopy
# # ./azcopy_linux_amd64_10.3.4/install.sh

#  sleep 120

#wget -O azcopy.tar.gz https://aka.ms/downloadazcopyprlinux
#tar -xf azcopy.tar.gz
#chmod 0755 install.sh
#./install.sh

XXX=118
adminUsername=emuser
adminPassword=em_@Dmin_0172
remoteServer=10.40.$XXX.71



apk update
apk add openssh
apk add expect

# sleep 240

ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null

expect -c \
    "spawn ssh-copy-id $adminUsername@$remoteServer;
     match_max 100000;
     expect \"*Are you sure you want to continue connecting (yes/no)?\";
     send -- \"yes\r\";
     expect \"*Pasword:*\";
     send -- \"$adminPassword\r\";    
     expect eof"

scp -r target $adminUsername@$remoteServer:/home/emuser



# azcopy target/${NAME}-${VERSION}.jar "https://eucise2020binaries.file.core.windows.net/drop?sv=2019-02-02&ss=bfqt&srt=sco&sp=rwdlacup&se=2022-03-14T01:53:36Z&st=2020-03-13T17:53:36Z&spr=https&sig=wCMPA8FKqxL8FeS0Zo2gRpb61IwBZ%2FH%2BcequscvgJeE%3D"  --recursive=true


#!/bin/bash
BUILD_NUM=$1
#mkdir $BUILD_NUM
#build_result=$(ansible-playbook ~/ansible/Jenkins.yml) # This will run the Ansible build role
#mkdir -p ~/ansible/jenkins/builds/$BUILD_NUM
mkdir -p /hostpipe/builds/$BUILD_NUM
echo "FAILED" > /hostpipe/builds/$BUILD_NUM/result.txt

sleep 5
echo "sh build.sh $BUILD_NUMBER" > /hostpipe/jenkinspipe
sleep 10
build_result=$(cat /hostpipe/builds/$BUILD_NUMBER/result.txt)
echo $build_result
#echo "sh build.sh 3" > /hostpipe/jenkinspipe
#FILE=/etc/resolv.conf
#if test -f "$FILE"; then
#    echo "$FILE exists."
#fi

                sh "'echo sh /hostpipe/jenkinspipe/build.sh $BUILD_NUMBER' > /hostpipe/jenkinspipe"
                sh "build_result=${(cat /hostpipe/builds/${BUILD_NUMBER}/result.txt)}"
                sh "echo ${build_result}"

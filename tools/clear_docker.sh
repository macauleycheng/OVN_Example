#!/bin/sh
set a = $(docker ps -a -q)
echo a
if [ "$a" == "" ]; then
  echo "stop container"
  docker ps -a -q |xargs docker stop
  echo "rm runnig cotainer"
  docker ps -a -q |xargs docker rm
fi
echo $b
set b = $(docker images -q --filter "dangling=true")
if [ "$b" == "" ]; then
  echo "remove container image"
  docker images -q --filter "dangling=true" |xargs docker image rm
fi

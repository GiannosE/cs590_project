#!/bin/bash

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-6.0
wget https://github.com/microsoft/lignator/archive/v0.8.0.tar.gz \
  && tar xvzf v0.8.0.tar.gz \
  && cd ./lignator-0.8.0/src \
  && sudo dotnet publish -r linux-x64 -c Release -o /usr/local/bin/ -p:PublishSingleFile=true --self-contained true -p:InformationalVersion=0.8.0 \
  && lignator --version

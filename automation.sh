#!/bin/sh

echo "Automation Start"

echo "1. Update ..."
sudo apt update

echo "1. Upgrade ..."
sudo apt upgrade -y

echo "2. Installing required package ..."
sudo apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y

echo "3. Cloning xmrig ..."
git clone https://github.com/xmrig/xmrig.git

echo "4. Building xmrig ..."
mkdir xmrig/build && cd ../../..
cmake ..

echo "6. Creating config.json file ..."
echo "{
    \"autosave\": true,
    \"cpu\": true,
    \"opencl\": false,
    \"cuda\": false,
    \"pools\": [
        {
            \"url\": \"us-west.minexmr.com:443\",
            \"user\": \"86q6r9GGfSn3Da6bZdHQ4s3bfupQ7JqsrLqZVzUA2Mwq3TTgDgpb1ABMorem7VHpaNdjHYTt6qZyW45jp4Vi3e1dBgmuwYS\",
            \"rig-id\": \"Worker1\",
            \"keepalive\": true,
            \"tls\": true
        }
    ]
}" > config.json

echo "7. Installing xmrig from release ..."
wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-bionic-x64.tar.gz && tar -zxf xmrig-6.16.2-bionic-x64.tar.gz && cd ../../../.. && chmod +x xmrig

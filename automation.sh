dash_around() {
    echo "-----------------------------------"
    echo $1
    echo "-----------------------------------"
}

dash_around "Automation Start"

dash_around "1. Update and upgrade ..."
sudo apt-get update -y
sudo apt-get upgrade -y

dash_around "2. Installing required package ..."
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

dash_around "3. Cloning xmrig ..."
git clone https://github.com/xmrig/xmrig.git

dash_around "4. Building xmrig ..."
mkdir xmrig/build && cd xmrig/build
cmake ..

dash_around "5. Creating config.json file ..."
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

dash_around "6. Installing xmrig from release ..."
wget https://github.com/xmrig/xmrig/releases/download/v6.16.2/xmrig-6.16.2-bionic-x64.tar.gz && tar -zxf xmrig-6.16.2-bionic-x64.tar.gz && cd xmrig-6.16.2 && chmod +x xmrig
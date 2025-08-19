# Docker

https://www.datacamp.com/tutorial/install-docker-on-ubuntu

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
docker --version
sudo apt-get install docker-compose-plugin
sudo docker run hello-world

# Kafka

## Create

In order to use kafka dev tools, the infrastructure has to be started with docker compose (docker-compose).

```bash
./setup.sh
``` 

## Delete

```bash
./delete-containers.sh
``` 


## [Install Docker on Ubuntu](https://docs.docker.com/engine/install/ubuntu/) 
### 0. Uninstall old versions
- sudo apt-get remove docker docker-engine docker.io containerd runc
- Images, containers, volumes, and networks stored in /var/lib/docker/ aren’t automatically removed when you uninstall Docker.
### 1. Set up the repository
- sudo apt-get update
- sudo apt-get -y install ca-certificates curl gnupg lsb-release

### 2. Add Docker’s official GPG key:
- sudo mkdir -p /etc/apt/keyrings
- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

### 3. Set up the stable repository. 
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
### 4. Install Docker Engine
- sudo apt-get update
	- sudo chmod a+r /etc/apt/keyrings/docker.gpg (if error)
- sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
- XXX sudo apt-get install -y docker-compose 

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

chmod +x ~/.docker/cli-plugins/docker-compose

### Executing the Docker Command Without Sudo (Optional)	
- sudo usermod -aG docker ${USER}

### Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: 
- sudo chmod 666 /var/run/docker.sock


### [docker-compose up -d at system start up?](https://stackoverflow.com/questions/43671482/how-to-run-docker-compose-up-d-at-system-start-up)
- use --restart always or - --restart unless-stopped 
- or in docker-compose.yml use restart: always -

### [permission denied issue](https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue)
1. Create the docker group if it does not exist
	- sudo groupadd docker
2. Add your user to the docker group.
	- sudo usermod -aG docker $USER
3. Log in to the new docker group (to avoid having to log out / log in again; but if not enough, try to reboot):
	- newgrp docker
4. Check if docker can be run without root
	- docker run hello-world
5. Reboot if still got error
	- reboot
	- sudo groupadd docker




## https://github.com/docker/compose/
- mkdir -p ~/.docker/cli-plugins/
- curl -SL https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
- chmod +x ~/.docker/cli-plugins/docker-compose
- docker compose version
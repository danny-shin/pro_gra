
- docker system prune -a
	- Remove all unused images not just dangling ones
- docker container stop $(docker ps -aq)
- docker container rm $(docker ps -aq)
- docker image rm $(docker image ls -aq)
- docker network ls
- docker network rm $(docker network ls -q)
- docker volume rm $(docker volume ls -q)

- docker exec -it prometheus sh
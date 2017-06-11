# sd-setup
**Docker setup for deploying the Distributed Systems collective project**

Using this setup comes with the assumption that you have a Linux environment (VM or OS) having Docker&Docker-Compose 
already installed.

The existing parameters in each containers` .env file can be configured, but keep in mind they will as well be used
in the created Java app (Data Access layer).

## CREATING YOUR DOCKER ENVIRONMENT ##

0. Assuming you have docker,docker-compose installed, all the .env files configured as desired - proceed.
1. Install mysql, postgresql and sql-server .
````bash
sudo docker-compose build mysql
sudo docker-compose up mysql  > logs/mysql.log 2>&1 &

sudo docker-compose build sql-server
sudo docker-compose up sql-server  > logs/sql-server.log 2>&1 &

sudo docker-compose build postgresql
sudo docker-compose up postgresql  > logs/postgresql.log 2>&1 &
````
2. Install phpmyadmin (not mandatory)
````bash
sudo docker-compose build phpmyadmin
sudo docker-compose up phpmyadmin > logs/phpmyadmin.log 2>&1 &
````
3. Install java.
````bash
sudo docker-compose build java
````
4. Setup the Tomcat server
````bash
sudo docker-compose up tomcat > logs/tomcat.log 2>&1 &
````
5. Get data from containers to be checked with the IP`s in the code
````bash
sudo docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(sudo docker ps -aq)
````
6. Lets install the tables for each created database. 
````bash
sudo docker-compose run --rm nginx install-db
````

7. Feel free to clean the docker environment of closed services (the run commands)
````bash
sudo docker rm $(sudo docker ps -a -f status=exited -q)
sudo docker volume rm $(sudo docker volume ls -f dangling=true -q)
````


## USING SUB-MODULES AND GIT ##

In this folder is located the submodule for the project from the original repository.

In order to bring the submodule data on your local machine, do the following command:
````bash
git submodule update --init sd2017
````

If you want to see the number of submodules, do:
````bash
git submodule
````

If you want to check existing submodules, run either
````bash
git config --file=.gitmodules -l
````
or check .gitmodules folder from root, where we should have something like:
   _submodule.app/<folder>.path=/opt/<folder>_
   _submodule.app/<folder>.url=<github url>_

Whenever you want to switch to a branch in the submodule, move to the project root 
and continue working with the git.
````bash
git checkout -b <branch_name>
````


## USEFUL DOCKER COMMANDS ##

0. Shows available services on the project
````bash
sudo docker-compose ps
````
1. Remove all containers
````bash
sudo docker rm $(sudo docker ps -a -f status=exited -q)
````
2. Remove all images
````bash
sudo docker rmi --force $(sudo docker images)
````
3. Remove all volumes
````bash
sudo docker volume rm $(sudo docker volume ls -f dangling=true -q)
````
4. Check exited containers
````bash
sudo docker ps -a -f status=exited
````
5. Get data on container (IP, etc)
````bash
sudo docker inspect <containerid>
````
6. Stop container
````bash
sudo docker stop <containerid>
````
7. Rebuild service
````bash
sudo docker-compose build --force-rm <servicename>
````
8. Stop containers and remove resources (use local for images without a custom tag, -v for volumes)
````bash
sudo docker-compose down --rmi all
````
9. Forcing a container to stop
````bash
sudo docker-compose kill -s SIGKILL <containerid>
````
10. Run arbitrary commands in the service
````bash
sudo docker-compose exec <service> <command> <args>
````
11. Display logs from service
````bash
sudo docker-compose logs -f -t <service>
````
12. Remove stopped services
````bash
sudo docker-compose rm -s -f -v
````
13. Getting IPs of all containers
````bash
sudo docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(sudo docker ps -aq)
````
14 The IP of your host executing in the container:
````bash
/sbin/ip route|awk '/default/ { print $3 }'
````

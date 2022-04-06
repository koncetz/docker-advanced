# Final Project - Docker Advanced

### **Test in Local**

1) Create overlay network for proxy:
   `docker network create --driver overlay --attachable proxy`
   After that copy incoming response to be run in instance 2 and 3:
   `docker swarm join --token XXX 1x.1x.1x.1x:zzzz`
2) Build image **mysql**, **phpmyadmin**, **web**, and **proxy**
   ```
   docker image build -f mysql.Dockerfile -t koncetz/mysql-custom .
   docker image build -f phpmyadmin.Dockerfile -t koncetz/phpmyadmin-custom .
   docker image build -f web.Dockerfile -t koncetz/web-custom .
   docker image build -f proxy.Dockerfile -t koncetz/proxy-custom .
   ```
3) Push image **mysql**, **phpmyadmin**, **web**, and **proxy** to DockerHub
   **mysql**
   ```
   docker push koncetz/mysql-custom
   docker push koncetz/phpmyadmin-custom
   docker push koncetz/web-custom
   docker push koncetz/proxy-custom
   ```
4) Update `/etc/hosts` in UNIX or `c:\windows\system32\drivers\etc\hosts` in WINDOWS, add line `127.0.0.1 web.koncetz.local pma.koncetz.local`
5) Start composing docker: `docker compose up`
6) Browse: http://pma.koncetz.local and http://web.koncetz.local
7) Stop composing docker: `docker compose down`, if testing in local already works

### **Deploy in Cloud**

1) Create 3 VM's in GCP, in first VM, init the docker swarm via SSH:
   `docker swarm init`
2) Clone repository to each VM via SSH:
   `git clone https://github.com/koncetz/docker-advanced.git`
3) Enter repo directory:
   `cd docker-advanced`
4) Deploy docker stack:
   `docker stack deploy -c docker-stack.yml app`
5) Run `docker swarm join --token XXX 1x.1x.1x.1x:zzzz` in instance 2 and 3
6) Browse: http://pma.docker.angular.id and http://web.docker.angular.id

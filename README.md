# docker-circleci

## On-Time Setup of VM

1. Create SSH Key (or get from Gist)
2. Add public key to Digital Ocean
3. Create droplet (Digital Ocean VM):
  name: ubuntu-0XX (2 GB RAM, 40 GB Disk)
4. Copy save ip address
5. `ssh root@ip` into VM
6. Install docker via <get.docker.com> on VM

```
 curl -fsSL get.docker.com -o get-docker.sh
 sh get-docker.sh
```

7. Run parts of `Create-Deploy-User.sh` script on VM

```
useradd --user-group --create-home --shell /bin/bash deploy
usermod -aG docker deploy
```

```
mkdir /home/deploy/.ssh
cp ~/.ssh/authorized_keys /home/deploy/.ssh/authorized_keys
chown deploy /home/deploy/.ssh/authorized_keys
```
8. exit

## Create Docker Hub Account

1. Create Docker Hub Account
2. Create repo named `sample-node`

### Add Docker Hub Account to virtual machine

1. login again as `ssh deploy@ip`
2. Do a docker login to your Docker Hub Account

### Edit local files

1. Inspect Dockerfile
2. Fill out `deploy.sh` so that it makes sense

## Do first deployment

1. docker login on local machine

```
export DOCKER_USERNAME='xyz'
export DOCKER_PASSWORD='xyz'
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
```

2. Run `deploy.sh`
3. Open in web-browser: `$ip:3000`

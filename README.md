# Docker Demo

## Build image

```bash
sudo docker build -t friendlyhello .
```

## Run demo app

```bash
sudo docker run -p 4000:80 friendlyhello
```

## Tag image

```bash
sudo docker tag friendlyhello ciaochung/docker-demo:1.0.0
```

## Push to docker hub

```bash
sudo docker login

sudo docker push ciaochung/docker-demo:1.0.0
```

## Create and start container with detach option

```javascript
sudo docker-compose up -d
```

## Execute command in a container 

```bash
sudo docker-compose exec web bash
```

## Stop and remove containers, networks, images, volumes

```bash
sudo docker-compose down
```
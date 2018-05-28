# Docker Demo

## Build Image

```bash
sudo docker build -t friendlyhello .
```

## Run Demo App

```bash
sudo docker run -p 4000:80 friendlyhello
```

## Tag Image

```bash
sudo docker tag friendlyhello ciaochung/docker-demo:1.0.0
```

## Push To Docker Hub

```bash
sudo docker login

sudo docker push ciaochung/docker-demo:1.0.0
```

## Run Remote Image

```bash
sudo docker run -p 4000:80 ciaochung/docker-demo:1.0.0
```
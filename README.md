# docker-activemq

### Versions

- [`5.9`, `5.9.1`, `latest` (*5.9/Dockerfile*)](https://raw.githubusercontent.com/cjlyth/docker-activemq/9ab3ce1be30722151024ed5d1a8091e612d25181/5.9/Dockerfile)

### Local build

```
docker build --no-cache -t cjlyth/activemq:5.9 5.9 \
&& docker tag -f cjlyth/activemq:5.9 cjlyth/activemq:5.9.1 \
&& docker tag -f cjlyth/activemq:5.9 cjlyth/activemq:latest
```

### Run

```
docker run -it --rm cjlyth/activemq bash
```

### Use the trusted build from docker

```
docker run -v $(pwd):/data --rm cjlyth/activemq
```


#### Build and run

I use this for development mostly

```
docker build --no-cache -t cjlyth/activemq:5.9 5.9 \
	&& docker run -it --rm cjlyth/activemq:5.9 bash
```

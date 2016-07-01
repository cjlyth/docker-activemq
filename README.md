# docker-activemq

### Versions

- [`5.9`, `5.9.1`](https://raw.githubusercontent.com/cjlyth/docker-activemq/9ab3ce1be30722151024ed5d1a8091e612d25181/5.9/Dockerfile)
- [`5.13`, `5.13.3`](https://raw.githubusercontent.com/cjlyth/docker-activemq/1a517e741b8a4d6113dfbbf2553ae0f0d09a04aa/5.13/Dockerfile)

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


I had to make some changes to make this work behind my new companies firewall. For now you have to create a file called proxy-info that has somehting like the following in it:

```
HTTP_PROXY="http://proxy.mycompany.com:8080"
HTTP_PROXY="$HTTP_PROXY"
HTTPS_PROXY="$HTTP_PROXY"
http_proxy="$HTTP_PROXY"
https_proxy="$HTTP_PROXY"

no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
export no_proxy HTTP_PROXY HTTP_PROXY HTTPS_PROXY http_proxy https_proxy

```

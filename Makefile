docker_name=dashapp
expose_port=30953
run_name=dapp

all:	stop rm build run

stop:
	-docker stop ${run_name}
rm:
	-docker rm ${run_name}	

build:
	docker build \
		--build-arg HTTP_PROXY=${http_proxy} \
		--build-arg HTTPS_PROXY=${http_proxy} \
		-t ${docker_name} \
		-f Dockerfile \
		.

run:
	docker run \
		-p ${expose_port}:8050 \
		--name ${run_name} \
		-d ${docker_name}

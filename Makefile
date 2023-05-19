APPID ?= eriksf-pyreconstruct-0.0.1
IMAGE_VERSION ?= 0.0.1
ts := $(shell /bin/date "+%Y-%m-%d-%H%M%S")

build:
	docker build -t eriksf/pyreconstruct:${IMAGE_VERSION} .
	docker tag eriksf/pyreconstruct:${IMAGE_VERSION} eriksf/pyreconstruct:latest

push:
	docker push eriksf/pyreconstruct:${IMAGE_VERSION} && docker push eriksf/pyreconstruct:latest

list:
	tapis apps search --id start eriksf

deploy:
	tapis apps deploy -W . -F app.json --ini project.ini --no-build --no-push

update:
	tapis apps update -F app.json --ini project.ini ${APPID}

jobinit:
	tapis jobs init --all ${APPID} >test-${ts}.json

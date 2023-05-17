APPID ?= eriksf-pyreconstruct-0.0.1
ts := $(shell /bin/date "+%Y-%m-%d-%H%M%S")

list:
	tapis apps search --id start eriksf

deploy:
	tapis apps deploy -W . -F app.json --ini project.ini --no-build --no-push

update:
	tapis apps update -F app.json --ini project.ini ${APPID}

jobinit:
	tapis jobs init --all ${APPID} >test-${ts}.json

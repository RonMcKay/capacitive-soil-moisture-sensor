#!/usr/bin/make

SHELL = /bin/sh

USER_ID := $(shell id -u)
GROUP_ID := $(shell id -g)
PWD := $(shell pwd)
MYSLOCAL := $(shell cd ./hardware/lib; pwd)
IMAGE_NAME := setsoft/kicad_auto:latest

export USER_ID, GROUP_ID, PWD, MYSLOCAL

all: test documentation production

documentation:
	docker run --rm \
		--user ${USER_ID}:${GROUP_ID} \
		--env MYSLOCAL=${MYSLOCAL} \
		--workdir=${PWD} \
		--volume=${PWD}:${PWD} \
		--volume="/home/${USER}:/home/${USER}:rw" \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash \
		-c "kibot -c .kibot/documentation.kibot.yaml -b hardware/soil-moisture-sensor.kicad_pcb"

production:
	docker run --rm \
		--user ${USER_ID}:${GROUP_ID} \
		--env MYSLOCAL=${MYSLOCAL} \
		--workdir=${PWD} \
		--volume=${PWD}:${PWD} \
		--volume="/home/${USER}:/home/${USER}:rw" \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash \
		-c "kibot -c .kibot/production.kibot.yaml -b hardware/soil-moisture-sensor.kicad_pcb"

test:
	docker run --rm \
		--user ${USER_ID}:${GROUP_ID} \
		--env MYSLOCAL=${MYSLOCAL} \
		--workdir=${PWD} \
		--volume=${PWD}:${PWD} \
		--volume="/home/${USER}:/home/${USER}:rw" \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash \
		-c "kibot -c .kibot/test.kibot.yaml -b hardware/soil-moisture-sensor.kicad_pcb"

interactive:
	docker run --rm -it \
		--user ${USER_ID}:${GROUP_ID} \
		--env MYSLOCAL=${MYSLOCAL} \
		--workdir=${PWD} \
		--volume=${PWD}:${PWD} \
		--volume="/home/${USER}:/home/${USER}:rw" \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash

clean:
	rm -rf hardware/Documentation
	rm -rf hardware/Gerbers
	rm -rf hardware/PickAndPlace

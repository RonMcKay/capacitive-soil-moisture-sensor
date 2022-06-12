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
		--workdir="/home/${USER}/workdir" \
		--volume=${PWD}:/home/${USER}/workdir \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/home/${USER}/.config/kicad:/home/${USER}/.config/kicad:rw" \
		--volume="/home/${USER}/.cache/kicad:/home/${USER}/.cache/kicad:rw" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash \
		-c "kibot -c .kibot/documentation.kibot.yaml -d ./hardware -e hardware/soil-moisture-sensor.sch -b hardware/soil-moisture-sensor.kicad_pcb"

production:
	docker run --rm \
		--user ${USER_ID}:${GROUP_ID} \
		--workdir="/home/${USER}/workdir" \
		--volume=${PWD}:/home/${USER}/workdir \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/home/${USER}/.config/kicad:/home/${USER}/.config/kicad:rw" \
		--volume="/home/${USER}/.cache/kicad:/home/${USER}/.cache/kicad:rw" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash \
		-c "kibot -c .kibot/production.kibot.yaml -d ./hardware -e hardware/soil-moisture-sensor.sch -b hardware/soil-moisture-sensor.kicad_pcb"

test:
	docker run --rm \
		--user ${USER_ID}:${GROUP_ID} \
		--workdir="/home/${USER}/workdir" \
		--volume=${PWD}:/home/${USER}/workdir \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/home/${USER}/.config/kicad:/home/${USER}/.config/kicad:rw" \
		--volume="/home/${USER}/.cache/kicad:/home/${USER}/.cache/kicad:rw" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash \
		-c "kibot -c .kibot/test.kibot.yaml -d ./hardware -e hardware/soil-moisture-sensor.sch -b hardware/soil-moisture-sensor.kicad_pcb"

case:
	openscad hardware/case/case.scad -o hardware/case/base.stl -D 'part="base"'
	openscad hardware/case/case.scad -o hardware/case/shell.stl -D 'part="shell"'

interactive:
	docker run --rm -it \
		--user ${USER_ID}:${GROUP_ID} \
		--workdir="/home/${USER}/workdir" \
		--volume=${PWD}:/home/${USER}/workdir \
		--volume="/etc/group:/etc/group:ro" \
		--volume="/etc/passwd:/etc/passwd:ro" \
		--volume="/etc/shadow:/etc/shadow:ro" \
		--volume="/home/${USER}/.config/kicad:/home/${USER}/.config/kicad:rw" \
		--volume="/home/${USER}/.cache/kicad:/home/${USER}/.cache/kicad:rw" \
		--volume="/usr/share/kicad:/usr/share/kicad" \
		${IMAGE_NAME} /bin/bash

clean:
	rm -rf hardware/Documentation
	rm -rf hardware/Gerbers
	rm -rf hardware/PickAndPlace
	rm hardware/case/base.stl
	rm hardware/case/shell.stl

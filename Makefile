#!/usr/bin/make

SHELL = /bin/sh

USER_ID := $(shell id -u)
GROUP_ID := $(shell id -g)
PWD := $(shell pwd)
MYSLOCAL := $(shell cd ./hardware/lib; pwd)
IMAGE_NAME := setsoft/kicad_auto:11.6-5.1.9
DATADIR := /data
WORKDIR := /home/${USER}/workdir
VERSION := $(shell git describe --tags --match "v*" HEAD | sed -E 's/^(v[0-9]+\.[0-9]+)\.[0-9]+(.*)$$/\1\2/' )

export USER_ID, GROUP_ID, PWD, MYSLOCAL

all: documentation production case

documentation:
	docker run --rm \
		--env USER_ID=${USER_ID} \
		--env GROUP_ID=${GROUP_ID} \
		--env WORKDIR="${WORKDIR}" \
		--env DATADIR="${DATADIR}" \
		--workdir="${WORKDIR}" \
		--volume=${PWD}:${DATADIR} \
		${IMAGE_NAME} /bin/bash \
		-c "${DATADIR}/.kibot/docker_setup.sh && runuser -u me -- kibot -c ${WORKDIR}/.kibot/documentation.kibot.yaml -d ${DATADIR}/hardware -e ${WORKDIR}/hardware/soil-moisture-sensor.sch -b ${WORKDIR}/hardware/soil-moisture-sensor.kicad_pcb"

production:
	docker run --rm \
		--env USER_ID=${USER_ID} \
		--env GROUP_ID=${GROUP_ID} \
		--env WORKDIR="${WORKDIR}" \
		--env DATADIR="${DATADIR}" \
		--workdir="${WORKDIR}" \
		--volume=${PWD}:${DATADIR} \
		${IMAGE_NAME} /bin/bash \
		-c "${DATADIR}/.kibot/docker_setup.sh && runuser -u me -- kibot -c ${WORKDIR}/.kibot/production.kibot.yaml -d ${DATADIR}/hardware -e ${WORKDIR}/hardware/soil-moisture-sensor.sch -b ${WORKDIR}/hardware/soil-moisture-sensor.kicad_pcb"

test:
	docker run --rm \
		--env USER_ID=${USER_ID} \
		--env GROUP_ID=${GROUP_ID} \
		--env WORKDIR="${WORKDIR}" \
		--env DATADIR="${DATADIR}" \
		--workdir="${WORKDIR}" \
		--volume=${PWD}:${DATADIR} \
		${IMAGE_NAME} /bin/bash \
		-c "${DATADIR}/.kibot/docker_setup.sh && runuser -u me -- kibot -c ${WORKDIR}/.kibot/test.kibot.yaml -d ${DATADIR}/hardware -e ${WORKDIR}/hardware/soil-moisture-sensor.sch -b ${WORKDIR}/hardware/soil-moisture-sensor.kicad_pcb"

interactive:
	docker run -it --rm \
		--workdir="${WORKDIR}" \
		--env USER_ID=${USER_ID} \
		--env GROUP_ID=${GROUP_ID} \
		--env WORKDIR="${WORKDIR}" \
		--volume=${PWD}:${WORKDIR} \
		${IMAGE_NAME} /bin/bash

case:
	openscad hardware/case/case.scad -o hardware/case/base-${VERSION}.stl -D 'part="base"'
	openscad hardware/case/case.scad -o hardware/case/shell-${VERSION}.stl -D 'part="shell"'

clean:
	rm -rf hardware/Documentation
	rm -rf hardware/Gerbers
	rm -rf hardware/PickAndPlace
	rm -f hardware/case/*.stl

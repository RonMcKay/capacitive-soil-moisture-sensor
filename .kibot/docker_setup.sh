#!/bin/bash
groupadd --gid $GROUP_ID mygroup
useradd --gid $GROUP_ID --uid $USER_ID -G root --create-home me

# mkdir -p $WORKDIR
cp -r $DATADIR/hardware $WORKDIR/hardware
cp -r $DATADIR/.kibot $WORKDIR/.kibot

chown -R $USER_ID:$GROUP_ID $WORKDIR


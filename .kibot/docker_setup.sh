#!/bin/bash
groupadd --gid $GROUP_ID mygroup
useradd --gid $GROUP_ID --uid $USER_ID -G root --create-home me

# mkdir -p $WORKDIR
cp -r $DATADIR/hardware $WORKDIR/hardware
cp -r $DATADIR/.kibot $WORKDIR/.kibot

chown -R $USER_ID:$GROUP_ID $WORKDIR

find ${WORKDIR}/hardware -type f -exec sed -i -e 's/%%date%%/'"$(date +'%Y-%m-%d')"'/g' {} \;
find ${WORKDIR}/hardware -type f -exec sed -i -e 's/%%version%%/pre-release/g' {} \;

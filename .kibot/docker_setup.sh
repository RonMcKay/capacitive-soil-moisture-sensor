#!/bin/bash
groupadd --gid $GROUP_ID mygroup
useradd --gid $GROUP_ID --uid $USER_ID -G root --create-home me

# NOTE: The following was originally in place to replace variables during building without changing the local project files. This was replace with the `restore_project` flag of KiBot. Leaving that here for reference for now.
# mkdir -p $WORKDIR
# cp -r $DATADIR/hardware $WORKDIR/hardware
# cp -r $DATADIR/.kibot $WORKDIR/.kibot

# chown -R $USER_ID:$GROUP_ID $WORKDIR


These production files are generated to be used with [JLCPCB](https://jlcpcb.com/).

You can roughly use the default settings when uploading the gerber files. The only settings that I changed:

- PCB Qty: Whatever number of PCBs you want to order.
- Surface Finish: LeadFree HASL-RoHS (LeadFree will probably be better when the sensor is in contact with the soil of your plants)
- Silkscreen: I prefer Black because it blends in quite well with soil color and also looks cool but you can choose whichever you like.

Apart from that you should make sure the following settings are applied:
- Outer Copper Weight: 1oz (2oz has different minimum clearence requirements than in the provided gerber files)
- PCB Thickness: 1.6mm (the case in the repo is constructed for a 1.6mm thick PCB)

For the delivery format I choose "Single PCB" as I like the smooth edges and there is no real price difference If you choose a panel.

The gerber files might also work for other manufacturers but I have not tested. If you need a different format you can also generate it with KiCad.

# Ubuntu_scripts
Tested on
- ASUS ROG Strix GL503

## FILES

### charge_controller.sh
Sets threshold to stop charging on laptops.<br />
```
Usage: sudo bash battery_controller.sh [Mode]
MODES:
	-f 	 set mode to Full Capacity [100%]
	-b 	 set mode to Balanced [80%]
	-m 	 set mode to Maximum Lifespan [60%]
	-t X	 set threshold to X between 0 and 100
```


### dgpu.sh
Runs a program on dedicated Nvidia GPU.<br />
Prime profile should be set to NVIDIA ON DEMAND
```
Usage: bash dgpu.sh [Name]
EXAMPLE:
	dgpu glxheads :0
```

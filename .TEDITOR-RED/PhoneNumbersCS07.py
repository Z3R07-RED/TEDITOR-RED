#!/usr/bin/env python
# Name        : PhoneNumbersCS07
# Author      : Z3R07-RED
# Last Change : Oct 18 2021 [20:02:23]
#
# dependencies
import phonenumbers
from phonenumbers import timezone
from phonenumbers import geocoder, carrier

# Define colors
BLACK = '\033[30m'
RED = '\033[31m'
GREEN = '\033[32m'
YELLOW = '\033[33m'
BLUE = '\033[34m'
MAGENTA = '\033[35m'
CYAN = '\033[36m'
WHITE = '\033[37m'
RESET = '\033[0m'


numberfile = open(r'number.tmp', 'r')
contenido = numberfile.readline()
numberfile.close()
phonenumbersfile = phonenumbers.parse(str(contenido))
valid = phonenumbers.is_valid_number(phonenumbersfile)
zones = timezone.time_zones_for_number(phonenumbersfile)
carriernames = carrier.name_for_number(phonenumbersfile, 'es')
geo = geocoder.description_for_number(phonenumbersfile, 'es')


def createfile():
    infofile = open(r'info.txt', 'w')
    infofile.close()


def createinfo():
    infofile = open(r'info.txt', 'a')
    infofile.write(str(phonenumbersfile)+"\n")
    infofile.write("   Time Zone: "+str(zones)+"\n")
    infofile.write("     Carrier: "+str(carriernames)+"\n")
    infofile.write("     Country: "+str(geo)+"\n")
    if valid is True:
        infofile.write("      Number: valid\n")
    else:
        infofile.write("      Number: not valid\n")
    infofile.close()


createfile()
createinfo()
print(YELLOW+str(phonenumbersfile)+"\n")
print(GREEN+"   Time Zone: "+WHITE+str(zones)+"\n")
print(GREEN+"     Carrier: "+WHITE+str(carriernames)+"\n")
print(GREEN+"     Country: "+WHITE+str(geo)+"\n")
if valid is True:
    print(GREEN+"      Number:"+WHITE+" valid\n")
else:
    print(GREEN+"      Number:"+RED+" not valid\n")

# Coded by Z3R07-RED

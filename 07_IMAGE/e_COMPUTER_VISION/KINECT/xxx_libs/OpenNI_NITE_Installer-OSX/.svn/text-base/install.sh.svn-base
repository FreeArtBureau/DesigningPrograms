#! /bin/sh

# *******************************************************************************
# SimpleOpenNI
# *******************************************************************************
# Installs all OpenNI/NITE libs 
# *******************************************************************************
# prog. Max Rheiner / Interaction Design / Zhdk
# *******************************************************************************

echo "-------- Install OpenNI/NITE ------------"

echo "copy OpenNI-Module..."
cp -R ./data/ni /var/lib/

echo "copy NITE-Conf..."
mkdir /usr/etc

cp -R ./data/primesense /usr/etc/

# copy all dyn.libs
echo "copy OpenNI+NITE dynamic libs into /usr/lib"

cp ./data/*.dylib /usr/lib/
# OpenNI
# cp ./data/libOpenNI.dylib /usr/lib/
# cp ./data/libnimCodecs.dylib /usr/lib/
# cp ./data/libnimMockNodes.dylib /usr/lib/
# cp ./data/libnimRecorder.dylib /usr/lib/
# 
# # NITE
# cp ./data/libXnCore.dylib /usr/lib/
# cp ./data/libXnDDK.dylib /usr/lib/
# cp ./data/libXnDeviceFile.dylib /usr/lib/
# cp ./data/libXnDeviceSensorV2.dylib /usr/lib/
# cp ./data/libXnDeviceSensorV2KM.dylib /usr/lib/
# cp ./data/libXnFormats.dylib /usr/lib/
# cp ./data/libXnVCNite_1_3_1.dylib /usr/lib/
# cp ./data/libXnVFeatures_1_3_1.dylib /usr/lib/
# cp ./data/libXnVHandGenerator_1_3_1.dylib /usr/lib/
# cp ./data/libXnVNite_1_3_1.dylib /usr/lib/

# libusb
# this is a hack !!!!!!!!!!!!! Don't use it, just for testing
echo "create the folders for libusb(macport)"
mkdir /opt
mkdir /opt/local
mkdir /opt/local/lib

echo "copy libusb dynamic libs into /opt/local/lib"
cp ./data/libusb-1.0.0.dylib /opt/local/lib/

echo "-------- Done Install OpenNI/NITE ------------"

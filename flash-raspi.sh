#!/bin/bash

usage () {
  echo 'Usage: flash-raspi.sh -d|--disk <PATH> -r|--rdisk <PATH> -i|--infile <PATH> -h|--help'
  echo 'Example:'
  echo 'flash-raspi -d /dev/disk5 -r /dev/rdisk5 -i /Volumes/ELITE/offload/raspi2.img'
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

for arg in "$@"
do
    case $arg in
        -r|--rdisk)
        RDISK="$2"
        shift
        shift
        ;;
        -i|--infile)
        INFILE="$2"
        shift
        shift
        ;;
        -d|--disk)
        RDISK="$2"
        shift
        shift
        ;;
        -h|--help)
        usage
        exit
        ;;
    esac
done

# Check if all the variables are defined
if [ -z ${RDISK+x} ] || [ -z ${INFILE+x} ] || [ -z ${DISK+x} ]; then
   usage
   exit 1
fi

#diskutil unmountDisk $DISK
#sudo dd bs=1m if=$INFILE of=$RDISK conv=sync
#sudo diskutil eject $RDISK
echo $DISK
echo $INFILE
echo $RDISK

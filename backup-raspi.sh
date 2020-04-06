#!/bin/bash

usage () {
  echo 'Usage: backup-raspi.sh -r|--rdisk <PATH> -o|--outfile <PATH> -h|--help'
  echo 'Example:'
  echo 'backup-raspi -r /dev/rdisk5 -o /Volumes/ELITE/offload/raspi2.img'
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
        -o|--outfile)
        OUTFILE="$2"
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
if [ -z ${RDISK+x} ] || [ -z ${OUTFILE+x} ]; then
   usage
   exit 1
fi

rm -f $OUTFILE
sudo dd if=$RDISK of=$OUTFILE bs=1m

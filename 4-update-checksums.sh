#!/bin/bash
echo "#############################################################################################"
echo
echo "This updates the checksums of all packages"
echo
echo "#############################################################################################"
count=0

for name in $(ls -d */); do
		count=$[count+1]
		echo
		echo "Update Checksums for " $name " - nr: " $count
		echo
		cd $name
		updpkgsums ./PKGBUILD
		echo "#############################################################################################"
		echo "################  "$(basename `pwd`)" done"
		echo "#############################################################################################"
		cd ..
done
		echo "#############################################################################################"
		echo "###################                 Script finished                      ####################"
		echo "#############################################################################################"

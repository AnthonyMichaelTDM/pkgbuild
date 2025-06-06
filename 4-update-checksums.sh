#!/bin/bash
echo "#############################################################################################"
echo
echo "This updates the checksums of all packages"
echo
echo "#############################################################################################"
count=0
for collection in $(ls -d */ | cut -f1 -d'/'); do
	echo
	echo "#############################################################################################"
	echo "################  "$(basename `pwd`)" - collection: " $collection
	echo "#############################################################################################"
	cd $collection
	for name in $(ls -d */); do
		count=$[count+1]
		echo
		echo "Update Checksums for " $name " - nr: " $count
		echo
		cd $name
		updpkgsums ./PKGBUILD
		rm -rf $name
		echo "#############################################################################################"
		echo "################  "$(basename `pwd`)" done"
		echo "#############################################################################################"
		cd ..
	done
	cd ..
done
	echo "#############################################################################################"
	echo "###################                 Script finished                      ####################"
	echo "#############################################################################################"

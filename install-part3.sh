#!/bin/bash

function addSwap {
	if [$growSwap == "n" ] || [$growSwap == "no" ] || [$growSwap == "N" ] || [ $growSwap == "N" ]
	then
		echo "Aborting..."
		exit 0
	else
		echo 0
		echo "# Disabling swap..."
		sudo swapoff -a
		echo 25
		echo "# Creating new 8 GB swapfile (be patient, this can take between 10 seconds and 30 minutes)..."
		sudo dd if=/dev/zero of=/home/swapfile bs=1G count="8" status=progress
		echo 50
		echo "# Setting permissions on swapfile..."
		sudo chmod 0600 /home/swapfile
		echo 75
		echo "# Initializing new swapfile..."
		sudo mkswap /home/swapfile  
		sudo swapon /home/swapfile  
		echo 100
		echo "# Done!"
	fi
}

echo "Changing Swappiness 100 to 10 (Reduces use of Swap file)"
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-custom-swappiness.conf

echo "Do you want to increase swap from 1GB to 8GB? [y/n]"
read growSwap

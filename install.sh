#!/bin/bash

function beginInstall {
	if [$startNow == "n" ] || [$startNow == "no" ] || [$startNow == "N" ] || [$startNow == "N" ]
	then
		echo "Aborting..."
		exit 0
	else
		echo "Setting to read/write temporarily and copying systemd files.//"
		sudo steamos-readonly disable
		sudo cp -v systemd/nix-directory.service /etc/systemd/system/nix-directory.service
		sudo cp -v systemd/nix.mount /etc/systemd/system/nix.mount
		sudo cp -v systemd/ensure-symlinked-units-resolve.service /etc/systemd/system/ensure-symlinked-units-resolve.service
		echo "Files installed. Now enabling. System will reboot."

		sudo systemctl enable --now ensure-symlinked-units-resolve.service
	fi
}

echo "This will now start to setup nix package manager on SteamDeck. Ready? [y/n]"
read startNow

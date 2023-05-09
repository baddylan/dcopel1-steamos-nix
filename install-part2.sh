#!/bin/bash

function beginInstall {
	if [$startNow == "n" ] || [$startNow == "no" ] || [$startNow == "N" ] || [$startNow == "N" ]
	then
		echo "Aborting..."
		exit 0
	else
		echo "Installing Nix..."
		sh <(curl -L https://nixos.org/nix/install) --daemon
	fi
}




echo "Ready to install Nix Package Manager? [y/n]"
read startNow

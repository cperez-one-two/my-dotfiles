#!/bin/sh

configs=$(ls -d */ | cut -f1 -d'/')
dotdir="$HOME/.config"

if [ -d $dotdir ]; then
	echo ".config folder exists. Checking for existing configurations..."

	for config in $configs
	do
		# Check if config dir exists already. If so, do nothing.
		if [ -d "$dotdir/$config" ] ; then
			echo "\"$config\" config already exists. Skipping..."
		else
			echo "Adding $config..."
			ln -sv "$PWD/$config" "$dotdir"
		fi
	done

else
	echo "No .config folder exists, exiting."
fi

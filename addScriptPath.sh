#!/bin/bash

echo "Enter the name of the script to add to PATH:"
read script_name

# Get the directory of the script
script_dir=$(dirname $(readlink -f $script_name))

# Append the directory to PATH if it's not already there
if [[ ":$PATH:" != *":$script_dir:"* ]]; then
    export PATH=$PATH:$script_dir
    echo "Added $script_dir to PATH"
else
    echo "$script_dir is already in PATH"
fi


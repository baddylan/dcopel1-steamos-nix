#!/bin/bash

echo "Changing Swappiness 100 to 10 (Reduces use of Swap file)"
echo "vm.swappiness=10" | sudo tee /etc/sysctl.d/99-custom-swappiness.conf

echo "Increase swap file aue if you want to."

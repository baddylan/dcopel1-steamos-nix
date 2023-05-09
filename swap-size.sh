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

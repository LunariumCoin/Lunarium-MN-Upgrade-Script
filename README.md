# Lunarium-MN-Upgrade-Script
Shell script to update Lunarium Masternodes installed with https://github.com/LunariumCoin/Lunarium-MN-Install 

Before running this script please make sure that the hot (controller) wallet is updated to the latest version.

Login to VPS using root account and run below commands:  

wget -N https://raw.githubusercontent.com/LunariumCoin/Lunarium-MN-Upgrade-Script/master/lunarium_upgrade.sh  
bash lunarium_upgrade.sh  

If update goes well wait 5 minutes and then restart Masternode from hot (controller) wallet.

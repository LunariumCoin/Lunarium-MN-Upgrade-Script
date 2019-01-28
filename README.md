# Lunarium-MN-Upgrade-Script
Shell script to update Lunarium Masternodes installed with https://github.com/LunariumCoin/Lunarium-MN-Install 

Before running this script please make sure that hot (controller) wallet is updated to the latest version.

Login to VPS using root account and run below commands  
wget https://raw.githubusercontent.com/LunariumCoin/Lunarium-MN-Upgrade-Script/master/lunarium_upgrade.sh  
bash lunarium_upgrade.sh  

during testing  
wget https://raw.githubusercontent.com/RealHoneyBadger/Lunarium-MN-Upgrade-Script/master/lunarium_upgrade.sh  

If update goes well wait 5 minutes and restart node from hot (controller) wallet.  

#!/bin/bash

LUNARIUM_LATEST_RELEASE="https://github.com/LunariumCoin/lunarium/releases/download/v1.3.0/lunarium-1.3.0-x86_64-linux-gnu.tar.gz"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function checks() {
if [[ $(lsb_release -d) != *18.04* ]] || [[ $(lsb_release -d) != *20.04* ]]; then
  echo -e "${RED}You are not running Ubuntu 18.04 or 20.04. Installation is cancelled.${NC}"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}$0 must be run as root.${NC}"
   exit 1
fi
}

function ask_yes_or_no() {
  read -p "$1 ([Y]es or [N]o | ENTER): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes) echo "yes" ;;
        *)     echo "no" ;;
    esac
}

function copy_lunarium_binaries(){
  cd
  wget $LUNARIUM_LATEST_RELEASE
  tar -xzf `basename $LUNARIUM_LATEST_RELEASE` --strip-components=2
  cp -fr lunarium-cli lunariumd lunarium-tx lunarium-qt /usr/local/bin
  chmod 755 /usr/local/bin/lunarium*
}

function upgrade() {
  echo -e "${GREEN}This script can only be used to upgrade Lunarium Masternodes to the latest version that was previously installed using the offical shell script.${NC}"
  if [[ "yes" == $(ask_yes_or_no "Do you wish to upgrade?") ]]
    then
      systemctl stop lunarium.service
      copy_lunarium_binaries
      systemctl start lunarium.service
      echo -e "${GREEN}Please wait at least five minutes and then re-start the MasterNode from the hot wallet.${NC}"
  else
    echo -e "Script terminated and Masternode not upgraded to latest version!"
    exit 1
  fi
}

##### Main #####
checks
upgrade

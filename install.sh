#!/bin/bash

# install mcfly
cartridge insert mcfly
ln -sf ~/.data/cartridges/mcfly ~/.mcfly
curl -fsSL https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sudo sh -s -- --git cantino/mcfly

# add systemd timer for persisting mcfly history
sudo cp spin/persist-history.service /etc/systemd/system/persist-history.service
sudo cp spin/persist-history.timer /etc/systemd/system/persist-history.timer
systemctl start persist-history.service

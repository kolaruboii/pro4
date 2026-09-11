#!/bin/bash

# SELinux Access Denial Practical
# Student Name:Arulmurugan M
# Register Number:1U24IT012

echo "===== SELinux Status ====="
getenforce
sestatus

echo "===== Creating Web Directory ====="
sudo mkdir -p /web

echo "===== Creating HTML File ====="
echo "<html><body><h1>SELinux Practical</h1></body></html>" | sudo tee /web/index.html > /dev/null

echo "===== Setting Linux Permissions ====="
sudo chmod 755 /web
sudo chmod 644 /web/index.html

echo "===== Checking Initial Context ====="
ls -Zd /web
ls -Z /web/index.html

echo "===== Assigning Wrong SELinux Context ====="
sudo chcon -t default_t /web/index.html

echo "===== Checking Wrong Context ====="
ls -Z /web/index.html

echo "===== Checking AVC Denials ====="
sudo ausearch -m AVC -ts recent 2>/dev/null

echo "===== Correcting SELinux Context ====="
sudo restorecon -v /web/index.html

echo "===== Checking Correct Context ====="
ls -Z /web/index.html

echo "===== Practical Completed ====="

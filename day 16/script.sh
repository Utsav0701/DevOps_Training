#!/bin/bash

ansible green -i inventory.ini -m shell -a "df -h"
ansible green -i inventory.ini -m apt -a "name=nginx state=present" --become
ansible all -i inventory.ini -m service -a "name=nginx state=restarted" --become
ansible green -i inventory.ini -m apt -a "upgrade=dist" --become

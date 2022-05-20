#!/bin/bash

# Free memory output to a free_mem.txt file
free -h > ~/backups/freemem/free_mem.txt

# Disk usage output to a disk_usage.txt file
du -hc > ~/backups/diskuse/disk_usage.txt

# List open files to a open_list.txt file
lsof -h > ~/backups/openlist/open_list.txt

# Free disk space to a free_disk.txt file
df -h > ~/backups/freedisk/free_disk.txt

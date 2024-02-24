# Cleanup apt
sudo apt autoremove && sudo apt clean

# Removes old revisions of snaps
#CLOSE ALL SNAPS BEFORE RUNNING THIS
sudo snap set system refresh.retain=2
set -eu
LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
 while read snapname revision; do
     sudo snap remove "$snapname" --revision="$revision"
 done 

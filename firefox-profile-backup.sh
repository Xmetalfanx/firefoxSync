#!/bin/bash

clear

. "configs/common.cfg"
. "configs/actions.cfg"

#############################################################################

# 1. Check for Firefox Profile dir.... if it doesn't exist there is nothing to backup
# should return 1 (inverse check being used so 1 means the dir DOES exit)
    # idea ... since it didn't return "true" (0) it doesn't get to the post && part
[ -d "${firefoxProfileFolder}" ] && echo "Proeeding to backup INTIAL firefox profiles" && userPrompt || echo "Firefox profile location does not exit, nothing to do, Exiting script" || exit 

# 2. Check if the destination folder exists, if it doesn't CREATE it
checkDirExistsAndCreate "${firefoxProfileBackupFolder}"
 userPrompt

# 3 - Create backup of user's INTIAL profiles .. this should never BE overwritten if the backup location exists and has existing data 
backupIntialProfiles

echo -e "back in main location" 

backupFFProfiles

userPrompt
#!/usr/bin/env bash

SCRIPT_NAME=$(basename "$0")
# technical debt: more than one file uses magic 'rusefi_bundle_' constant, can we extract constant?
FULL_BUNDLE_FILE="rusefi_bundle_${BUNDLE_NAME}.zip"
UPDATE_BUNDLE_FILE="rusefi_bundle_${BUNDLE_NAME}_autoupdate.zip"

if [ -n "$RUSEFI_SSH_USER" -a -n "$RUSEFI_SSH_PASS" -a -n "$RUSEFI_SSH_SERVER" ]; then
 echo "$SCRIPT_NAME: Uploading full bundle"
 RET=0
 if [ "$LTS" == "true" -a -n "$REF" ]; then
   tar -czf - $FULL_BUNDLE_FILE  | sshpass -p $RUSEFI_SSH_PASS ssh -o StrictHostKeyChecking=no $RUSEFI_SSH_USER@$RUSEFI_SSH_SERVER "mkdir -p build_server/lts/${REF}; tar -xzf - -C build_server/lts/${REF}"
	 RET=$((RET+$?))
   tar -czf - $UPDATE_BUNDLE_FILE  | sshpass -p $RUSEFI_SSH_PASS ssh -o StrictHostKeyChecking=no $RUSEFI_SSH_USER@$RUSEFI_SSH_SERVER "mkdir -p build_server/lts/${REF}/autoupdate; tar -xzf - -C build_server/lts/${REF}/autoupdate"
	 RET=$((RET+$?))
 else
   tar -czf - $FULL_BUNDLE_FILE  | sshpass -p $RUSEFI_SSH_PASS ssh -o StrictHostKeyChecking=no $RUSEFI_SSH_USER@$RUSEFI_SSH_SERVER "tar -xzf - -C build_server"
	 RET=$((RET+$?))
   tar -czf - $UPDATE_BUNDLE_FILE  | sshpass -p $RUSEFI_SSH_PASS ssh -o StrictHostKeyChecking=no $RUSEFI_SSH_USER@$RUSEFI_SSH_SERVER "mkdir -p build_server/autoupdate; tar -xzf - -C build_server/autoupdate"
	 RET=$((RET+$?))
 fi
 if [ $RET -ne 0 ]; then
  echo "$SCRIPT_NAME: Bundle upload failed"
  exit 1
 fi
else
 echo "$SCRIPT_NAME: Upload not configured"
fi

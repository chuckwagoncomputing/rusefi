#!/usr/bin/env bash
# The full path of the firmware directory
FDIR=$(cd "$(dirname "$0")/.."; pwd -P)

cd $FDIR

getTarget ()
{
	source config/boards/common_script_read_meta_env.inc $1 >/dev/null
	SKIP_RATE=${SKIP_RATE:-0}
	if [ "$EVENT_NAME" == 'workflow_dispatch' \
										 -o "$EVENT_NAME" == 'schedule' \
										 -o "$EVENT_NAME" == 'pull_request' \
										 -o "$RUN_ATTEMPT" -gt 1 \
										 -o $((RANDOM % 100)) -ge "$SKIP_RATE" \
										 -o "$(echo "$COMMIT_MESSAGE" | grep -Po '(?<=only:)[^\s]*')" == "$BUNDLE_NAME" ]; then
		echo "{\"build-target\": \"$BUNDLE_NAME\", \"meta-info\": \"$1\"},"
	fi
}

echo -n '{"include": ['
find config/boards -name "meta-info*.env" -print0 | while IFS= read -r -d '' f; do
	echo -n "$(getTarget $f)"
done
echo "]}"


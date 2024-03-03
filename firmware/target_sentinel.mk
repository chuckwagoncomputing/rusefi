TGT_SENTINEL = $(PROJECT_DIR)/.target-sentinel

# This sentinel's purpose is to trigger rebuilds when building for a different target.
# SHORT_BOARD_NAME doesn't cover all possible changes.
# For example, if I build Proteus F7, then build Proteus F7 Debug, it won't actually rebuild,
#  because SHORT_BOARD_NAME hasn't changed. BUNDLE_NAME would be a better specifier,
#  but it's currently only available from the build_firmware GHA workflow.
#  Another option would be to use BOARD_META_PATH, and export it in config.sh.
$(TGT_SENTINEL): .FORCE
	if [ "$$(cat $@ 2>/dev/null)" != $(SHORT_BOARD_NAME) ]; then \
	echo $(SHORT_BOARD_NAME) >$@; fi

.FORCE:

$(OBJS): $(TGT_SENTINEL)

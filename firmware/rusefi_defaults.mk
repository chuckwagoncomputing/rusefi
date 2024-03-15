BOARDS_DIR = $(PROJECT_DIR)/config/boards

ifeq ($(PROJECT_BOARD),)
ifneq ($(SHORT_BOARD_NAME),)
  $(info Setting PROJECT_BOARD to SHORT_BOARD_NAME)
  PROJECT_BOARD = $(SHORT_BOARD_NAME)
else
  $(info Setting PROJECT_BOARD to default f407-discovery)
  PROJECT_BOARD = f407-discovery
endif
endif

# allow passing a custom board dir, otherwise generate it based on the board name
ifeq ($(BOARD_DIR),)
	BOARD_DIR = $(BOARDS_DIR)/$(PROJECT_BOARD)
  $(info Setting BOARD_DIR to $(BOARD_DIR))
  $(info Trying to include $(BOARD_DIR)/meta-info.env)
	-include $(BOARD_DIR)/meta-info.env
endif

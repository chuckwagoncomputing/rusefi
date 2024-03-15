
CHIBIOS_FILE=$(CHIBIOS)/os/readme.txt
ifeq ("$(wildcard $(CHIBIOS_FILE))","")
$(info $(CHIBIOS_FILE) not found. Chibios: Invoking "git submodule update --init")
$(shell git submodule update --init)
$(info Invoked "git submodule update --init")
# make is not happy about newly checked out module for some reason but next invocation would work
$(error Please run 'make' again. Please make sure you have 'git' command in PATH)
endif

CHIBIOS_CONTRIB_FILE=$(CHIBIOS_CONTRIB)/os/hal/hal.mk
ifeq ("$(wildcard $(CHIBIOS_CONTRIB_FILE))","")
$(info $(CHIBIOS_CONTRIB_FILE) not found. Contrib: Invoking "git submodule update --init")
$(shell git submodule update --init)
$(info Invoked "git submodule update --init")
# make is not happy about newly checked out module for some reason but next invocation would work
$(error Please run 'make' again. Please make sure you have 'git' command in PATH)
endif

include $(PROJECT_DIR)/rusefi_defaults.mk

BOARDINC_SAVE := $(BOARDINC)

-include $(BOARD_DIR)/config.mk
include $(BOARD_DIR)/board.mk

BOARDINC_EXTRA := $(BOARDINC)
BOARDINC_EXTRA += $(BOARD_DIR)

BOARDINC := $(BOARDINC_SAVE)

ifneq ($(META_OUTPUT_ROOT_FOLDER),)
  BOARDINC_EXTRA += $(META_OUTPUT_ROOT_FOLDER)
endif

ifeq ($(PROJECT_CPU),)
  $(info Setting PROJECT_CPU to default ARCH_STM32F4)
  # while building PROJECT_CPU is provided as 'make' command line argument value and we do not seem to be able to change that value
  # looks like 'make clean' is the only consumer of this value?!
  PROJECT_CPU = ARCH_STM32F4
endif

ifeq (,$(filter clean,$(MAKECMDGOALS)))
ifeq ($(SHORT_BOARD_NAME),)
$(error SHORT_BOARD_NAME not set, something wrong with your meta-info.env file)
endif
endif
DDEFS += -DSHORT_BOARD_NAME=$(SHORT_BOARD_NAME)

PIN_NAMES_FILE=$(BOARD_DIR)/connectors/generated_ts_name_by_pin.cpp

ifneq ("$(wildcard $(PIN_NAMES_FILE))","")
$(info found $(PIN_NAMES_FILE) )
ALLCPPSRC += $(PIN_NAMES_FILE)
endif

# CPU-dependent defs
ifeq ($(PROJECT_CPU),ARCH_STM32F7)
  CPU_STARTUP = startup_stm32f7xx.mk
  # next file is included through Contrib's platform.ml
  #CPU_PLATFORM = $(CHIBIOS)/os/hal/ports/STM32/STM32F7xx/platform.mk
  CPU_PLATFORM = ${CHIBIOS_CONTRIB}/os/hal/ports/STM32/STM32F7xx/platform.mk
  CPU_HWLAYER = ports/stm32/stm32f7
else ifeq ($(PROJECT_CPU),ARCH_STM32F4)
  CPU_STARTUP = startup_stm32f4xx.mk
  # next file is included through Contrib's platform.ml
  #CPU_PLATFORM = $(CHIBIOS)/os/hal/ports/STM32/STM32F4xx/platform.mk
  CPU_PLATFORM = ${CHIBIOS_CONTRIB}/os/hal/ports/STM32/STM32F4xx/platform.mk
  CPU_HWLAYER = ports/stm32/stm32f4
else ifeq ($(PROJECT_CPU),ARCH_STM32H7)
  CPU_STARTUP = startup_stm32h7xx.mk
  # next file is included through Contrib's platform.ml
  #CPU_PLATFORM = $(CHIBIOS)/os/hal/ports/STM32/STM32H7xx/platform.mk
  CPU_PLATFORM = ${CHIBIOS_CONTRIB}/os/hal/ports/STM32/STM32H7xx/platform.mk
  CPU_HWLAYER = ports/stm32/stm32h7
else ifeq ($(PROJECT_CPU),ARCH_AT32F4)
  CPU_STARTUP = startup_at32f4xx.mk
  CPU_PLATFORM = $(CHIBIOS)/os/hal/ports/AT32/AT32F4xx/platform.mk
  # Reuse STM32F4 port
  CPU_HWLAYER = ports/stm32/stm32f4
else ifeq ($(PROJECT_CPU),custom_platform)
  include $(BOARD_DIR)/custom_platform.mk
  $(info Using custom CPU_STARTUP_DIR $(CPU_STARTUP_DIR))
  $(info Using custom CPU_PLATFORM $(CPU_PLATFORM))
  $(info Using custom CPU_HWLAYER $(CPU_HWLAYER))
else ifeq ($(PROJECT_CPU),simulator)
else
$(error Unexpected PROJECT_CPU [$(PROJECT_CPU)])
endif

ifeq ($(CPU_STARTUP_DIR),)
CPU_STARTUP_DIR = $(CHIBIOS)/os/common/startup/ARMCMx/compilers/GCC/mk/$(CPU_STARTUP)
endif

ifeq ($(GENERATED_ENUMS_DIR),)
GENERATED_ENUMS_DIR = $(PROJECT_DIR)/controllers/algo
endif

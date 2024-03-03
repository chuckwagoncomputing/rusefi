LIVE_DOCS = \
  $(PROJECT_DIR)/console/binary//generated/data_logs.ini \
  $(PROJECT_DIR)/console/binary/generated/fancy_content.ini \
  $(PROJECT_DIR)/console/binary/generated/fancy_menu.ini \
  $(PROJECT_DIR)/console/binary//generated/gauges.ini \
  $(PROJECT_DIR)/console/binary/generated/live_data_fragments.h \
  $(PROJECT_DIR)/console/binary/generated/live_data_ids.h \
  $(PROJECT_DIR)/console/binary/generated/sensors.java \
  $(PROJECT_DIR)/console/binary_log/log_fields_generated.h \
  $(PROJECT_DIR)/console/binary/output_channels_generated.h \
  $(PROJECT_DIR)/controllers/actuators/ac_control_generated.h \
  $(PROJECT_DIR)/controllers/actuators/boost_control_generated.h \
  $(PROJECT_DIR)/controllers/actuators/dc_motors_generated.h \
  $(PROJECT_DIR)/controllers/actuators/electronic_throttle_generated.h \
  $(PROJECT_DIR)/controllers/actuators/fan_control_generated.h \
  $(PROJECT_DIR)/controllers/actuators/fuel_pump_control_generated.h \
  $(PROJECT_DIR)/controllers/actuators/idle_state_generated.h \
  $(PROJECT_DIR)/controllers/actuators/main_relay_generated.h \
  $(PROJECT_DIR)/controllers/actuators/vvt_generated.h \
  $(PROJECT_DIR)/controllers/algo/antilag_system_state_generated.h \
  $(PROJECT_DIR)/controllers/algo/engine_state_generated.h \
  $(PROJECT_DIR)/controllers/algo/fuel/fuel_computer_generated.h \
  $(PROJECT_DIR)/controllers/algo/fuel/injector_model_generated.h \
  $(PROJECT_DIR)/controllers/algo/ignition_state_generated.h \
  $(PROJECT_DIR)/controllers/algo/launch_control_state_generated.h \
  $(PROJECT_DIR)/controllers/algo/tps_accel_state_generated.h \
  $(PROJECT_DIR)/controllers/algo/wall_fuel_state_generated.h \
  $(PROJECT_DIR)/controllers/engine_cycle/high_pressure_fuel_pump_generated.h \
  $(PROJECT_DIR)/controllers/engine_cycle/knock_controller_generated.h \
  $(PROJECT_DIR)/controllers/lua/generated/output_lookup_generated.cpp \
  $(PROJECT_DIR)/controllers/math/lambda_monitor_generated.h \
  $(PROJECT_DIR)/controllers/math/throttle_model_generated.h \
  $(PROJECT_DIR)/controllers/sensors/sent_state_generated.h \
  $(PROJECT_DIR)/controllers/sensors//wideband_state_generated.h \
  $(PROJECT_DIR)/controllers/tcu/tcu_controller_generated.h \
  $(PROJECT_DIR)/controllers/trigger/trigger_central_generated.h \
  $(PROJECT_DIR)/controllers/trigger/trigger_state_generated.h \
  $(PROJECT_DIR)/controllers/trigger/trigger_state_primary_generated.h \
  $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums/StateDictionaryFactory.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/AcControl.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/AntilagSystem.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/BoostControl.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/DcMotors.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/ElectronicThrottle.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/EngineState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/FanControl.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/FuelComputer.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/FuelPump.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/HighPressureFuelPump.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/IdleState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/IgnitionState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/InjectorModel.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/KnockController.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/LambdaMonitor.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/LaunchControl.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/MainRelay.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/SentState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/TcuController.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/ThrottleModel.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/TpsAccelState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/TriggerCentral.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/TriggerState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/TriggerStatePrimary.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/TsOutputs.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/VvtState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/WallFuelState.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/config/generated/WidebandController.java \
  $(PROJECT_DIR)/../java_tools/trigger-image/src/main/java/com/rusefi/config/generated/TriggerMeta.java \
  $(PROJECT_DIR)/../unit_tests/test-framework/trigger_meta_generated.h

$(LIVE_DOCS): .livedoc-sentinel ;

.livedoc-sentinel: $(PROJECT_DIR)/integration/LiveData.yaml $(CONFIG_DEFINITION_BASE)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_live_documentation \
	-cp $(CONFIG_DEFINITION_BASE) \
	com.rusefi.ldmp.LiveDataProcessor \
	-prepend $(PROJECT_DIR)/integration/rusefi_config_shared.txt \
	$(PROJECT_DIR)/integration/LiveData.yaml \
	$(PROJECT_DIR)/integration/rusefi_config_trigger.txt \
	$(PROJECT_DIR)/../unit_tests/test-framework/trigger_meta_generated.h \
	$(PROJECT_DIR)/../java_tools/trigger-image/src/main/java/com/rusefi/config/generated/TriggerMeta.java
	@touch $@

LIVE_DATA_ENUM = $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums/live_data_e.java

$(LIVE_DATA_ENUM): .livedata-sentinel ;

.livedata-sentinel: $(PROJECT_DIR)/console/binary/generated/live_data_ids.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_java_enum \
	-cp $(ENUM_TO_STRING) com.rusefi.ToJavaEnum \
	-enumInputFile $(PROJECT_DIR)/console/binary/generated/live_data_ids.h \
	-outputPath $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums
	@touch $@

SENSOR_TYPE_ENUM = $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums/SensorType.java

$(SENSOR_TYPE_ENUM): $(PROJECT_DIR)/controllers/sensors/sensor_type.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_java_enum \
	-cp $(ENUM_TO_STRING) com.rusefi.ToJavaEnum \
	-enumInputFile $(PROJECT_DIR)/controllers/sensors/sensor_type.h \
	-outputPath $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums

SYNC_EDGE_JAVA_ENUM = $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums/SyncEdge.java

$(SYNC_EDGE_JAVA_ENUM): $(PROJECT_DIR)/controllers/trigger/decoders/sync_edge.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_java_enum \
	-cp $(ENUM_TO_STRING) com.rusefi.ToJavaEnum \
	-enumInputFile $(PROJECT_DIR)/controllers/trigger/decoders/sync_edge.h \
	-outputPath $(PROJECT_DIR)/../java_console/io/src/main/java/com/rusefi/enums

ENGINE_TYPES_JAVA_ENUM = \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/engine_type_e.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/bench_mode_e.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/debug_mode_e.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/trigger_type_e.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/ts_14_command.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/ts_command_e.java

ENGINE_TYPES_DEF = $(PROJECT_DIR)/controllers/algo/engine_types.h

$(ENGINE_TYPES_JAVA_ENUM): .enginetypesj-sentinel

.enginetypesj-sentinel: $(PROJECT_DIR)/integration/rusefi_config.txt $(ENGINE_TYPES_DEF) $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_java_enum \
	-cp $(ENUM_TO_STRING) com.rusefi.ToJavaEnum \
	-enumInputFile $(ENGINE_TYPES_DEF) \
	-outputPath $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums \
	-definition $(PROJECT_DIR)/integration/rusefi_config.txt
	@touch $@

ENGINE_TYPES_ENUM = \
  $(PROJECT_DIR)/controllers/algo/auto_generated_enginetypes.cpp \
  $(PROJECT_DIR)/controllers/algo/auto_generated_enginetypes.h

$(ENGINE_TYPES_ENUM): .enginetypes-sentinel ;

.enginetypes-sentinel: $(ENGINE_TYPES_DEF) $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/controllers/algo \
	-generatedFile enginetypes \
	-enumInputFile $(ENGINE_TYPES_DEF)
	@touch $@

CAN_COMMON_ENUM = \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/bench_test_io_control_e.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/bench_test_magic_numbers_e.java \
  $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums/bench_test_packet_ids_e.java

$(CAN_COMMON_ENUM): .cancommon-sentinel ;

.cancommon-sentinel: $(PROJECT_DIR)/libfirmware/can/can_common.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_java_enum \
	-Denum_with_values=true \
	-cp $(ENUM_TO_STRING) com.rusefi.ToJavaEnum \
	-enumInputFile $(PROJECT_DIR)/libfirmware/can/can_common.h \
	-outputPath $(PROJECT_DIR)/../java_console/models/src/main/java/com/rusefi/enums \
	-definition $(PROJECT_DIR)/libfirmware/can/can_common.h
	@touch $@

COMMON_ENUM = \
  $(PROJECT_DIR)/controllers/algo/auto_generated_commonenum.h \
  $(PROJECT_DIR)/controllers/algo/auto_generated_commonenum.cpp

$(COMMON_ENUM): .common-sentinel ;

.common-sentinel: $(PROJECT_DIR)/controllers/algo/rusefi_enums.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/controllers/algo \
	-generatedFile commonenum \
	-enumInputFile $(PROJECT_DIR)/controllers/algo/rusefi_enums.h
	@touch $@

CAN_CATEGORY_ENUM = \
  $(PROJECT_DIR)/hw_layer/drivers/can/auto_generated_can_category.cpp \
  $(PROJECT_DIR)/hw_layer/drivers/can/auto_generated_can_category.h

$(CAN_CATEGORY_ENUM): .cancategory-sentinel ;

.cancategory-sentinel: $(PROJECT_DIR)/hw_layer/drivers/can/can_category.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/hw_layer/drivers/can \
	-generatedFile can_category \
	-enumInputFile $(PROJECT_DIR)/hw_layer/drivers/can/can_category.h
	@touch $@

SYNC_EDGE_ENUM = \
  $(PROJECT_DIR)/controllers/trigger/decoders/auto_generated_sync_edge.h \
  $(PROJECT_DIR)/controllers/trigger/decoders/auto_generated_sync_edge.cpp

$(SYNC_EDGE_ENUM): .syncedge-sentinel ;

.syncedge-sentinel: $(PROJECT_DIR)/controllers/trigger/decoders/sync_edge.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/controllers/trigger/decoders \
	-generatedFile sync_edge \
	-enumInputFile $(PROJECT_DIR)/controllers/trigger/decoders/sync_edge.h
	@touch $@

HW_ENUM = \
  $(PROJECT_DIR)/controllers/algo/auto_generated_enums.cpp \
  $(PROJECT_DIR)/controllers/algo/auto_generated_enums.h

$(HW_ENUM): .hwenum-sentinel ;

.hwenum-sentinel: $(PROJECT_DIR)/controllers/algo/rusefi_hw_enums.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/controllers/algo \
	-enumInputFile $(PROJECT_DIR)/controllers/algo/rusefi_hw_enums.h
	@touch $@

SENSOR_ENUM = \
  $(PROJECT_DIR)/controllers/sensors/auto_generated_sensor.h \
  $(PROJECT_DIR)/controllers/sensors/auto_generated_sensor.cpp

$(SENSOR_ENUM): .sensorenum-sentinel ;

.sensorenum-sentinel: $(PROJECT_DIR)/controllers/sensors/sensor_type.h $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/controllers/sensors \
	-generatedFile sensor \
	-enumInputFile $(PROJECT_DIR)/controllers/sensors/sensor_type.h
	@touch $@

ifneq (,$(CUSTOM_ENUM_INPUT))
ifneq (,$(CUSTOM_ENUM_OUTPUT))
CUSTOM_ENUM_TGT = \
  $(PROJECT_DIR)/$(BOARD_DIR)/$(CUSTOM_ENUM_OUTPUT)/auto_generated_enums.h \
  $(PROJECT_DIR)/$(BOARD_DIR)/$(CUSTOM_ENUM_OUTPUT)/auto_generated_enums.cpp
endif
endif

$(CUSTOM_ENUM_TGT): $(PROJECT_DIR)/$(BOARD_DIR)/$(CUSTOM_ENUM_INPUT) $(ENUM_TO_STRING)
	java -DSystemOut.name=$(PROJECT_DIR)/logs/gen_enum_to_string \
	-jar $(ENUM_TO_STRING) \
	-outputPath $(PROJECT_DIR)/$(BOARD_DIR)/$(CUSTOM_ENUM_OUTPUT) \
	-enumInputFile $(PROJECT_DIR)/$(BOARD_DIR)/$(CUSTOM_ENUM_INPUT)

DOCS_ENUMS = \
  $(LIVE_DOCS) \
  $(LIVE_DATA_ENUM) \
  $(SENSOR_TYPE_ENUM) \
  $(SYNC_EDGE_JAVA_ENUM) \
  $(ENGINE_TYPES_JAVA_ENUM) \
  $(ENGINE_TYPES_ENUM) \
  $(CAN_COMMON_ENUM) \
  $(COMMON_ENUM) \
  $(CAN_CATEGORY_ENUM) \
  $(SYNC_EDGE_ENUM) \
  $(HW_ENUM) \
  $(SENSOR_ENUM) \
  $(CUSTOM_ENUM_TGT)

$(DOCS_ENUMS): $(TGT_SENTINEL)

# This is necessary because the ChibiOS makefile builds a .o file and generates
#  the deps for that .o file in the same GCC call, so if the .deps aren't already
#  in the correct state, things can fail to build because Make doesn't know it needs
#  to build the prerequisites (in this case DOCS_ENUMS) for those files ahead of time.
$(OBJS): $(DOCS_ENUMS)

.PHONY: docs-enums

docs-enums: $(DOCS_ENUMS)

#!/bin/bash

#
# file gen_perf_trace_enum.sh
#

# fail fast
set -e

SCRIPT_NAME=$(basename "$0")

echo "${SCRIPT_NAME} hello"

java -cp ../java_tools/perf_trace_enum_generator/build/libs/PerfTraceEnumGenerator.jar com.rusefi.PerfTraceEnumGenerator development/perf_trace.h ../java_console/models/src/main/java/com/rusefi/tracing/EnumNames.java

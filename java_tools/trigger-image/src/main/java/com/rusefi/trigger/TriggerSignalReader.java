package com.rusefi.trigger;

import org.jetbrains.annotations.NotNull;
import org.yaml.snakeyaml.Yaml;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;

public class TriggerSignalReader {
    @NotNull
    public static List<ComplexTriggerSignal> readSignals(List<Map<String, Object>> events) {
        if (events == null || events.size() == 0) {
            throw new IllegalStateException("Got no events.");
        }

        List<ComplexTriggerSignal> signals = new ArrayList<>();

				// Read events from object parsed from YAML
        for (Map<String, Object> event : events) {
            int channel = Integer.parseInt(event.get("channel").toString());
            double angle = Double.parseDouble(event.get("angle").toString());
						// Default to 0.0 width and no repetition
            double width = Double.parseDouble(Objects.toString(event.get("width"), "0.0"));
            int times = Integer.parseInt(Objects.toString(event.get("times"), "1"));
            double every = Double.parseDouble(Objects.toString(event.get("every"), "0.0"));

            ComplexTriggerSignal s = new ComplexTriggerSignal(channel, angle, width, times, every);
            signals.add(s);
        }

        return signals;
    }
}

package com.rusefi.trigger;

public class TriggerEvent {
    private double angle;
    private final int waveIndex;

    public TriggerEvent(int waveIndex, double angle) {
        this.waveIndex = waveIndex;
        this.angle = angle;
    }

    public int getWaveIndex() {
        return waveIndex;
    }

    public void setAngle(double angle) {
        this.angle = angle;
    }

    public double getAngle() {
        return angle;
    }
}

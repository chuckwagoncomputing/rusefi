package com.rusefi.trigger;

public class ComplexTriggerSignal extends TriggerEvent {
    private final double width;
    private int times;
    private double every;

    public ComplexTriggerSignal(int waveIndex, double angle, double width, int times, double every) {
        super(waveIndex, angle);
        this.width = width;
        this.times = times;
        this.every = every;
    }

    public ComplexTriggerSignal(int waveIndex, double angle, double width) {
        this(waveIndex, angle, width, 1, 0.0f);
    }

    @Override
    public String toString() {
        return "Signal{" +
                "signal=" + getWaveIndex() +
                ", angle=" + getAngle() +
                ", width=" + getWidth() +
                ", times=" + getTimes() +
                ", every=" + getEvery() +
                '}';
    }

    public double getWidth() {
        return width;
    }

    public int getTimes() {
        return times;
    }

    public double getEvery() {
        return every;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public void setEvery(double every) {
        this.every = every;
    }
}

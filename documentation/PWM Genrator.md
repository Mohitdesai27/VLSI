# Concept

A PWM (Pulse Width Modulation) generator produces a digital signal whose:

Frequency is fixed (set by counter period)
Duty cycle is controlled by an input value

# State Machine

| State | Meaning     |
| ----- | ----------- |
| S0    | OUTPUT HIGH |
| S1    | OUTPUT LOW  |

# State Diagram

            counter < duty
          +------------------+
          |                  v
       +--------+      +--------+
       |  S0    | ---> |  S1    |
       | HIGH   |      | LOW    |
       +--------+ <--- +--------+
          ^                  |
          +------------------+
            counter reset

            

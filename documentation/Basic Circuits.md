# 1. Buffer :

## Definition
A buffer is a basic digital logic circuit that passes the input signal to the output without any logical change, but improves the signal’s electrical characteristics.

𝑌 = 𝐴

## Working Principle
The output follows the input exactly.
If input = 1, output = 1
If input = 0, output = 0

 ### 1. Signal Strengthening
A logic gate can only drive a limited number of inputs.
Buffer increases the ability to drive multiple loads.

 ### 2. Isolation
Prevents one stage from affecting another.
Protects sensitive circuits.

### 3. Delay Control
Buffers are used to control timing in digital circuits.






# Tri-State Buffer

## Definition
A tri-state buffer is a digital circuit that has three possible output states:

Logic 0
Logic 1
High Impedance (Z)

## Bus System

Tri-state buffers are used in bus-based architectures.

### Problem:
Multiple devices connected to same line → conflict if all drive simultaneously

### Solution:
Only one buffer enabled at a time
Others remain in High-Z

	​

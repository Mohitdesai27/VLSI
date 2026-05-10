# 1. Definition

A Universal Shift Register supports all operations:

Hold (No change)
Shift Left
Shift Right
Parallel Load

# 2. Block Architecture

Each bit uses:

1 Flip-Flop (D FF)
1 Multiplexer (4:1)

For N bits → N such stages

# 3. Control Inputs

| S1 | S0 | Operation     |
| -- | -- | ------------- |
| 0  | 0  | Hold          |
| 0  | 1  | Shift Right   |
| 1  | 0  | Shift Left    |
| 1  | 1  | Parallel Load |

# 4. State Transition
For each bit i:

    Qi(t+1) =⎧ Qi     S1S0=00
             ⎨ Qi+1   S1S0=01
             ⎩ Qi−1   S1S0=10
               Pi     S1S0=11



	​

	​





	​




# 1. Concept

Instead of modifying the flip-flop internally, we:

Use a MUX before the D input
Select between:
Normal data (D)
Forced values (0 or 1)

# 2. Inputs
D → Data input
clk → Clock
S → Synchronous Set
R → Synchronous Reset

# 3. State Table
| R | S | D | Q(t+1) |
| - | - | - | ------ |
| 1 | X | X | 0      |
| 0 | 1 | X | 1      |
| 0 | 0 | 0 | 0      |
| 0 | 0 | 1 | 1      |

# 4. MUX-Based Logic

      Din​= ⎧  0   R=1
           ⎨  1   S=1
           ⎩  D   otherwise


​​​


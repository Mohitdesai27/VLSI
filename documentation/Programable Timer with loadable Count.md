# Programmable Timer with Loadable Count

A programmable timer loads a user-defined count value and counts clock pulses until timeout occurs.

# Inputs:

load → loads programmable count
load_value → initial timer value
enable → start counting
clk
rst

# Outputs:

timeout
count 

# State Diagram
| State | Meaning          |
| ----- | ---------------- |
| IDLE  | Waiting for load |
| COUNT | Counter running  |

                load=1
          +-------------------+
          |                   v
       +--------+        +--------+
       | IDLE   | -----> | COUNT  |
       +--------+        +--------+
          ^                   |
          | timeout           |
          +-------------------+


# State Encodings
| State | Q |
| ----- | - |
| IDLE  | 0 |
| COUNT | 1 |

# State Table
| Current | load | enable | count=0 | Next  |
| ------- | ---- | ------ | ------- | ----- |
| IDLE    | 0    | X      | X       | IDLE  |
| IDLE    | 1    | X      | X       | COUNT |
| COUNT   | X    | 1      | 0       | COUNT |
| COUNT   | X    | 1      | 1       | IDLE  |





          

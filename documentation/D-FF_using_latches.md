# 1. Basic Concept
   
Built using two D latches:
Master latch → enabled when CLK = 1
Slave latch → enabled when CLK = 0
This converts level-triggered → edge-triggered


# 2. Block Diagram 
             ┌────────────┐      ┌────────────┐
     D ----> │ Master     │ ---> │ Slave      │ ----> Q
             │ Latch      │      │ Latch      │
             └────────────┘      └────────────┘
                    ↑                   ↑
                    CLK               CLK̅

# 3. State Table
| CLK     | D | Q(t) | Q(t+1) |
| ------- | - | ---- | ------ |
| ↑       | 0 | X    | 0      |
| ↑       | 1 | X    | 1      |
| No edge | X | Q(t) | Q(t)   |

# 4. K-Map

Since:

Q(t+1)=D

K-map is trivial → output depends only on D

# 5. Latch Equations
Master Latch

Qm=D⋅CLK+Qm⋅CLK

Slave Latch

Q=Qm⋅CLK+Q⋅CLK




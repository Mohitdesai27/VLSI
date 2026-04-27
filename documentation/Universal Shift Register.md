# 1. State Transition Table

| (S_1) | (S_0) | (Q_i^+) (Next State)    |
| ----- | ----- | ----------------------- |
| 0     | 0     | (Q_i) (Hold)            |
| 0     | 1     | (Q_{i+1}) (Shift Right) |
| 1     | 0     | (Q_{i-1}) (Shift Left)  |
| 1     | 1     | (D_i) (Parallel Load)   |

# 2. K-Map for One Bit

| ($S_1 S_0$) | Output    |
| --------- | --------- |
| 00        | (Q_i)     |
| 01        | (Q_{i+1}) |
| 10        | (Q_{i-1}) |
| 11        | (D_i)     |

Di​=  $\overline{S1}\overline{S0}Qi​  +  \overline{S1}S0Q_{i+1} + S1\overline{S0}Q_{i−1} ​+  S1S0Di$



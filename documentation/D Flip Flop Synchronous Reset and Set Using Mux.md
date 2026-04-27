# 1. Control Signals

| Signal     | Function          |
| ---------- | ----------------- |
| (S_1, S_0) | Operation select  |
| (RST)      | Synchronous Reset |
| (SET)      | Synchronous Set   |

| Priority | Condition | Operation         |
| -------- | --------- | ----------------- |
| 1        | (RST = 1) | Clear → 0         |
| 2        | (SET = 1) | Set → 1           |
| 3        | (S_1 S_0) | Normal operations |

# 2. State Transition Table

| RST | SET | (S_1) | (S_0) | (Q_i^+)   |
| --- | --- | ----- | ----- | --------- |
| 1   | X   | X     | X     | 0         |
| 0   | 1   | X     | X     | 1         |
| 0   | 0   | 0     | 0     | (Q_i)     |
| 0   | 0   | 0     | 1     | (Q_{i+1}) |
| 0   | 0   | 1     | 0     | (Q_{i-1}) |
| 0   | 0   | 1     | 1     | (D_i)     |

# 3. K-MAP 

| RST | SET | (Y_i) | (D_i) |
| --- | --- | ----- | ----- |
| 0   | 0   | 0     | 0     |
| 0   | 0   | 1     | 1     |
| 0   | 1   | X     | 1     |
| 1   | X   | X     | 0     |



# 4. Boolian Eqn

Yi​  = $\overline{S1}\overline{S0}Qi​  +  \overline{S1}S0Q_{i+1} + S1\overline{S0}Q_{i−1} ​+  S1S0Di$​

Di  = $\overline{RST}⋅SET+  \overline{RST}⋅\overline{SET}⋅Y_i$
	​



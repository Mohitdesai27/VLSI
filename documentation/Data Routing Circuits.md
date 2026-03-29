# 1.  4-to-1 MUX

Inputs: I0, I1, I2, I3
Select lines: S1, S0
Output: Y

## Truth Table : 

| S1 | S0 | Y  |
| -- | -- | -- |
| 0  | 0  | I0 |
| 0  | 1  | I1 |
| 1  | 0  | I2 |
| 1  | 1  | I3 |

## K map :
|S0      | 0 | 1 |
| -- | -- | -- |
|S1=0   | I0| I1|
|S1=1   | I2| I3|

## boolean eqn:
Y= $S_1$ $S_0$ $I_0$  +  $S_1$ $S_0$ $I_1$  +  $S_1$ $S_0$ $I_2$  +  $S_1$ $S_0$ $I_3$

# 2. 1-to-4 DEMUX

Input: D 
Select: S1, S0 
Outputs: Y0, Y1, Y2, Y3

## Truth Table : 

| S1 | S0 | Y0 | Y1 | Y2 | Y3 |
| -- | -- | -- | -- | -- | -- |
| 0  | 0  | D  | 0  | 0  | 0  |
| 0  | 1  | 0  | D  | 0  | 0  |
| 1  | 0  | 0  | 0  | D  | 0  |
| 1  | 1  | 0  | 0  | 0  | D  |


## K-Maps:

Y0
|S0      | 0 | 1 |
| -- | -- | -- |
|S1=0   | D| 0|
|S1=1   | 0| 0|

Y1
|S0      | 0 | 1 |
| -- | -- | -- |
|S1=0   | 0| D|
|S1=1   | 0| 0|

Y2
|S0      | 0 | 1 |
| -- | -- | -- |
|S1=0   | 0| 0|
|S1=1   | D| 0|


Y3
|S0      | 0 | 1 |
| -- | -- | -- |
|S1=0   | 0| 0|
|S1=1   | 0| D|

## boolean eqn:

$Y_0$ = $\overline{S}_1$ $\overline{S}_0$ D

$Y_1$ = $\overline{S}_1$ $S_0$ D

$Y_2$ = $S_1$  $\overline{S}_0$ D

$Y_3$ = $S_1$ $S_0$ D

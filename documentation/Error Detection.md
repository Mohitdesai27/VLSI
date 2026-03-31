# 1. Parity Generator (3-bit, EVEN parity)

## Truth Table:

| A | B | C | P (Even Parity) |
| - | - | - | --------------- |
| 0 | 0 | 0 | 0               |
| 0 | 0 | 1 | 1               |
| 0 | 1 | 0 | 1               |
| 0 | 1 | 1 | 0               |
| 1 | 0 | 0 | 1               |
| 1 | 0 | 1 | 0               |
| 1 | 1 | 0 | 0               |
| 1 | 1 | 1 | 1               |


## K-Maps:

| BC  | 00 | 01 | 11 | 10 |
| --- | -- | -- | -- | -- |
| A=0 | 0  | 1  | 0  | 1  |
| A=1 | 1  | 0  | 1  | 0  |

## Boolean Eqn :

P = A ⊕ B ⊕ C



# 2. Parity Checker

## Truth Table:

| X | P | Error |
| - | - | ----- |
| 0 | 0 | 0     |
| 0 | 1 | 1     |
| 1 | 0 | 1     |
| 1 | 1 | 0     |

## K-Maps:

      
| P    | 0 | 1 |
| ---  | - | - |
| X=0  | 0 | 1 |
| X=1  | 1 | 0 |

## Boolean Eqn :

Error = ( A ⊕ B ⊕ C ) ⊕ P



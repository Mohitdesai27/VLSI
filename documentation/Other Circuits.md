# 1. Majority Circuit (3-input)
Output = 1 if majority of inputs are 1

## Truth Table :

| A | B | C | Y |
| - | - | - | - |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 |

## K-Map :

       
| A\BC  | 00 | 01 | 11 | 10 |
| ----  | -- | -- | -- | -- |
| 0     | 0  | 0  | 1  | 0  |
| 1     | 0  | 1  | 1  | 1  |

## Boolean Equation :

  Y = A B + B C + C A 


  

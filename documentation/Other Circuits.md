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


# 2. Priority Resolver (4-input, D3 highest priority) :

Outputs binary index of highest priority ‘1’

## Truth Table :

| D3 | D2 | D1 | D0 | Y1 | Y0 |
| -- | -- | -- | -- | -- | -- |
| 0  | 0  | 0  | 0  | 0  | 0  |
| 0  | 0  | 0  | 1  | 0  | 0  |
| 0  | 0  | 1  | X  | 0  | 1  |
| 0  | 1  | X  | X  | 1  | 0  |
| 1  | X  | X  | X  | 1  | 1  |

## K-Maps :

Y1        
| D3D2\D1D0 | 00 | 01 | 11 | 10 |
| --------- | -- | -- | -- | -- |
| 00        | 0  | 0  | 0  | 0  |
| 01        | 1  | 1  | X  | X  |
| 11        | X  | X  | X  | X  |
| 10        | 1  | 1  | X  | X  |

Y2
| D3D2\D1D0 | 00 | 01 | 11 | 10 |
| --------- | -- | -- | -- | -- |
| 00        | 0  | 0  | 1  | 0  |
| 01        | 0  | 0  | X  | X  |
| 11        | X  | X  | X  | X  |
| 10        | 1  | 1  | X  | X  |

## Boolean Equations :

Y1 = D3 + D2

Y0 = D3 + (D1 · D2')



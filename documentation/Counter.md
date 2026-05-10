# 1. N-bit Ring Counter

## Definition

A Ring Counter is a:

Shift register
With output of last FF connected back to first FF

Only one bit = 1
All others = 0

## Structure

      Q0 → Q1 → Q2 → ... → Q(N-1)
      ↑                     |
      |_____________________|

## State Table(4-BIT):

| Clock | State |
| ----- | ----- |
| 0     | 1000  |
| 1     | 0100  |
| 2     | 0010  |
| 3     | 0001  |
| 4     | 1000  |

## State Diagram

1000 → 0100 → 0010 → 0001 → 1000


# 2. Twisted Ring Counter (Johnson Counter)

##  Definition

A Johnson Counter is:

Shift register
Inverted output of last FF fed back to first FF


## Structure

    Q0 → Q1 → Q2 → ... → Q(N-1)
    ↑                      |
    |______ NOT ___________|

## State Table( 4-BIT)
| Clock | State |
| ----- | ----- |
| 0     | 0000  |
| 1     | 1000  |
| 2     | 1100  |
| 3     | 1110  |
| 4     | 1111  |
| 5     | 0111  |
| 6     | 0011  |
| 7     | 0001  |
| 8     | 0000  |

## State Diagram

    0000
    ↓
    1000
    ↓
    1100
    ↓
    1110
    ↓
    1111
    ↓
    0111
    ↓
    0011
    ↓
    0001
    ↓
    0000

## Equations
Q0+=QN−1

Qi+=Qi−1
	​

# 3. BCN Counter

## Definition

An N-bit binary counter:

Uses N flip-flops
Counts from:
0→(2N−1)

## State Table  (4-bit)
| Decimal | Binary |
| ------- | ------ |
| 0       | 0000   |
| 1       | 0001   |
| 2       | 0010   |
| 3       | 0011   |
| 4       | 0100   |
| ...     | ...    |
| 15      | 1111   |
| 0       | 0000   |

## State Diagram
    000 → 001 → 010 → 011
     ↑                 ↓
    111 ← 110 ← 101 ← 100


    

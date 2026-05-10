# 1. SR Flip-Flop

## State Table

| S | R | Q(t) | Q(t+1)  |
| - | - | ---- | ------- |
| 0 | 0 | 0/1  | Q(t)    |
| 0 | 1 | X    | 0       |
| 1 | 0 | X    | 1       |
| 1 | 1 | X    | Invalid |


## State Diagram

0 → (S=1) → 1

1 → (R=1) → 0

S=R=0 → no change

## K-Map (for Q(t+1))

Result:

Q(t+1)=S+
R
Q(t)

# 2. JK Flip-Flop

## State Table

| J | K | Q(t) | Q(t+1) |
| - | - | ---- | ------ |
| 0 | 0 | Q    | Q      |
| 0 | 1 | X    | 0      |
| 1 | 0 | X    | 1      |
| 1 | 1 | Q    | Q̅     |

## State Diagram
0 → (J=1) → 1

1 → (K=1) → 0

J=K=1 → toggle

## K-Map Result
Q(t+1)=J
Q
+
K
Q

# 3. D Flip-Flop

## State Table

| D | Q(t+1) |
| - | ------ |
| 0 | 0      |
| 1 | 1      |

## State Diagram

Q follows D directly

## K-Map

Q(t+1)=D


# 4. T Flip-Flop

## State Table

| T | Q(t) | Q(t+1) |
| - | ---- | ------ |
| 0 | Q    | Q      |
| 1 | Q    | Q̅     |

## State Diagram
T=0 → hold

T=1 → toggle

## K-Map Result

Q(t+1)=T⊕Q(t)

## Boolean Equation
Q
+
=TQ
′
+T
′
Q






# 1. Full Adder :

## Inputs:
 A, B, Cin
## Outputs:
 Sum (S)
 Carry (Cout)
## Truth Table :
| A | B | Cin | S | Cout |
| - | - | --- | - | ---- |
| 0 | 0 | 0   | 0 | 0    |
| 0 | 0 | 1   | 1 | 0    |
| 0 | 1 | 0   | 1 | 0    |
| 0 | 1 | 1   | 0 | 1    |
| 1 | 0 | 0   | 1 | 0    |
| 1 | 0 | 1   | 0 | 1    |
| 1 | 1 | 0   | 0 | 1    |
| 1 | 1 | 1   | 1 | 1    |

## Karnaugh maps :

Sum (S):
| BC  | 00 | 01 | 11 | 10 |
| --- | -  | -- | -- | -- |
| A=0 | 0  | 1  | 0  | 1  |
| A=1 | 1  | 0  | 1  | 0  |

Carry (Cout) :
| BC  | 00 | 01 | 11 | 10 |
| --- | -  | -- | -- | -- |
| A=0 | 0  | 0  | 1  | 0  |
| A=1 | 0  | 1  | 1  | 1  |

## Result :
S=A⊕B⊕Cin

Cout​=AB+BCin+ACin

# 2. Full Subtractor :

## Inputs:
A, B, Bin
## Outputs:
Difference (D)
Borrow (Bout)

## Truth Table:

| A | B | Bin | D | Bout |
| - | - | --- | - | ---- |
| 0 | 0 | 0   | 0 | 0    |
| 0 | 0 | 1   | 1 | 1    |
| 0 | 1 | 0   | 1 | 1    |
| 0 | 1 | 1   | 0 | 1    |
| 1 | 0 | 0   | 1 | 0    |
| 1 | 0 | 1   | 0 | 0    |
| 1 | 1 | 0   | 0 | 0    |
| 1 | 1 | 1   | 1 | 1    |

## Karnaugh maps :

Difference (D)
| BC  | 00 | 01 | 11 | 10 |
| --- | -  | -- | -- | -- |
| A=0 | 0  | 1  | 0  | 1  |
| A=1 | 1  | 0  | 1  | 0  |

Borrow (Bout) 
| BC  | 00 | 01 | 11 | 10 |
| --- | -  | -- | -- | -- |
| A=0 | 0  | 1  | 1  | 1  |
| A=1 | 0  | 0  | 1  | 0  |

## Result :
D=A⊕B⊕Bin

Bout​=A′B+Bin(A′+B)


# 3. Comparator :

# 4. Ripple Carry Adder (4-bit):

```mermaid
graph LR
    subgraph Inputs C
        C0[Carry In]
    end
    subgraph Inputs A
        A0[A0]
        A1[A1]
        A2[A2]
        A3[A3]
    end
    subgraph Inputs B
        B0[B0]
        B1[B1]
        B2[B2]
        B3[B3]
    end

    subgraph Outputs
        S0[S0]
        S1[S1]
        S2[S2]
        S3[S3]
        C4[Carry Out]
    end

   Full-Adder-0[Full<br>Adder<br>1<br><br>]
   Full-Adder-1[Full<br>Adder<br>1<br><br>]
   Full-Adder-2[Full<br>Adder<br>1<br><br>]
   Full-Adder-3[Full<br>Adder<br>1<br><br>]

    A0 --> Full-Adder-0
    B0 --> Full-Adder-0
    C0 --> Full-Adder-0

    %% Connect FA0 to outputs and next carry
    Full-Adder-0 --> S0
    Full-Adder-0 --> Full-Adder-1

    %% Connect Inputs and Carry1 to FA1
    A1 --> Full-Adder-1
    B1 --> Full-Adder-1

    Full-Adder-1 --> S1
    Full-Adder-1 -->  Full-Adder-2

    %% Connect Inputs and Carry2 to FA2
    A2 --> Full-Adder-2
    B2 --> Full-Adder-2

    Full-Adder-2 --> S2
    Full-Adder-2 --> Full-Adder-3

    %% Connect Inputs and Carry3 to FA3
    A3 --> Full-Adder-3
    B3 --> Full-Adder-3


    Full-Adder-3 --> S3
    Full-Adder-3 --> C4
```



# 5. Carry  skip Adder (4-bit):

```mermaid

graph LR
    %% Inputs
    subgraph Inputs C
        C0[Carry In]
    end
    subgraph Inputs A
        A0[A0]
        A1[A1]
        A2[A2]
        A3[A3]
    end
    subgraph Inputs B
        B0[B0]
        B1[B1]
        B2[B2]
        B3[B3]
    end

    %% Outputs
    subgraph Outputs
        S0[S0]
        S1[S1]
        S2[S2]
        S3[S3]
        C4[Carry Out]
    end

    %% Full Adder blocks
    FA0[Full<br>Adder<br>1<br><br>]
    FA1[Full<br>Adder<br>2<br><br>]
    FA2[Full<br>Adder<br>3<br><br>]
    FA3[Full<br>Adder<br>4<br><br>]

    %% Input connections
    A0 --> FA0
    B0 --> FA0
    C0 --> FA0

    A1 --> FA1
    B1 --> FA1
    FA0 --> FA1

    A2 --> FA2
    B2 --> FA2
    FA1 --> FA2

    A3 --> FA3
    B3 --> FA3
    FA2 --> FA3

    %% Sum outputs
    FA0 --> S0
    FA1 --> S1
    FA2 --> S2
    FA3 --> S3

    %% Carry Skip Logic subgraph
    subgraph CarrySkipLogic[Carry Skip Logic]
        %% Propagate signals
        P0[P0 = A0 ⊕ B0] --> Pblock
        P1[P1 = A1 ⊕ B1] --> Pblock
        P2[P2 = A2 ⊕ B2] --> Pblock
        P3[P3 = A3 ⊕ B3] --> Pblock
        C0 --> Pblock
        Pblock[Block Propagate = P0·P1·P2·P3]
        %% Output carry
        Pblock --> C4
        FA3 --> C4_FA[Carry from FA3] 
        C4_FA --> C4
    end

```

# 6. Carry  look ahead  Adder (4-bit):

```mermaid


```



# 7. Adder Subtactor  (4-bit):
```mermaid

```







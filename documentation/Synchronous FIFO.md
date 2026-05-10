# Basic FIFO Concept

Data flow:
    WRITE → [ FIFO MEMORY ] → READ

# Components

| Component     | Function                   |
| ------------- | -------------------------- |
| Memory Array  | Stores data                |
| Write Pointer | Points next write location |
| Read Pointer  | Points next read location  |
| Full Logic    | Detects FIFO full          |
| Empty Logic   | Detects FIFO empty         |

# Architecture
                    ┌──────────────┐
    DIN ----------->│              │
    WR_EN --------->│              │
                    │   MEMORY     │-----> DOUT
    RD_EN --------->│              │
                    └──────────────┘
                          ↑   ↑
                       WR_PTR RD_PTR

# Parameters

Depth = 2^N

Width = M bits


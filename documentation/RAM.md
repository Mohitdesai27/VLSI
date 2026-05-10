# 1.SPRAM

## Basic Structure
            ┌─────────────────┐
    ADDR -->│                 │
    DIN ---->   SINGLE PORT   │--> DOUT
    WE ----->      RAM        │
    CLK ---->                 │
            └─────────────────┘
## Signals
| Signal | Function     |
| ------ | ------------ |
| CLK    | Clock        |
| WE     | Write Enable |
| ADDR   | Address      |
| DIN    | Data Input   |
| DOUT   | Data Output  |

## Memory Organization
Depth = 2^N

Width = M bits

Memory size:
2^N×M

# 2.DPRAM

## Basic Structure

                ┌────────────────┐
    PORT A ---> │                │ <--- PORT B
                │   DUAL PORT    │
                │      RAM       │
                └────────────────┘
## Signals
| Signal | Function     |
| ------ | ------------ |
| CLK    | Clock        |
| WE     | Write Enable |
| ADDR   | Address      |
| DIN    | Data Input   |
| DOUT   | Data Output  |
Per port


                


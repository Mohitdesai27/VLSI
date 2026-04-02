# Overview


Simple parameterized N-bit ALU implemented in Verilog using gate-level modeling.
It performs basic arithmetic and logic operations controlled by a 6-bit func6 signal.


# Supported Operations

# 4-bit Parameterized ALU

| func6  | Operation |
| ------ | --------- |
| 000000 | ADD       |
| 000001 | SUB       |
| 000010 | AND       |
| 000011 | OR        |
| 000100 | XOR       |
| 000101 | NOT       |
| 000110 | INC       |
| 000111 | DEC       |

---

# Design

* Uses **Full Adder → Ripple Carry Adder**
* Subtraction implemented using **2’s complement**
* Logic operations implemented using basic gates
* Output selected using a **MUX (based on func6)**

---





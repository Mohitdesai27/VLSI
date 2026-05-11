# Problem

A mechanical switch produces bouncing pulses when toggled. We remove noise by requiring the input to be stable for N clock cycles before accepting it.

# FSM Design

| State   | Meaning                                   |
| ------- | ----------------------------------------- |
| S0 = 00 | Stable LOW (0)                            |
| S1 = 01 | Transition: LOW → HIGH (waiting debounce) |
| S2 = 11 | Stable HIGH (1)                           |
| S3 = 10 | Transition: HIGH → LOW (waiting debounce) |


# State Diagram

            SW=1, stable time done
    S0 (00) -----------------------> S2 (11)
      ^                               |
      | SW=0                         SW=0, stable time done
      |                               v
    S1 (01) <---------------------- S3 (10)
          SW unstable wait         SW unstable wait

# State Table

| Current | SW | DONE | Next |
| ------- | -- | ---- | ---- |
| S0 (00) | 0  | X    | S0   |
| S0 (00) | 1  | 0    | S1   |
| S1 (01) | 1  | 0    | S1   |
| S1 (01) | 1  | 1    | S2   |
| S2 (11) | 1  | X    | S2   |
| S2 (11) | 0  | 0    | S3   |
| S3 (10) | 0  | 0    | S3   |
| S3 (10) | 0  | 1    | S0   |


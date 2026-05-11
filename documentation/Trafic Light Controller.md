# Problem

A traffic light controller cycles through:

Green → Yellow → Red → Green

Each state stays active for a fixed number of clock cycles.

# States

| State | Meaning            |
| ----- | ------------------ |
| S0    | NS Green / EW Red  |
| S1    | NS Yellow / EW Red |
| S2    | NS Red / EW Green  |
| S3    | NS Red / EW Yellow |

# State Diagram

        +------------------+
        |                  v
     +------+     +------+     +------+     +------+
     | S0   | --> | S1   | --> | S2   | --> | S3   |
     | G/R  |     | Y/R  |     | R/G  |     | R/Y  |
     +------+     +------+     +------+     +------+
        ^                                      |
        +--------------------------------------+

# State Encoding

| State | Q1 Q0 |
| ----- | ----- |
| S0    | 00    |
| S1    | 01    |
| S2    | 10    |
| S3    | 11    |

# State Table

| Current | Counter done | Next |
| ------- | ------------ | ---- |
| S0 (00) | 1            | S1   |
| S1 (01) | 1            | S2   |
| S2 (10) | 1            | S3   |
| S3 (11) | 1            | S0   |


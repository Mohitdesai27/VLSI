# Types of Edge Detection
| Type                  | Detects        |
| --------------------- | -------------- |
| Rising Edge Detector  | 0 → 1          |
| Falling Edge Detector | 1 → 0          |
| Both Edge Detector    | Any transition |

# Basic Principle

Store previous value of signal:Qprev

Compare with current signal:X

# Rising Edge Detector
Detect: 0→1

| Previous | Current | Output |
| -------- | ------- | ------ |
| 0        | 1       | 1      |

Y=X ⋅ ~Qprev

              ┌─────┐
    X ------->│ DFF │----> Qprev
              └─────┘
                │
                ▼
    Y = X · Qprev̅
​​
# Falling Edge Detector
Detect: 1→0

Y= ~X ⋅ Qprev​

# Both Edge Detector
Detect: 0↔1

Y = X⊕Qprev​

| X | Qprev | Y |
| - | ----- | - |
| 0 | 0     | 0 |
| 0 | 1     | 1 |
| 1 | 0     | 1 |
| 1 | 1     | 0 |

              ┌─────┐
    X ------->│ DFF │----> Qprev
              └─────┘
                  │
                  ▼
    Y = X XOR Qprev

# Pattern Detection FSM

Pattern to detect:

\[
1011
\]

Two types:

1. Overlapping FSM
2. Non-Overlapping FSM

---

#  1. Overlapping Pattern Detector FSM

##  State Definitions

| State | Meaning |
|------|---------|
| S0 | Initial state |
| S1 | Detected `1` |
| S2 | Detected `10` |
| S3 | Detected `101` |
| S4 | Detected `1011` |

---

# State Transition Table (Overlapping)

| Present State | Input X | Next State | Output Z |
|---------------|---------|------------|----------|
| S0 | 0 | S0 | 0 |
| S0 | 1 | S1 | 0 |
| S1 | 0 | S2 | 0 |
| S1 | 1 | S1 | 0 |
| S2 | 0 | S0 | 0 |
| S2 | 1 | S3 | 0 |
| S3 | 0 | S2 | 0 |
| S3 | 1 | S4 | 1 |
| S4 | 0 | S2 | 0 |
| S4 | 1 | S1 | 0 |

---

# State Diagram (Overlapping)

```text
S0 --1--> S1 --0--> S2 --1--> S3 --1--> S4
^          |                    |
|          1                    0
|__________|____________________|

After detection:
S4 allows reuse of bits (overlap)
```

---

# State Encoding

| State | Q1 Q0 |
|------|-------|
| S0 | 00 |
| S1 | 01 |
| S2 | 10 |
| S3 | 11 |

---

# Flip-Flop Transition Table

| Q1 | Q0 | X | Q1⁺ | Q0⁺ | Z |
|----|----|---|-----|-----|---|
| 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 | 1 | 0 |
| 1 | 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 | 1 | 1 |

---

# K-Map Equations

## Equation for \( D_1 \)

\[
D_1 =
\overline{Q_1}Q_0\overline{X}
+
Q_1\overline{Q_0}X
+
Q_1Q_0\overline{X}
\]

---

## Equation for \( D_0 \)

\[
D_0 = X
\]

---

## Output Equation

\[
Z = Q_1 Q_0 X
\]

---

# 2. Non-Overlapping Pattern Detector FSM

After detecting the pattern, FSM returns to initial state.

---

# State Transition Table (Non-Overlapping)

| Present State | Input X | Next State | Output Z |
|---------------|---------|------------|----------|
| S0 | 0 | S0 | 0 |
| S0 | 1 | S1 | 0 |
| S1 | 0 | S2 | 0 |
| S1 | 1 | S1 | 0 |
| S2 | 0 | S0 | 0 |
| S2 | 1 | S3 | 0 |
| S3 | 0 | S2 | 0 |
| S3 | 1 | S0 | 1 |

---

# State Diagram (Non-Overlapping)

```text
S0 --1--> S1 --0--> S2 --1--> S3 --1/Z=1--> S0
```

---

# Flip-Flop Transition Table

| Q1 | Q0 | X | Q1⁺ | Q0⁺ | Z |
|----|----|---|-----|-----|---|
| 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 | 1 | 0 |
| 1 | 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 | 0 | 1 |

---

# K-Map Equations

## Equation for \( D_1 \)

\[
D_1 =
\overline{Q_1}Q_0\overline{X}
+
Q_1\overline{Q_0}X
+
Q_1Q_0\overline{X}
\]

---

## Equation for \( D_0 \)

\[
D_0 =
\overline{Q_1}\,\overline{Q_0}X
+
\overline{Q_1}Q_0X
+
Q_1\overline{Q_0}X
\]

Simplified:

\[
D_0 = X(\overline{Q_1} + \overline{Q_0})
\]

---

## Output Equation

\[
Z = Q_1 Q_0 X
\]

---

# Key Difference

| Type | After Detection |
|------|----------------|
| Overlapping | Reuses bits |
| Non-Overlapping | Returns to initial state |

---

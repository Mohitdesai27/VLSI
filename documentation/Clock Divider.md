# Clock Divider

A clock divider reduces the frequency of an input clock by an integer factor N.

# Working Principle

Counter increments every clock cycle.

When:

counter=N−1

then:

counter resets
output clock toggles

# State Diagram

| State | Output      |
| ----- | ----------- |
| S0    | clk_out = 0 |
| S1    | clk_out = 1 |

             counter=N-1
          +----------------+
          |                v
       +------+        +------+
       | S0   | -----> | S1   |
       |  0   | <----- |  1   |
       +------+        +------+
          ^                |
          +----------------+
             counter=N-1

# Counter Equation

Counter increment:

COUNTnext=COUNT+1

Reset condition:

COUNT=N−1

Clock toggle:

CLKout,next=~CLKout
	​

	​






             

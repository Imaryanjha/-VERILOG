# 🧠 Synchronous Reset 

## 📘 Overview
A **synchronous reset** is a type of reset signal that is **sampled only on the active clock edge**.  
It means the flip-flop output will be reset **only when the clock edge occurs**, not immediately when the reset signal becomes active.

---

## ⚙️ Working Principle

In a synchronous reset system:
- The reset signal (`rst`) is applied **along with the clock (`clk`)**.
- The flip-flop checks the reset condition **only at the active clock edge** (rising or falling).
- Until the next clock edge, changes on `rst` have **no immediate effect**.

### 🧩 Example:
```systemverilog
always_ff @(posedge clk) begin
  if (rst)
    q <= 1'b0;     // Reset output on clock edge
  else
    q <= d;         // Normal operation
end
```
### 🕒 Timing Requirements

Because synchronous reset acts like any other input to a flip-flop,
it must obey setup and hold time constraints with respect to the clock.


| Parameter                    | Meaning                                              |
| ---------------------------- | ---------------------------------------------------- |
| **Setup time (t_setup_rst)** | Reset signal must be stable before the clock edge    |
| **Hold time (t_hold_rst)**   | Reset signal must remain stable after the clock edge |


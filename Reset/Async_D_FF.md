# ⚙️ Asynchronous D Flip-Flop with Active-Low Reset (`resetn`)

## 🧩 Introduction

A **D Flip-Flop (Data or Delay Flip-Flop)** is a **sequential logic element** that captures the input `D` on a specific **clock edge** and holds it at the output `Q` until the next clock event.

When combined with an **asynchronous active-low reset (`resetn`)**, the flip-flop can be **immediately forced to a known state (usually 0)**, regardless of the clock signal.  
This makes it ideal for **initialization**, **fault recovery**, and **power-up conditions** in FPGA and digital circuits.

---

## 🔄 Behavioral Description

The **asynchronous reset** works **independently of the clock**:

- When `resetn = 0` → The output `Q` is immediately forced to `0`.  
- When `resetn = 1` → The flip-flop behaves normally, capturing `D` on the active clock edge (posedge).

---
## RTL_Schematic
<img width="1714" height="1073" alt="image" src="https://github.com/user-attachments/assets/5d54d042-d9c1-409b-a4b7-bd0d3f549687" />

## 🧾 Timing Diagram
<img width="2194" height="553" alt="image" src="https://github.com/user-attachments/assets/a480f416-eda0-4ec0-b3d7-8e32db222fa2" />

## Summary Table


| Reset Type              | Sensitivity                        | Active Level | Behavior                           |
| ----------------------- | ---------------------------------- | ------------ | ---------------------------------- |
| Active-high async reset | `@(posedge clk or posedge reset)`  | `1`          | Output clears when reset = 1       |
| Active-low async reset  | `@(posedge clk or negedge resetn)` | `0`          | Output clears when resetn = 0      |

## Comparison Table :- posedge reset vs negedge resetn

| Feature               | Active-High (`posedge reset`) | Active-Low (`negedge resetn`) |
| --------------------- | ----------------------------- | ----------------------------- |
| Trigger condition     | Rising edge                   | Falling edge                  |
| Logic level for reset | `1`                           | `0`                           |
| Common usage          | Simple logic / small modules  | FPGA & ASIC systems           |
| Noise immunity        | Slightly lower                | Better (default idle = `1`)   |
| Deassertion handling  | Must be synchronized          | Must be synchronized          |
| Power-up behavior     | Needs pull-down               | Default high (safe)           |


## When To Choose Which 

| Scenario                            | Recommended Reset Type                               |
| ----------------------------------- | ---------------------------------------------------- |
| FPGA designs (e.g., Xilinx, Intel)  | **Active-Low Asynchronous Reset (`negedge resetn`)** |
| ASIC design flows                   | **Active-Low** (industry standard)                   |
| Small Verilog test circuits         | **Active-High** (simpler for simulation)             |
| Low-power systems                   | **Asynchronous Reset** — quick wake-up from reset    |
| High-frequency, synchronous designs | **Synchronous Reset** — predictable timing behavior  |

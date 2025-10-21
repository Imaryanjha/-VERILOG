# ⚙️ Reset Selection 

## 🧩 Introduction
In FPGA and ASIC systems, the **reset signal** ensures that all registers and sequential logic start in a **known, stable state** after power-up or during fault recovery.  
Choosing between **Asynchronous** and **Synchronous** resets affects your design’s **latency**, **power efficiency**, **timing closure**, and **reliability**.

---

## 🔄 Types of Reset

| Type | Triggered By | Behavior |
|------|---------------|-----------|
| **Asynchronous Reset** | Independent of clock | Flip-flop resets **immediately**, regardless of clock |
| **Synchronous Reset** | On active clock edge | Reset occurs **synchronously** with the next clock edge |

---

## ⚙️ Key Factors to Decide

### 🕒 1. Clock Availability
- If the **clock is not yet stable** (e.g., during power-up), use **Asynchronous Reset**.  
- If the clock is **always running and reliable**, a **Synchronous Reset** works best.

---

### ⚡ 2. Speed of Response (Latency)
- **Asynchronous Reset:** Immediate effect → perfect for fault recovery or emergency stop.  
- **Synchronous Reset:** One clock cycle delay → better control.

---

### 🧠 3. Reset Release Timing
- Asynchronous resets **must be synchronized** on release to avoid metastability.  
- Synchronous resets are inherently safe during de-assertion.

---

### 🧩 4. FPGA Architecture Compatibility
- Most FPGAs provide **built-in async clear pins**, making asynchronous resets **resource-efficient**.  
- Synchronous resets may require **extra LUT logic** but are **more portable** to ASICs.

---

### 🔋 5. Power Management
- Async resets can reinitialize logic blocks even when clocks are **gated or disabled**, saving power.  
- Sync resets require the clock to be active, slightly increasing power draw.

---

### ⏱️ 6. Timing Closure
- Async resets add complexity to static timing analysis (not clock-aligned).  
- Sync resets simplify timing closure because they behave like normal data paths.

---

## 🧭 Design Decision Guide

| **Criteria** | **Choose Asynchronous Reset** | **Choose Synchronous Reset** |
|---------------|-------------------------------|-------------------------------|
| Clock not stable at power-up | ✅ Yes | ❌ No |
| Need immediate reset response | ✅ Yes | ❌ No |
| Power-saving during clock gating | ✅ Yes | ❌ No |
| Easier timing closure | ❌ No | ✅ Yes |
| Reset release synchronization handled | ✅ Yes | ❌ No |
| Portability (FPGA ↔ ASIC) | ⚠️ Moderate | ✅ Better |
| Low resource usage | ✅ Yes | ❌ No |
| Predictable timing | ❌ No | ✅ Yes |

---

## ⚡ Real-World Scenarios

| **Use Case** | **Recommended Reset** | **Reason** |
|---------------|----------------------|-------------|
| FPGA power-on initialization | Asynchronous | Clock may not be active yet |
| Emergency STOP or Fault Condition | Asynchronous | Requires immediate reset |
| Processor or FSM logic | Synchronous | Predictable behavior |
| Multi-clock systems | Synchronous (per domain) | Avoids cross-domain issues |
| Low-power subsystems | Asynchronous | Reset without clock toggling |

---

## 🧠 Pro Design Tips

1. Use **Active-Low Resets** (`resetn`) — better hardware compatibility.  
2. Always **synchronize reset deassertion** using two flip-flops.  
3. Prefer **local resets per module** instead of one large global reset.  
4. For hybrid strategies — use **asynchronous global reset** but **convert it locally to synchronous** per clock domain.

---

## 🧰 Typical Hybrid Reset Implementation

```verilog
// Global asynchronous reset, locally synchronized
always @(posedge clk or negedge global_resetn) begin
  if (!global_resetn)
    local_resetn <= 1'b0;
  else
    local_resetn <= 1'b1;
end

// Use local_resetn as synchronous reset in modules
always @(posedge clk) begin
  if (!local_resetn)
    state <= IDLE;
  else
    state <= next_state;
end

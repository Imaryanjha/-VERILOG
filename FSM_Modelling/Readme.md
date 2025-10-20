# 🧠 Finite State Machines (FSM) in Digital Design

A **Finite State Machine (FSM)** is a computational model used to design **sequential logic circuits**.  
It consists of a finite number of **states**, **inputs**, and **outputs**, and transitions between states are determined by the current state and input signals.

FSMs are fundamental in **digital systems**, **control logic**, **protocol design**, and **sequence detectors**.

---

## ⚙️ Components of FSM

| Component | Description |
|------------|--------------|
| **States** | Represent different conditions or situations of the system. |
| **Inputs** | External signals that influence state transitions. |
| **Outputs** | Signals produced by the FSM (depend on current state and/or input). |
| **State Transition Logic** | Defines how the FSM moves from one state to another. |

---

## 🧩 Types of FSM

### 1. **Mealy Machine**
- **Output depends on both current state and input.**
- Produces **faster response**, as output can change immediately with input.
- Requires **fewer states** compared to Moore FSM.




---

### 2. **Moore Machine**
- **Output depends only on the current state.**
- Output changes **only on state transitions**.
- Often requires **extra states** for same logic as Mealy FSM.

<img width="588" height="352" alt="image" src="https://github.com/user-attachments/assets/b1aa6c17-a85d-4533-9bd4-02a733807979" />



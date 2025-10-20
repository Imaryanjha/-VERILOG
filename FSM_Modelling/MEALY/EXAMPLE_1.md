# ⚙️ 1011 Sequence Detector (Mealy Machine - Non-Overlapping)


---

## 🧩 FSM Description

- **Type:** Mealy Machine  
- **Sequence to Detect:** `1011`  
- **Overlapping:** ❌ No  
- **Inputs:** `x` (serial input), `clk`, `reset`  
- **Output:** `y = 1` when `1011` is detected  
- **States:** S0, S1, S2, S3  

---

## 🧮 State Transition Table

| **Current State** | **Input (x)** | **Next State** | **Output (y)** |
|--------------------|---------------|----------------|----------------|
| **S0** | 0 | S0 | 0 |
| **S0** | 1 | S1 | 0 |
| **S1** | 0 | S2 | 0 |
| **S1** | 1 | S1 | 0 |
| **S2** | 0 | S0 | 0 |
| **S2** | 1 | S3 | 0 |
| **S3** | 0 | S2 | 0 |
| **S3** | 1 | S0 | 1 |

---

## 🧠 State Diagram

<img width="269" height="508" alt="image" src="https://github.com/user-attachments/assets/cfd38c4d-6661-4b9b-a2da-045fb9432702" />

## RTL CODE

```
module FSM_M_SD(


  input clk,
  input reset,
  input x,
  output reg z
);

  // State encoding
  parameter S0 = 2'b00,  // No bits matched
            S1 = 2'b01,  // 1 matched
            S2 = 2'b10,  // 10 matched
            S3 = 2'b11;  // 101 matched

  reg [1:0] state, next_state;
always @(posedge clk or posedge reset)
begin
    if(reset)begin
    state <= S0;
    end
    
    else begin
    state <= next_state;
    end

end

always @ (state or x)
begin 
z = 0; // default ouptput
case (state)
S0 : begin
if(x)
next_state = S1;
else 
next_state = S0;
end

S1 : begin
if(x)
next_state = S1;
else 
next_state = S2;
end

S2 : begin
if(x)
next_state = S3;
else 
next_state = S0;
end

 S3: begin
        if (x) begin
          next_state = S0;// // output = 1 when "1010" detected
          z = 1;
        end else begin
          next_state = S2;
          z = 0;  
        end
      end
endcase
end 

endmodule
  
```
## Testbench
```
module tb_FSM_SD;


  reg clk, reset, x;
  wire z;
  integer i; // <--- Verilog integer

  FSM_M_SD uut (.clk(clk), .reset(reset), .x(x), .z(z));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    reset = 1;
    x = 0;
    #10 reset = 0;

    $display("Time\tClk\tX\tZ");

    for (i = 0; i < 20; i = i + 1) begin
      @(posedge clk);
      x = $random % 2; // Random 0/1 input
      $display("%0t\t%b\t%b\t%b", $time, clk, x, z);
    end

    #20 $finish;
  end

endmodule
   
```
## RTL Schematic
<img width="1732" height="1036" alt="FSM_MEALY_SD_1011" src="https://github.com/user-attachments/assets/f233af90-e118-4e84-8240-0dad0e62b766" />

## Waveform
<img width="1728" height="683" alt="FSM_MEALY_SD_1011_WAVE" src="https://github.com/user-attachments/assets/ead2bbd7-bcd0-4f2e-b020-17bb5183cca7" />


✅ Two **non-overlapping** detections of the sequence `1011`.

---

## 💡 Applications

- Serial bit-sequence detection  
- Digital communication monitoring  
- Protocol frame detection  
- Control logic triggering  
- Pattern-based digital automation  

---

> 🧭 *The Mealy non-overlapping sequence detector ensures reliable and precise detection, ideal for digital control and serial data systems.*

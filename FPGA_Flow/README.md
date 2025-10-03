✨[1] Specification  

      ↓
      
✨[2] RTL Coding (Verilog/VHDL)
      ↓
Languages: Verilog / VHDL / SystemVerilog

Activities:

Write RTL (Register Transfer Level) code for logic, FSMs, counters, etc.

Modularize your design (use separate files/modules for clarity)

Optionally use IP cores (e.g., multipliers, FIFOs, UART)

Tools: Vivado, Quartus, ISE, ModelSim (editor + simulator)


✨[3] Functional Simulation (Testbench)

Goal: Verify that your HDL behaves correctly
Activities:

Write testbenches

Simulate the design with dummy inputs to check expected outputs

Check for logical correctness before synthesis

Tools: ModelSim, XSIM (Vivado), GHDL, GTKWave (for waveform)

✅ Note: This is pre-synthesis simulation (RTL level)



      ↓

      
✨[4] Synthesis (Netlist)

Goal: Convert RTL code into a netlist (logic gates + connections)
Activities:

Tool maps your code to actual logic resources in the FPGA (LUTs, FFs)

Checks syntax and performs logic optimization

Generates a synthesized netlist

Tools: Vivado Synthesis / Quartus Synthesis

      ↓
✨[5] Implementation (Place & Route)

Goal: Physically map logic onto FPGA fabric
Activities:

Placement: Place logic blocks (LUTs, FFs) on the chip

Routing: Connect signals through the FPGA interconnect

Timing Analysis: Check if timing constraints are met (Setup/Hold)

Tools: Vivado Implementation, Quartus Fitter


      ↓
✨[6] Bitstream Generation

Goal: Generate the .bit or .bin file to configure the FPGA
Activities:

Combine netlist + constraints into a single bitstream

Bitstream defines how the FPGA should be configured

Output: design.bit, design.bin, or design.jed file


      ↓
✨[7] FPGA Programming

Goal: Load the bitstream into the FPGA
Methods:

JTAG (via USB programmer or onboard)

Boot from Flash (for Zynq or persistent FPGA configuration)

Tools:

Vivado Hardware Manager

Quartus Programmer

iMPACT (for older Spartan-6 devices)

      ↓
✨[8] On-Board Testing & Debugging
Goal: Check if your FPGA behaves as expected in the real world
Activities:

Probe signals using ILA (Integrated Logic Analyzer in Vivado)

Check I/Os using LEDs, UART, GPIO pins

Compare simulated results with real hardware

Tools:

Vivado Logic Analyzer

SignalTap (Intel)

Chipscope (older Xilinx tool)

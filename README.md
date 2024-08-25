# classic-fpga

basic simulations of digital electronics using vhdl


# Table of contents
- [classic-fpga](#classic-fpga)
- [Table of contents](#table-of-contents)
  - [Files and folders](#files-and-folders)
  - [Basic vhdl tutorial with ghdl](#basic-vhdl-tutorial-with-ghdl)
  - [Each design should be composed of two .vhdl files initially:](#each-design-should-be-composed-of-two-vhdl-files-initially)
  - [Casual convention:](#casual-convention)
    - [Development process:](#development-process)


## Files and folders
 - `counters`
   - ring_counter.vhdl - a simple ring counter -- a counter that shifts a single bit through a series of flip-flops
   - counter.vhdl - a simple counter
 - `encoders`
   - `grey.vhdl` - a simple grey encoder
   - `one_hot.vhdl` - a simple one hot encoder
 - `machines`
   - `compar_fsm.vhdl` - a simple finite state machine that compares two numbers
   - `seq_det.vhdl` - a simple sequence detector
   - `code_det.vhdl` - a simple code detector
 - `memory`
   - `dram.vhdl` 
   - `hist.vhdl` 
   - `lifovhdl`  
 - `multiplexers_registers`
    - `barrel.vhdl` - a simple barrel shifter
    - `piso.vhdl` - a parallel-in serial-out shift register
    - `sipo.vhdl` - a serial-in parallel-out shift register
    - `reg_adder.vhdl` - a simple register adder

## Basic vhdl tutorial with ghdl

Install ghdl - open source vhdl simulation tool (works both on Linux and Windows) using link below or try fetching it via your system installer: http://ghdl.free.fr/  
and gtkwave to view simulation runs: http://gtkwave.sourceforge.net/  
Alternatively, you can use any other waveform viewer, for instance: http://raczben.pythonanywhere.com/#


## Each design should be composed of two .vhdl files initially:
1. Your main design declaration
2. Your testbench for design (i.e. the testing setup, allows to view how signals are processed by main design)

## Casual convention:
```sh
component.vhdl - main design  
component_tb.vhdl - testbench  
```

### Development process:

1. Write your design e.g. in `component.vhdl`
2. Let ghdl check for syntax:  
    use : 
    ```sh
    (~) ghdl -a component.vhdl
    ```

3. Build .o by typing  
    ```sh
    (~) ghdl -e component
    ```
4. Write your testbench  
    e.g. `component_tb.vhdl`
5. Check testbench for syntax  
    ```sh
    (~) ghdl -a component_tb.vhdl
    ```
6. Create .o file  
   ```sh
    (~) ghdl -e component_tb
    ```
7. Run your testbench for a limited time!, and save simulation output (wavefile .vcd)  
    e.g. ~ghdl -r component_tb --stop-time=120ns --vcd=component.vcd
8.  View the results
    ```sh
    (~)  gtkwave component.vcd  
    ```
    or upload to online viewer: `http://raczben.pythonanywhere.com/#`.

Remeber to drag signals into viewing pane and adjust the time scale

## To automate the debugging process, use Makefile included in the directory. 

Just add the new .vhdl files and objects to corresponding fields using "\" and run analysis with:  
```sh
(~) make anal name=component_name
```
to clean the .o, .cf, work and other redundant files (except testbench and design file) run:  
```sh   
(~) make clean  
```

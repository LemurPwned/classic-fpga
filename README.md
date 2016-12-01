# classic-fpga
basic simulations of digital electronics using vhdl

## Basic vhdl tutorial with ghdl
Install ghdl - open source vhdl simulation tool (works both on Linux and Windows) using link below <br />
or try fetching it via your system installer : <br />
http://ghdl.free.fr/

and gtkwave to view simulation runs: <br />
http://gtkwave.sourceforge.net/

## Each design should be composed of two .vhdl files initially:
1. Your main design declaration
2. Your testbench for design (i.e. the testing setup, allows to view how signals are processed by main design)

## Casual convention:
component.vhdl - main design <br />
component_tb.vhdl - testbench <br />

## The development process should look like this
1. Write your design e.g. in component.vhdl
2. Let ghdl check for syntax: <br />
    use : ~ghdl -a component.vhdl
3. Build .o by typing <br />
    ~ghdl -e component     
4. Write your testbench <br />
    e.g. component_tb.vhdl
5. Check testbench for syntax <br />
    ~ghdl -a component_tb.vhdl
6. Create .o file <br />
    ~ghdl -e component_tb
7. Run your testbench for a limited time!, and save simulation output (wavefile .vcd) <br />
    e.g. ~ghdl -r component_tb --stop-time=120ns --vcd=component.vcd
8. View the results <br />
    gtkwave component.vcd <br />
Remeber to drag signals into viewing pane and adjust the time scale

## To automate the debugging process, use Makefile included in the directory. <br />
Just add the new .vhdl files and objects to corresponding fields using "\" and run analysis with: <br />
~make anal <br />
to clean the .o, .cf, work and other redundant files (except testbench and design file) run: <br />
~make clean <br />
    
    #### Have fun!
  

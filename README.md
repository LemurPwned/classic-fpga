# classic-fpga
basic simulations of digital electronics using vhdl

## Basic vhdl tutorial with ghdl
Install ghdl - open source vhdl simulation tool (works both on Linux and Windows) using link below 
or try fetching it via your system installer :
http://ghdl.free.fr/

and gtkwave to view simulation runs:
http://gtkwave.sourceforge.net/

## Each design should be composed of two .vhdl files initially:
1. Your main design declaration
2. Your testbench for design (i.e. the testing setup, allows to view how signals are processed by main design)

## Casual convention:
component.vhdl - main design
component_tb.vhdl - testbench

## The development process should look like this
A) Write your design e.g. in component.vhdl
B) Let ghdl check for syntax:
    use : ~ghdl -a component.vhdl
    If no errors occur, proceed
C) Build .o by typing
    ~ghdl -e component
    note that there is no .vhdl extension here. Again, if there are no errors, proceed.
D) Write your testbench
    e.g. component_tb.vhdl
E) Check testbench for syntax
    ~ghdl -a component_tb.vhdl
     If no errors occur, proceed
F) Create .o file
    ~ghdl -e component_tb
    In case everything is O.K., go on
G) Run your testbench for a limited time!, and save simulation outpu (wavefile .vcd)
    e.g. ~ghdl -r component_tb --stop-time=120ns --vcd=component.vcd
H) View the results
    gtkwave component.vcd 
    Remeber to drag signals into viewing pane and adjust the time scale
    
    Have fun!
  

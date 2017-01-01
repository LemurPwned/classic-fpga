1=hist
GHDL=ghdl
RUNTIME=280ns


anal:
	$(GHDL) -a --ieee=synopsys $1.vhdl
	$(GHDL) -e --ieee=synopsys $1
	$(GHDL) -a --ieee=synopsys $1_tb.vhdl
	$(GHDL) -e --ieee=synopsys $1_tb
	$(GHDL) -r $1_tb --stop-time=$(RUNTIME) --vcd=wave.vcd

clean:
	echo "Cleaning up the mess..."
	rm -f *.o *_tb work*.cf e*.lst *.vcd
	rm -f $1 $1_tb

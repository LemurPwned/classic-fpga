GHDL=ghdl
GHDL_COMP=$(name).vhdl
GHDL_TB=$(name)_tb.vhdl
GHDL_COMP_E=$(name)
GHDL_TB_E=$(name)_tb
RUNTIME=100ns


anal:
	$(GHDL) -a $(GHDL_COMP)
	$(GHDL) -e $(GHDL_COMP_E)
	$(GHDL) -a $(GHDL_TB)
	$(GHDL) -e $(GHDL_TB_E)
	$(GHDL) -r $(GHDL_TB_E) --stop-time=$(RUNTIME) --vcd=$(name)_out.vcd

clean:
	echo "Cleaning up the mess..."
	rm -f *.o *_tb work*.cf e*.lst *.vcd
	rm -f $(GHDL_COMP_E) $(GHDL_TB_E)

GHDL=ghdl
GHDL_COMP=\
	abs_1.vhdl
GHDL_TB=\
	abs_1_tb.vhdl
GHDL_COMP_E=\
	abs_1
GHDL_TB_E=\
	abs_1_tb
RUNTIME=100ns


anal:
	$(GHDL) -a $(GHDL_COMP)
	$(GHDL) -e $(GHDL_COMP_E)
	$(GHDL) -a $(GHDL_TB)
	$(GHDL) -e $(GHDL_TB_E)
	$(GHDL) -r $(GHDL_TB_E) --stop-time=$(RUNTIME) --vcd=abs_1.vcd

clean:
	echo "Cleaning up the mess..."
	rm -f *.o *_tb work*.cf e*.lst *.vcd

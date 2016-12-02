GHDL=ghdl
GHDL_COMP=\
	grey.vhdl
GHDL_TB=\
	grey_tb.vhdl
GHDL_COMP_E=\
	grey
GHDL_TB_E=\
	grey_tb
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
	rm -f $(GHDL_COMP_E) $(GHDL_TB_E)

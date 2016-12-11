GHDL=ghdl
GHDL_COMP=\
	compar_fsm.vhdl
GHDL_TB=\
	compar_fsm_tb.vhdl
GHDL_COMP_E=\
	compar_fsm
GHDL_TB_E=\
	compar_fsm_tb
RUNTIME=180ns


anal:
	$(GHDL) -a --ieee=synopsys $(GHDL_COMP) 
	$(GHDL) -e --ieee=synopsys $(GHDL_COMP_E)
	$(GHDL) -a --ieee=synopsys $(GHDL_TB)
	$(GHDL) -e --ieee=synopsys $(GHDL_TB_E)
	$(GHDL) -r $(GHDL_TB_E) --stop-time=$(RUNTIME) --vcd=wave.vcd

clean:
	echo "Cleaning up the mess..."
	rm -f *.o *_tb work*.cf e*.lst *.vcd
	rm -f $(GHDL_COMP_E) $(GHDL_TB_E)

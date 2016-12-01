GHDL=ghdl
GHDLFLAGS=
RUNTIME=100ns
MODULES=\
	dff.o\
	counter.o\


test: $(MODULES)
	./dff_tb --stop-time=$(RUNTIME) --vcd=dff.vcd
	./counter_tb --stop-time=$(RUNTIME) --vcd=counter.vcd

%: %.o
	$(GHDL) -e $(GHDLFLAGS) $@
%.o: %.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<

clean:
	echo "Cleaning up the mess..."
	rm -f *.o *_tb work*.cf e*.lst *.vcd

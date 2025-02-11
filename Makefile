cacheline_tb:
	iverilog -o  cacheline_tb cacheline_consts.vh cacheline_tb.v cacheline.v

cacheline_nru.btor:
	yosys -p "read_verilog cacheline_nru.v; hierarchy -top miter; hierarchy -check; proc; opt; memory; flatten; clk2fflogic; write_btor cachline_nru.btor"

cacheline_plru.btor:
	yosys -p "read_verilog cacheline_plru.v; hierarchy -top miter; hierarchy -check; proc; opt; memory; flatten; clk2fflogic; write_btor cachline_plru.btor"

cacheline_nru_miter.btor:
	yosys -p "read_verilog cacheline_nru.v; miter -equiv -make_assert cacheline cacheline top; opt; hierarchy -top top; hierarchy -check; proc; opt; memory; flatten; clk2fflogic; write_btor cacheline_nru_miter.btor"

cacheline_plru_miter.btor:
	yosys -p "read_verilog cacheline_plru.v; miter -equiv cacheline cacheline top; opt; hierarchy -top top; hierarchy -check; proc; opt; memory; flatten; clk2fflogic; write_btor cacheline_plru_miter.btor"

clean:
	rm -rf dist_taskBMC12_dist_cacheline_plru
	rm -rf *.log
	rm -rf *.btor
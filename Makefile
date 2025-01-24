cacheline_tb:
	iverilog -o  cacheline_tb cacheline_consts.vh cacheline_tb.v cacheline.v

clean:
	rm -rf dist_taskBMC12_dist_cacheline_plru
	rm -rf *.log
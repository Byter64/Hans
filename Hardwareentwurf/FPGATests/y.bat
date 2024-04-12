yosys -p "read_verilog ../topmodul.v; synth_ecp5 -json ausgabe.json;"
nextpnr-ecp5 --85k --json Ausgabe.json --lpf ulx3s_v20.lpf --textcfg ulx3s_out.config
ecppack ulx3s_out.config ulx3s.bit
fujprog ulx3s.bit
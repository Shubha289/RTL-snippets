module pos_edge_det_tb;
  reg sig;
  reg clk;
  wire pe;
  parameter CYCLE = 10;
  pos_edge_det ped0(.sig(sig),.clk(clk),.pe(pe));
  
  //clock generation
  always begin
    #(CYCLE/2) clk = 1'b0;
    #(CYCLE/2) clk = 1'b1;
  end
  
  initial 
    $monitor("at at time = %0t sig=%b",$time,sig);
  initial begin
    sig <=0;;
    #15 sig <=1;
    #20 sig <=0;
    #15 sig <=1;
	#10 sig <=0;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
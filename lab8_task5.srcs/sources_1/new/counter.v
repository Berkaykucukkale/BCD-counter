`timescale 1ns / 1ps


//clock dividor
module counter(
    input clock,reset,
    output [1:0]divided_clock,
    output numnum

    );
    reg [26:0]OUT;
    always@ (posedge(clock) , posedge(reset))begin
    
        if(reset) OUT<=0;
        else OUT <= OUT+1;
    end
    
    assign divided_clock[0] = OUT[22];
    assign divided_clock[1] = OUT[23];
    assign numnum = OUT[23];
endmodule

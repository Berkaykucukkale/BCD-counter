`timescale 1ns / 1ps


module mux(
    
    input [15:0]namnam,
    input [1:0]select,
    output reg [3:0]exit
    );
    
    always@ (*)begin
    
        case(select)
        
            2'b00 : exit <= namnam[3:0];
            2'b01 : exit <= namnam[7:4];
            2'b10 : exit <= namnam[11:8];
            2'b11 : exit <= namnam[15:12];
            default : exit <= 4'b0000;
        endcase
    end
    

endmodule

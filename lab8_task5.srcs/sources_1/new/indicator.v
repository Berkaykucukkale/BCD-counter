`timescale 1ns / 1ps

//seven segment
module indicator(

    input [1:0]decoder_2_4,
    input [3:0]decoder_4_16,
    output reg [6:0]segments,
    output reg [3:0]katots
    );
    
    
    
        always@ (*)begin
    
        case(decoder_2_4)
        
            2'b00 : katots <= 4'b1110;
            2'b01 : katots <= 4'b1101;
            2'b10 : katots <= 4'b1011;
            2'b11 : katots <= 4'b0111;
            default : katots <= 4'b0000;
        endcase
    end
    
    always@ (decoder_4_16)begin
    
        case(decoder_4_16)
        
                0:   segments = 7'b0000001;
                1:   segments = 7'b1001111;
                2:   segments = 7'b0010010;
                3:   segments = 7'b0000110;
                4:   segments = 7'b1001100;
                5:   segments = 7'b0100100;
                6:   segments = 7'b0100000;
                7:   segments = 7'b0001111;
                8:   segments = 7'b0000000;
                9:   segments = 7'b0000100;
                default: segments = 7'b0000001;  
        endcase
    end
endmodule






















































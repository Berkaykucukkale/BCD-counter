`timescale 1ns / 1ps

//BCD counter
module BCD(
    input controlcounter,
    output reg [15:0] number
    );

always @(posedge(controlcounter)) begin


        if (number[3:0] == 9) begin
            number[3:0] <= 0;

            if (number[7:4] == 9) begin
                number[7:4] <= 0;

                if (number[11:8] == 9) begin
                    number[11:8] <= 0;

                    if (number[15:12] == 9)
                        number[15:12] <= 0;
                    else
                        number[15:12] <= number[15:12] + 1; 

                end else begin
                    number[11:8] <= number[11:8] + 1;
                end

            end else begin
                number[7:4] <= number[7:4] + 1;
            end

        end else begin
            number[3:0] <= number[3:0] + 1;
        end
    end

endmodule

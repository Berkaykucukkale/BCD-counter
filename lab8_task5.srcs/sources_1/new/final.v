`timescale 1ns / 1ps


module final(

    input clock100,resetpin,resetpincounter,
    output [6:0]numbers,
    output [3:0]segmentation
    );
    
    wire [1:0]selection_mux_and_segment;
    wire selection_counter;
    wire [15:0]final_num;
    wire [3:0]input_4_16_decoder;
    
    counter clock_dividor(
        
        .clock(clock100),
        .reset(resetpin),
        .divided_clock(selection_mux_and_segment),
        .numnum(selection_counter)
    );
    
    BCD counter(
        .controlcounter(selection_counter),
        .number(final_num)
    );
    
    mux selection(
    
        .namnam(final_num),
        .select(selection_mux_and_segmnet),
        .exit(input_4_16_decoder)        
    );
    
    indicator seg(
    
        .decoder_2_4(selection_mux_and_segment),
        .decoder_4_16(input_4_16_decoder),
        .segments(numbers),
        .katots(segmentation)
    );
endmodule




















`timescale 1ns / 1ps
module music_sheet_mario(index, note_count, period_counts, duration_ticks);
// RECOMMENDED TEMPO: 105 BPM (Quarter Note = 571ms)
// Base Tick Calculation: (60,000ms) / (120 BPM * 4) = 142.86ms per 16th tick
input [9:0] index;
output [9:0] note_count;
output reg [19:0] period_counts;
output reg [4:0] duration_ticks;

localparam SIXTEENTH = 5'd1, EIGHTH = 5'd2, DOTTED_EIGHTH = 5'd3,
           QUARTER = 5'd4, DOTTED_QUARTER = 5'd6, HALF = 5'd8,
           DOTTED_HALF = 5'd12, WHOLE = 5'd16;

localparam CLK_FREQ_HZ = 100_000_000;
localparam [19:0]  G2  = CLK_FREQ_HZ / 98.00,  C3  = CLK_FREQ_HZ / 130.81,
                   F3  = CLK_FREQ_HZ / 174.61, G3  = CLK_FREQ_HZ / 196.00,
                   B3  = CLK_FREQ_HZ / 246.94, C4  = CLK_FREQ_HZ / 261.63,
                   E4  = CLK_FREQ_HZ / 329.63, G4  = CLK_FREQ_HZ / 392.00,
                   Gs4 = CLK_FREQ_HZ / 415.30, A4  = CLK_FREQ_HZ / 440.00,
                   As4 = CLK_FREQ_HZ / 466.16, B4  = CLK_FREQ_HZ / 493.88,
                   C5  = CLK_FREQ_HZ / 523.25, D5  = CLK_FREQ_HZ / 587.33,
                   Ds5 = CLK_FREQ_HZ / 622.25, E5  = CLK_FREQ_HZ / 659.26,
                   F5  = CLK_FREQ_HZ / 698.46, Fs5 = CLK_FREQ_HZ / 739.99,
                   G5  = CLK_FREQ_HZ / 783.99, A5  = CLK_FREQ_HZ / 880.00,
                   C6  = CLK_FREQ_HZ / 1046.50,
                   SP  = 1;

assign note_count = 10'd68; /* total number of notes */

always @(*) begin
    case (index)
        10'd0:   begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd1:   begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd2:   begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd3:   begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd4:   begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd5:   begin period_counts = C5;  duration_ticks = SIXTEENTH; end 
        10'd6:   begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd7:   begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd8:   begin period_counts = G5;  duration_ticks = SIXTEENTH; end 
        10'd9:   begin period_counts = SP;  duration_ticks = DOTTED_EIGHTH; end 
        10'd10:  begin period_counts = G4;  duration_ticks = SIXTEENTH; end
        10'd11:  begin period_counts = SP;  duration_ticks = DOTTED_EIGHTH; end
        10'd12:  begin period_counts = C5;  duration_ticks = SIXTEENTH; end
        10'd13:  begin period_counts = SP;  duration_ticks = EIGHTH; end
        10'd14:  begin period_counts = G4;  duration_ticks = SIXTEENTH; end
        10'd15:  begin period_counts = SP;  duration_ticks = EIGHTH; end
        10'd16:  begin period_counts = E4;  duration_ticks = SIXTEENTH; end
        10'd17:  begin period_counts = SP;  duration_ticks = EIGHTH; end
        10'd18:  begin period_counts = A4;  duration_ticks = SIXTEENTH; end
        10'd19:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end
        10'd20:  begin period_counts = B4;  duration_ticks = SIXTEENTH; end
        10'd21:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end
        10'd22:  begin period_counts = As4; duration_ticks = SIXTEENTH; end
        10'd23:  begin period_counts = A4;  duration_ticks = SIXTEENTH; end 
        10'd24:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd25:  begin period_counts = G4;  duration_ticks = SIXTEENTH; end 
        10'd26:  begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd27:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd28:  begin period_counts = G5;  duration_ticks = SIXTEENTH; end 
        10'd29:  begin period_counts = A5;  duration_ticks = SIXTEENTH; end 
        10'd30:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd31:  begin period_counts = F5;  duration_ticks = SIXTEENTH; end 
        10'd32:  begin period_counts = G5;  duration_ticks = SIXTEENTH; end 
        10'd33:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd34:  begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd35:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd36:  begin period_counts = C5;  duration_ticks = SIXTEENTH; end 
        10'd37:  begin period_counts = D5;  duration_ticks = SIXTEENTH; end 
        10'd38:  begin period_counts = B4;  duration_ticks = SIXTEENTH; end 
        10'd39:  begin period_counts = SP;  duration_ticks = EIGHTH; end 
        10'd40:  begin period_counts = C5;  duration_ticks = SIXTEENTH; end 
        10'd41:  begin period_counts = SP;  duration_ticks = EIGHTH; end 
        10'd42:  begin period_counts = G4;  duration_ticks = SIXTEENTH; end 
        10'd43:  begin period_counts = SP;  duration_ticks = EIGHTH; end 
        10'd44:  begin period_counts = E4;  duration_ticks = SIXTEENTH; end 
        10'd45:  begin period_counts = SP;  duration_ticks = EIGHTH; end 
        10'd46:  begin period_counts = A4;  duration_ticks = SIXTEENTH; end 
        10'd47:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd48:  begin period_counts = B4;  duration_ticks = SIXTEENTH; end 
        10'd49:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd50:  begin period_counts = As4; duration_ticks = SIXTEENTH; end
        10'd51:  begin period_counts = A4;  duration_ticks = SIXTEENTH; end 
        10'd52:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd53:  begin period_counts = G4;  duration_ticks = SIXTEENTH; end 
        10'd54:  begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd55:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd56:  begin period_counts = G5;  duration_ticks = SIXTEENTH; end 
        10'd57:  begin period_counts = A5;  duration_ticks = SIXTEENTH; end 
        10'd58:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd59:  begin period_counts = F5;  duration_ticks = SIXTEENTH; end 
        10'd60:  begin period_counts = G5;  duration_ticks = SIXTEENTH; end 
        10'd61:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd62:  begin period_counts = E5;  duration_ticks = SIXTEENTH; end 
        10'd63:  begin period_counts = SP;  duration_ticks = SIXTEENTH; end 
        10'd64:  begin period_counts = C5;  duration_ticks = SIXTEENTH; end 
        10'd65:  begin period_counts = D5;  duration_ticks = SIXTEENTH; end 
        10'd66:  begin period_counts = B4;  duration_ticks = SIXTEENTH; end 
        10'd67:  begin period_counts = SP;  duration_ticks = EIGHTH; end 
        default: begin period_counts = SP; duration_ticks = 5'd1; end
    endcase
end
endmodule

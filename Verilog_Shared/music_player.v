`timescale 1ns / 1ps
module music_player(clk, rst_n, play, aud_pwm, aud_sd);
input  clk, rst_n, play; /* play control: 1->play, 0->stop */
output aud_pwm; 	     /* PWM output signal to produce audio */
output aud_sd;		     /* audio amplifier shut-down: 1->on, 0->off  */
wire wave_gen_rst_n;
wire [9:0]note_count;
wire [19:0]period_counts;
wire [4:0]duration_ticks;
wire wave_out;
wire note_active;
reg [31:0]duration_counter;
reg [31:0]duration_counts;
reg [9:0]note_index;
/*****************************************************************************/
parameter 	BPM                = 105; /* Target Tempo*/
localparam 	CLK_FREQ_HZ        = 100_000_000;
localparam 	SECONDS_PER_MIN    = 60;
localparam 	COUNTS_PER_QUARTER = (64'd60 * CLK_FREQ_HZ) / BPM; /*6,000,000,000 / BPM*/
localparam 	COUNTS_SIXTEENTH   = COUNTS_PER_QUARTER / 4;
localparam 	COUNTS_PER_TICK	   = COUNTS_SIXTEENTH;
/*****************************************************************************/
/* Silence the final 10% of each note */
assign note_active = (duration_counter < (duration_counts * 9 / 10)) &&
                     (period_counts != 1);
assign aud_pwm = note_active ? wave_out : 1'b0;
assign aud_sd = play;
assign wave_gen_rst_n = rst_n & play;

/*****************************************************************************/
square_wave_generator 	wave_gen( .clk(clk), .rst_n(wave_gen_rst_n), 
								  .period_counts(period_counts), .wave_out(wave_out));

music_sheet_mario_full_song		my_song(.index(note_index), .note_count(note_count),
								.period_counts(period_counts), 
								.duration_ticks(duration_ticks));
/*****************************************************************************/
always @ (duration_ticks) begin
	duration_counts = duration_ticks * COUNTS_PER_TICK;
end
/*****************************************************************************/
always @ (posedge clk or negedge rst_n) begin
	if(rst_n == 0 || play == 0) begin
		duration_counter <= 0;
		note_index <= 0;
	end else begin
		if(duration_counter == (duration_counts - 1)) begin
			duration_counter <= 0;
			note_index <= (note_index + 1) % note_count;
		end else begin
			duration_counter <= duration_counter + 1;
		end
	end
end
/*****************************************************************************/
endmodule

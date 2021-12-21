% TODO : Find the Bsweep of chirp for 1 m resolution
d_res = 1;
c = 3 * 10^8;
B_sweep = c / (2 * d_res);

% TODO : Calculate the chirp time based on the Radar's Max Range
range_max = 300;
T_chirp = 5.5 * 2 * range_max / c; 

% TODO : define the frequency shifts 
f_b = [0 1.1 13 24] * 10^6;
calculated_range = c * T_chirp * f_b / (2 * B_sweep);

% Display the calculated range
disp(calculated_range);
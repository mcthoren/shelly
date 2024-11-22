set title "Power conditons over the last \\~48 Hours"
set xtics 7200 rotate by 30 offset -6.2, -3.0
set y2tics 
set link y2
set mytics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -2.6;
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y-%m-%dT%H:%M:%S%Z"
set grid
set term pngcairo size 1900, 512 font ",10"

dat_f_pl='/home/ghz/shelly/data/plantlight.48_hours'
dat_f_bk='/home/ghz/shelly/data/bklight.48_hours'
dat_f_pp000='/home/ghz/shelly/data/pprobe-000.48_hours'
dat_f_pp001='/home/ghz/shelly/data/pprobe-001.48_hours'
dat_f_pp002='/home/ghz/shelly/data/pprobe-002.48_hours'
dat_f_pp003='/home/ghz/shelly/data/pprobe-003.48_hours'
dat_f_pp004='/home/ghz/shelly/data/pprobe-004.48_hours'

set format y "%.1f"
set format y2 "%.1f"
set ylabel "(VAC)"
set y2label "(VAC)"
set output '/home/ghz/shelly/plots/light_line_voltage.png'
plot	dat_f_pl using 1:5 title 'Plant light voltage (VAC)' with lines lw 3 linecolor rgb "#dddd00", \
	dat_f_bk using 1:5 title 'Balcony lights voltage (VAC)' with lines lw 1 linecolor rgb "#00dd00", \
	dat_f_pp000 using 1:3 title 'Apt lights voltage (VAC)' with lines lw 1 linecolor rgb "#0000dd", \
	dat_f_pp001 using 1:3 title 'Apt main outlets voltage (VAC)' with lines lw 1 linecolor rgb "#00bbbb", \
	dat_f_pp002 using 1:3 title 'kitchen outlets - window side (VAC)' with lines lw 1 linecolor rgb "#bb0000", \
	dat_f_pp003 using 1:3 title 'kitchen outlets - sink side (VAC)' with lines lw 1 linecolor rgb "#000000", \
	dat_f_pp004 using 1:3 title 'washing machine (VAC)' with lines lw 1 linecolor rgb "#bb00bb"

set format y "%.3f"
set format y2 "%.3f"
set ylabel "(A)"
set y2label "(A)"
set output '/home/ghz/shelly/plots/light_current.png'
plot	dat_f_pp000 using 1:5 title 'Apt lights current (A)' with lines lw 2 linecolor rgb "#00bb00", \
	dat_f_pp003 using 1:5 title 'kitchen outlets - sink side (A)' with lines lw 2 linecolor rgb "#000000", \
	dat_f_pp004 using 1:5 title 'washing machine (A)' with lines lw 2 linecolor rgb "#bb00bb", \
	dat_f_pl using 1:7 title 'Plant light current (A)' with lines lw 2 linecolor rgb "#0000bb", \
	dat_f_bk using 1:7 title 'Balcony lights current (A)' with lines lw 2 linecolor rgb "#00aaaa"

set format y "%.2f"
set format y2 "%.2f"
set output '/home/ghz/shelly/plots/main_outlet_current.png'
plot	dat_f_pp001 using 1:5 title 'Apt main outlets current (A)' with lines lw 2 linecolor rgb "#00bbbb", \
	dat_f_pp002 using 1:5 title 'kitchen outlets - window side (A)' with lines lw 2 linecolor rgb "#bb0000"

set ylabel "(W)"
set y2label "(W)"
set format y "%.1f"
set format y2 "%.1f"
set output '/home/ghz/shelly/plots/light_power.png'
plot	dat_f_pp000 using 1:7 title 'Apt lights power (W)' with lines lw 2 linecolor rgb "#00bb00", \
	dat_f_pp003 using 1:7 title 'kitchen outlets - sink side (W)' with lines lw 2 linecolor rgb "#000000", \
	dat_f_pp004 using 1:7 title 'washing machine (W)' with lines lw 2 linecolor rgb "#bb00bb", \
	dat_f_pl using 1:3 title 'Plant light power (W)' with lines lw 2 linecolor rgb "#0000bb", \
	dat_f_bk using 1:3 title 'Balcony lights power (W)' with lines lw 2 linecolor rgb "#00aaaa"

set output '/home/ghz/shelly/plots/main_outlet_power.png'
plot	dat_f_pp001 using 1:7 title 'Apt main outlets power (W)' with lines lw 2 linecolor rgb "#00bbbb", \
	dat_f_pp002 using 1:7 title 'kitchen outlets - window side (W)' with lines lw 2 linecolor rgb "#bb0000"

set ylabel "(°C)"
set y2label "(°C)"
set output '/home/ghz/shelly/plots/light_shelly_temp.png'
plot	dat_f_pl using 1:9 title 'Plant light shelly temp (°C)' with lines lw 2 linecolor rgb "#0000bb", \
	dat_f_bk using 1:9 title 'Balcony lights shelly temp (°C)' with lines lw 2 linecolor rgb "#00aaaa"


set ylabel "(Hz)"
set y2label "(Hz)"
set format y "%.2f"
set format y2 "%.2f"
# set yrange ["49.5":"50.5"]
set output '/home/ghz/shelly/plots/light_shelly_freq.png'
plot	dat_f_pp000 using 1:9 title 'Apt lights freq bezier smoothed (Hz)' with lines lw 4 linecolor rgb "#00bb00" smooth bezier, \
	dat_f_pp001 using 1:9 title 'Apt main outlets freq bezier smoothed (Hz)' with lines lw 2 linecolor rgb "#000099" smooth bezier, \
	dat_f_pp002 using 1:9 title 'kitchen outlets - window side freq bezier smoothed (Hz)' with lines lw 2 linecolor rgb "#bb0000" smooth bezier, \
	dat_f_pp003 using 1:9 title 'kitchen outlets - sink side freq bezier smoothed (Hz)' with lines lw 2 linecolor rgb "#000000" smooth bezier, \
	dat_f_pp004 using 1:9 title 'washing machine freq bezier smoothed (Hz)' with lines lw 2 linecolor rgb "#bb00bb" smooth bezier

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
dat_f_pp005='/home/ghz/shelly/data/pprobe-005.48_hours'
dat_f_pp006='/home/ghz/shelly/data/pprobe-006.48_hours'
dat_f_total='/home/ghz/shelly/data/pprobe-total.48_hours'

C_00="#00ff00"
C_01="#00ffc0"
C_02="#00aac0"
C_03="#00c040"
C_04="#00c0ff"
C_05="#00c0aa"
C_06="#6000ff"
C_07="#0000ff"
C_08="#cc66ff"
C_09="#008000"

set format y "%.1f"
set format y2 "%.1f"
set ylabel "(VAC)"
set y2label "(VAC)"
set output '/home/ghz/shelly/plots/light_line_voltage.png'
plot	dat_f_pl using 1:5 title 'plant light voltage (VAC)' with lines lw 3 linecolor rgb C_05, \
	dat_f_bk using 1:5 title 'balcony lights voltage (VAC)' with lines lw 1 linecolor rgb C_06

set output '/home/ghz/shelly/plots/pprobe_line_voltage.png'
plot dat_f_pp000 using 1:3 title 'apt lights voltage (VAC)' with lines lw 1 linecolor rgb C_00, \
	dat_f_pp001 using 1:3 title 'main outlets voltage (VAC)' with lines lw 1 linecolor rgb C_01, \
	dat_f_pp002 using 1:3 title 'kitchen outlets - window side voltage (VAC)' with lines lw 1 linecolor rgb C_02, \
	dat_f_pp003 using 1:3 title 'kitchen outlets - sink side voltage (VAC)' with lines lw 1 linecolor rgb C_03, \
	dat_f_pp004 using 1:3 title 'washing machine voltage (VAC)' with lines lw 1 linecolor rgb C_04, \
	dat_f_pp005 using 1:3 title 'bathroom razor voltage (VAC)' with lines lw 1 linecolor rgb C_05, \
	dat_f_pp006 using 1:3 title 'bathroom outlets voltage (VAC)' with lines lw 1 linecolor rgb C_06

set format y "%.3f"
set format y2 "%.3f"
set ylabel "(A)"
set y2label "(A)"
set output '/home/ghz/shelly/plots/light_current.png'
plot	dat_f_pp000 using 1:5 title 'apt lights current (A)' with lines lw 2 linecolor rgb C_09, \
	dat_f_pp005 using 1:5 title 'bathroom razor current (A)' with lines lw 2 linecolor rgb C_01, \
	dat_f_pp006 using 1:5 title 'bathroom outlets current (A)' with lines lw 2 linecolor rgb C_02, \
	dat_f_pl using 1:7 title 'plant light current (A)' with lines lw 2 linecolor rgb C_03, \
	dat_f_pp003 using 1:5 title 'kitchen outlets - sink side current (A)' with lines lw 2 linecolor rgb C_07, \
	dat_f_bk using 1:7 title 'balcony lights current (A)' with lines lw 2 linecolor rgb C_04

set format y "%.2f"
set format y2 "%.2f"
set output '/home/ghz/shelly/plots/main_outlet_current.png'
plot	dat_f_pp001 using 1:5 title 'main outlets current (A)' with lines lw 2 linecolor rgb C_03, \
	dat_f_pp004 using 1:5 title 'washing machine current (A)' with lines lw 1 linecolor rgb C_04, \
	dat_f_pp002 using 1:5 title 'kitchen outlets - window side current (A)' with lines lw 2 linecolor rgb C_06

set output '/home/ghz/shelly/plots/total_current.png'
plot	dat_f_total using 1:4 title 'total current (A)' with lines lw 2 linecolor rgb C_06

set ylabel "(W)"
set y2label "(W)"
set format y "%.1f"
set format y2 "%.1f"
set output '/home/ghz/shelly/plots/light_power.png'
plot	dat_f_pp000 using 1:7 title 'apt lights power (W)' with lines lw 2 linecolor rgb C_09, \
	dat_f_pp003 using 1:7 title 'kitchen outlets - sink side power (W)' with lines lw 2 linecolor rgb C_07, \
	dat_f_pp005 using 1:7 title 'bathroom razor power (W)' with lines lw 2 linecolor rgb C_01, \
	dat_f_pp006 using 1:7 title 'bathroom outlets power (W)' with lines lw 2 linecolor rgb C_02, \
	dat_f_pl using 1:3 title 'plant light power (W)' with lines lw 2 linecolor rgb C_03, \
	dat_f_bk using 1:3 title 'balcony lights power (W)' with lines lw 2 linecolor rgb C_04

set output '/home/ghz/shelly/plots/main_outlet_power.png'
plot	dat_f_pp001 using 1:7 title 'main outlets power (W)' with lines lw 2 linecolor rgb C_03, \
	dat_f_pp004 using 1:7 title 'washing machine power (W)' with lines lw 1 linecolor rgb C_04, \
	dat_f_pp002 using 1:7 title 'kitchen outlets - window side power (W)' with lines lw 2 linecolor rgb C_06

set output '/home/ghz/shelly/plots/total_power.png'
plot	dat_f_total using 1:2 title 'total power (W)' with lines lw 2 linecolor rgb C_03

set ylabel "(°C)"
set y2label "(°C)"
set output '/home/ghz/shelly/plots/light_shelly_temp.png'
plot	dat_f_pl using 1:9 title 'plant light shelly temp (°C)' with lines lw 2 linecolor rgb "#0000bb", \
	dat_f_bk using 1:9 title 'balcony lights shelly temp (°C)' with lines lw 2 linecolor rgb "#00aaaa"


set ylabel "(Hz)"
set y2label "(Hz)"
set format y "%.2f"
set format y2 "%.2f"
# set yrange ["49.5":"50.5"]
set output '/home/ghz/shelly/plots/light_shelly_freq.png'
plot	dat_f_pp000 using 1:9 title 'apt lights freq bezier smoothed (Hz)' with lines lw 4 smooth bezier, \
	dat_f_pp001 using 1:9 title 'main outlets freq bezier smoothed (Hz)' with lines lw 2 smooth bezier, \
	dat_f_pp002 using 1:9 title 'kitchen outlets - window side freq bezier smoothed (Hz)' with lines lw 2 smooth bezier, \
	dat_f_pp003 using 1:9 title 'kitchen outlets - sink side freq bezier smoothed (Hz)' with lines lw 2 smooth bezier, \
	dat_f_pp004 using 1:9 title 'washing machine freq bezier smoothed (Hz)' with lines lw 2 smooth bezier, \
	dat_f_pp005 using 1:9 title 'bathroom razor freq bezier smoothed (Hz)' with lines lw 2 smooth bezier, \
	dat_f_pp006 using 1:9 title 'bathroom outlets freq bezier smoothed (Hz)' with lines lw 2 smooth bezier

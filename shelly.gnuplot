set title "Plant light power conditons over the last \\~48 Hours"
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

set format y "%.1f"
set format y2 "%.1f"

set ylabel "(VAC)"
set y2label "(VAC)"

dat_f='/home/ghz/shelly/data/plantlight.48_hours'

set output '/home/ghz/shelly/plots/plant_light_line_voltage.png'
plot dat_f using 1:5 title 'Line Voltage (VAC)' with lines lw 2 linecolor rgb "#dddd00"

set format y "%.3f"
set format y2 "%.3f"

set ylabel "(A)"
set y2label "(A)"

set output '/home/ghz/shelly/plots/plant_light_current.png'
plot dat_f using 1:7 title 'Plant Light Current (A)' with lines lw 2 linecolor rgb "#00bbbb"

set ylabel "(W)"
set y2label "(W)"
set format y "%.1f"
set format y2 "%.1f"

set output '/home/ghz/shelly/plots/plant_light_power.png'
plot dat_f using 1:3 title 'Plant Light Power (W)' with lines lw 2 linecolor rgb "#0000bb"

set ylabel "(°C)"
set y2label "(°C)"

set output '/home/ghz/shelly/plots/plant_light_shelly_temp.png'
plot dat_f using 1:9 title 'Plant Light Shelly Temp (°C)' with lines lw 2 linecolor rgb "#ff0000"

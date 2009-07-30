set terminal svg
set output "compton0.svg"

set multiplot
set origin 0.0,0.0
set polar
set size square
set format y ""
unset key
unset label
plot (1-cos(t))

set origin 0.4, 0.5
set size 0.4, 0.4
unset polar
set format y ""
set xtics -pi,pi/2
unset ytics
plot [-pi:pi] (1-cos(x))

unset multiplot

#pause -1

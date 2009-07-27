set terminal svg
set output "sezione_coulomb.svg"
d1 = 10.
d2 = 1.
d3 = 0.1

#unset ytics
set yrange [0.0001:100000]
set key right bottom
set multiplot
set xlabel "cos theta"
set origin 0.0,0.0
set size 1.0,1.0
set logscale y
set format y ""
plot [x=-1:1] (d1**2)/16. * 1./(sin(acos(x)/2))**4 title "d=10", (d2**2)/16. *1./(sin(acos(x)/2))**4 title "d=1", (d3**2)/16. *1./(sin(acos(x)/2))**4 title "d=0.1"

set origin 0.03,0.58
set format y ""
set size 0.4,0.4
unset key
set xtics -pi,pi/2
set xlabel "theta"
plot [x=-pi:pi] (d1**2)/16. * 1./(sin(x/2))**4 title "d=10", (d2**2)/16. *1./(sin(x/2))**4 title "d=1", (d3**2)/16. *1./(sin(x/2))**4 title "d=0.1"

set origin 0.32,0.58
set format y ""
set format x " "
set size 0.4,0.4
unset logscale y
set xlabel " "
set yrange [-60:60]
set xrange [-10:110]
set polar
set grid polar
set size square
set xtics 50
plot [t=-pi:pi] (d1**2)/16. * 1./(sin(t/2))**4 title "d=10", (d2**2)/16. *1./(sin(t/2))**4 title "d=1", (d3**2)/16. *1./(sin(t/2))**4 title "d=0.1
set nomultiplot
#pause -1


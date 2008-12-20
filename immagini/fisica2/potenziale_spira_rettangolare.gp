set terminal svg
set output "potenziale_spira_rettangolare.svg"
set yrange [0.01:50]
set log y
set xlabel 'z'
l = 2
plot [x=-5:5] 1./(sqrt(x**2+l**2/4+l**2./4))*(2./(x**2+l**2/4)) title 'esatto', 1./(sqrt(x**2))*(2./(x**2)) ls 3 title 'dipolo'
#pause -1

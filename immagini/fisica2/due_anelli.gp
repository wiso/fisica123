set terminal svg
set output "due_anelli.svg"
R = 10.
d = 1
unset tics
set yrange [-0.0052:0.0052] 
plot [x=-50:50] R/2. *((x-d/2)/(R**2+(x-d/2)**2)**(3./2.)-(x+d/2.)/(R**2+(x+d/2.)**2)**(3./2.)) title "Anelli", \
R*d/abs(x)**3 title "Dipolo", \
R/2.*(x-d/2.)/(R**2+(x-d/2.)**2)**(3./2.) title "Anello +",\
-R/2.*(x+d/2.)/(R**2+(x+d/2.)**2)**(3./2.) title "Anello -"
#pause -1

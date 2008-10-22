set terminal svg
set output "potenziale_disco.svg"
set xlabel "z"
plot x*(1./abs(x)-1./((1**2+x**2)**(1/2.)))
#pause -1

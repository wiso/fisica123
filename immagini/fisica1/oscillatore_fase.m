global om2;
om2 = 1;

function xdot=oa(x, t)
  global om2
  xdot(1) = x(2);
  xdot(2) = -om2*x(1);
endfunction


t = 0:0.1:15;

clearplot;
hold on;
title('Oscillatore Armonico - Spazio delle fasi')
axis("equal")
axis([-15 15 -15 15])
__gnuplot_set__ nokey
grid on
xlabel('x')
ylabel('v')

for i = -9:3:9;
  for j = -9:3:9;
    x0 = [i; j];
    x = lsode("oa", x0, t);
    plot(i, j, '@x', x(:,1), x(:,2),'-b')
  end
end
hold off;
# print ("oscillatore_fase.svg")


global om2;
global mu;
om2 = 1;
mu = 0.1;

function xdot=oas(x, t)
  global om2
  global mu
  A = [0, 1; -om2, -2*mu];
  xdot = A*x;
endfunction

t = 0:0.1:200;
x0 = [1; 0];

x = lsode("oas", x0, t);

title('Oscillatore Armonico Smorzato')

axis([-1.5 1.5 -1.5 1.5])
plot(x(:,1), x(:,2), x0(1), x0(2))
axis("equal")
xlabel('x')
ylabel('v')
grid on
# print ('oscillatore_smorzato_fase.svg')

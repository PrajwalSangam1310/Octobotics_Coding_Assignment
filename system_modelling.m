%% state space modelling
M = 10;
m = 10;
b = 0;
I = 0;
g = 9.8;
l = 200;

p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];

B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];

C = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1];

D = [0;
     0; 
     0;
     0];
%% controller
Q = 1*eye(4);
R = 0.01;
Klqr = lqr(A,B,Q,R)
k_matrix = Klqr;
%% reference 
x_ref = [0.3;
    0;
    0;
    0];


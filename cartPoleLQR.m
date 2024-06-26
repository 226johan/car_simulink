function K = cartPoleLQR
global M m l g I b
%% state space matrices
% A = [0 0 1 0;
%    0 0 0 1;
%    0 m*g/M 0 0;
%    0 (m*g + M*g)/(M*l) 0 0];
% B = [0;0;1/M;1/(M*l)]

A = [0 1 0 0;
    0 (-(I+m*l*l)*b)/(I*(M+m)+M*m*l*l) (m*m*g*l*l)/(I*(M+m)+M*m*l*l) 0;
    0 0 0 1;
    0 (-m*l*b)/(I*(M+m)+M*m*l*l) (m*g*l*(M+m))/(I*(M+m)+M*m*l*l) 0];
B = [0;(I+m*l*l)/(I*(M+m)+M*m*l*l);0;m*l/(I*(M+m)+M*m*l*l)]

C = eye(4);
D = 0;

%% build ss system;
cartpole = ss(A,B,C,D);

%% LQR
Q = diag([500 100 6000 10]); % x dx q dq
R = 5; % fx
K = lqr(cartpole,Q,R);

end
%%
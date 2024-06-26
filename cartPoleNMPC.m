function Fx = cartPoleNMPC(states)
tic
import casadi.*
%% states:
X_1 = states; % x dx q dq

%% desired command:
X_des = [0;0;0;0];

%% mpc parameters
h=20; % # of horizons
dt_MPC = 0.01; % sec

%% desired reference:
X_ref = generateReference(X_1,X_des,h);

%% nmpc setup in CasADi:
nmpc = casaidi.Opti();
X = nmpc.variable(4,h); % 4xh
F = nmpc.variable(1,h); % 1xh

%% constraints:
nmpc.subject_to( X(:,1) == X_1 ); % IC=current states
for k = 1 : h-1
    % dynamics:
    dX = cartPoleDynamics(X(:,k).F(:,K));
    
    
end
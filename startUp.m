clear;

%% cart-pole properties
global M m l g K_LQR I b
M = 0.5;    % 小车质量
m = 0.2;    % 摆杆质量
l = 0.3;    % 摆杆长度
g = 9.81;   % 重力加速度
I = 0.006; % 摆杆惯量
b = 0.1;    %摩擦系数

wheel_damping = 1e-5;
joint_damping = 1e-5;
%% cart-pole init condition
x_0 = 0;
y_0 = 0.125;
q_0 = 20 %degree


%% controllers
LQR = 1;

if LQR
    K_LQR = cartPoleLQR;
end
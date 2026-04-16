clear
clc
close all

 

g = 9.81;          % gravity (m/s^2)
k = 0.1;           % air resistance coefficient
v0 = 20;           % initial velocity
theta = 45;        % launch angle (degrees)

theta = deg2rad(theta);

% Initial velocities
vx = v0*cos(theta);
vy = v0*sin(theta);

% Time settings
dt = 0.01;
t = 0;

% Initial position
x = 0;
y = 0;

% Storage arrays
X = [];
Y = [];

% Euler Simulation loop
while y >= 0

    % Storing VAlues
    X(end+1) = x;
    Y(end+1) = y;

    % Accelerations (with friction)
    ax = -k * vx;
    ay = -g - k * vy;

    % Updating velocities
    vx = vx + ax * dt;
    vy = vy + ay * dt;

    % Update positions
    x = x + vx * dt;clear
clc
close all

t = linspace(0,10,1000);

m = 1;
k = 5;
omega = sqrt(k/m);

A = 1;

% Undamped
x1 = A*cos(omega*t);

% Light damping
gamma1 = 0.2;
x2 = A*exp(-gamma1*t).*cos(omega*t);

% Heavy damping
gamma2 = 1;
x3 = A*exp(-gamma2*t).*cos(omega*t);

figure
plot(t,x1,'b','LineWidth',2)
hold on
plot(t,x2,'r','LineWidth',2)
plot(t,x3,'g','LineWidth',2)

grid on
xlabel('Time (s)')
ylabel('Displacement')
title('Simple Harmonic Motion with Damping')
legend('Undamped','Light Damping','Heavy Damping')
    y = y + vy * dt;

    % Update time
    t = t + dt;
end

% Plotting
figure
plot(X, Y, 'r', 'LineWidth', 2)
grid on

xlabel('Distance (m)')
ylabel('Height (m)')
title('Projectile Motion with Air Resistance (Friction)')

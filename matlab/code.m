clc;
clear;
close all;

t = [0 20 40 60 80];

r1 = [6 7.5 8.5 9.2 9.8];
r2 = [6 6.8 7.4 8.0 8.4];
r3 = [6 8.5 9.8 11.0 12.0];
r4 = [6 7.5 8.5 9.5 10.2];

r1_sq = r1.^2;
r2_sq = r2.^2;
r3_sq = r3.^2;
r4_sq = r4.^2;

t_new = t(2:end);
r1_new = r1_sq(2:end);
r2_new = r2_sq(2:end);
r3_new = r3_sq(2:end);
r4_new = r4_sq(2:end);

p1 = polyfit(t_new, r1_new, 1);
p2 = polyfit(t_new, r2_new, 1);
p3 = polyfit(t_new, r3_new, 1);
p4 = polyfit(t_new, r4_new, 1);

s1 = p1(1);
s2 = p2(1);
s3 = p3(1);
s4 = p4(1);

D1 = s1/4;
D2 = s2/4;
D3 = s3/4;
D4 = s4/4;

fprintf('--- Improved Results ---\n');
fprintf('0.5%% Agar (30°C): D = %.4f mm^2/min\n', D1);
fprintf('1%% Agar (30°C): D = %.4f mm^2/min\n', D2);
fprintf('0.5%% Agar (55°C): D = %.4f mm^2/min\n', D3);
fprintf('1%% Agar (55°C): D = %.4f mm^2/min\n', D4);

figure;
plot(t_new, r1_new, 'o-', 'LineWidth', 2); hold on;
plot(t_new, r2_new, 's-', 'LineWidth', 2);
plot(t_new, r3_new, '^-', 'LineWidth', 2);
plot(t_new, r4_new, 'd-', 'LineWidth', 2);

t_fit = linspace(min(t_new), max(t_new), 100);

plot(t_fit, polyval(p1, t_fit), '--');
plot(t_fit, polyval(p2, t_fit), '--');
plot(t_fit, polyval(p3, t_fit), '--');
plot(t_fit, polyval(p4, t_fit), '--');

xlabel('Time (min)');
ylabel('r^2 (mm^2)');
title('Improved r^2 vs Time');

legend('0.5% (30°C)', '1% (30°C)', ...
       '0.5% (55°C)', '1% (55°C)', ...
       'Fit1', 'Fit2', 'Fit3', 'Fit4');

grid on;
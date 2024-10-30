clear;clc;

%Author: Uğur ÜN
%Date  : 30 Oct 2024

#y = A*exp(b*t)
A = 0.68;
b = 2.53;
std = 0.18;
t = 0.01:0.01:1;
n = length(t);


#clean data generation
clean_data = A*exp(b*t);

#noisy data generation
noisy_data = A*exp(b*t) + std*randn(1,n); #+ std*randn(1:n);

#LSE
#lny = lna + b*t,  y' = A + B*x
#y' = lny,   a' = lna
y = log(noisy_data');
x = ones(n,2); x(:,2) = t';
c = inv(x'*x)*x'*y; c(1) = exp(c(1));
est_data = c(1)*exp(c(2)*t);

#plots
figure(1)
plot(t, clean_data, 'g', 'LineWidth',2);hold on;
plot(t, est_data, 'r', 'LineWidth',2);hold on;
scatter(t, noisy_data,15,'filled','b');
title('Least Square Fitting');
xlabel('t');ylabel('y');
legend('clean data','estimation','noisy data');
grid on;



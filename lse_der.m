clear;clc;close all;

%Author: Uğur ÜN
%Date  : 30 Oct 2024

#y = A*exp(b*t)
A = 0.68;
b = 2.53;
std = 0.18;
x = 0.01:0.01:1;
n = length(x);


#clean data generation
clean_data = A*exp(b*x);

#noisy data generation
y = clean_data + std*randn(1,n); #+ std*randn(1:n);

#LSE
aa = (sum (x'.^2 .* y') * sum(y'.*log(y')) - sum(x'.*y') * sum(x'.*y'.*log(y'))) / (sum(y')* sum(x'.^2.*y') -  sum((x' .* y'))^2);
aa = exp(aa);
bb = (sum(y')*sum(x'.*y'.*log(y')) - sum(x'.*y')*sum(y'.*log(y'))) /  (sum(y')* sum(x'.^2.*y') -  sum((x' .* y'))^2);
est_data = aa*exp(bb*x);

#plots
figure(1)
plot(x, clean_data, 'g', 'LineWidth',2);hold on;
plot(x, est_data, 'r', 'LineWidth',2);hold on;
scatter(x, y,15,'filled','b');
title('Least Square Fitting');
xlabel('x');ylabel('y');
legend('clean data','estimation','noisy data');
grid minor;



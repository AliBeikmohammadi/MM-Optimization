%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Ali Beikmohammadi%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%2022-04-28%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
close all;
load('b.mat')
load('A.mat')
% format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_direct=inv(A)*b;
e_x_direct=norm(b-(A*x_direct));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
miu=1000;
x_0=ones(3000,1);
I = eye(3000);

x_n=x_0;
e_x_k = [norm(b-(A*x_n))];

for i=0:19
    x_n_plus_1=x_n+(inv(((1/miu)*I)+A)*(b-(A*x_n)));
    x_n=x_n_plus_1;
    e_x_k = [e_x_k; norm(b-(A*x_n))];
end
fprintf('e(x^{direct})= %d and e(x^{20})= %d\n', e_x_direct, e_x_k(21));
invA_eig=eig(A);
fprintf('The largest and smallest eigenvalues of A= %d and %d\n', max(invA_eig), min(invA_eig));
figure(1)
plot(0:20, e_x_k);
hold on
yline(e_x_direct,'-','e(x^{direct})');
grid on
xlabel ('Iterations')
ylabel('e(x^{.})')
legend('e(x^{(k)})')

figure (2)
semilogy(0:20,e_x_k);
hold on
yline(e_x_direct,'-','e(x^{direct})');
grid on
xlabel ('Iterations')
ylabel('e(x^{.})')
legend('e(x^{(k)})')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x_direct2=A\b;
% e_x_direct2=norm(b-(A*x_direct2));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x_n2=x_0;
% e_x_k2 = [norm(b-(A*x_n2))];
% for i=0:19
%     x_n_plus_12=x_n2+((((1/miu)*I)+A)\(b-(A*x_n2)));
%     x_n2=x_n_plus_12;
%     e_x_k2 = [e_x_k2; norm(b-(A*x_n2))];
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fprintf('e(x^{direct2})= %d and e(x^{20_2})= %d\n', e_x_direct2, e_x_k2(21));
% figure(3)
% plot(0:20,e_x_k2);
% hold on
% yline(e_x_direct2,'-','e(x^{direct2})');
% grid on
% xlabel ('Iterations')
% ylabel('e(x^{.})')
% legend('e(x^{(k2)})')
% 
% figure(4)
% semilogy(0:20,e_x_k2);
% hold on
% yline(e_x_direct2,'-','e(x^{direct2})')
% grid on
% xlabel ('Iterations')
% ylabel('e(x^{.})')
% legend('e(x^{(k2)})')

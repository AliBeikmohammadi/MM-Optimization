%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Ali Beikmohammadi%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%2022-06-13%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;
close all;
xn1_0=1.2;
xn2_0=1.2;

xn1=xn1_0;
xn2=xn2_0;
x1s = [xn1];
x2s = [xn2];

in=13300;
for i=0:in
    x1 = optimvar('x1');
    prob1 = optimproblem;
    prob1.Objective = (200*(x1^4))-1*((200*((xn1^2)+xn2)-1)*(x1^2))-(2*x1);
    x0.x1=xn1;
    sol1 = solve(prob1, x0);
    
    x2 = optimvar('x2');
    prob2 = optimproblem;
    prob2.Objective = (200*(x2^2))-1*((200*((xn1^2)+xn2)))*(x2);
    sol2 = solve(prob2);
    
    xn1=sol1.x1;
    xn2=sol2.x2;
    x1s = [x1s; xn1];
    x2s = [x2s; xn2];
end

figure(1)
plot(0:in+1, x1s);
hold on
plot(0:in+1, x2s);
grid on
xlabel ('Iterations')
ylabel('x1 and x2')
legend('x1', 'x2')

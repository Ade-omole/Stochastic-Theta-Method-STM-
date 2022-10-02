randn('state',100)

lambda = 0.53; mu = 0.082; epsilon = 0.036; sigma1 = 0.02;  
sigma3 = 0.02; sigma2 = 0.02; beta = 0.03; gamma = 0.0060; 
Szero = 0.7; Izero = 0.2; Rzero = 0.1; 
T = 1000; N = 2^8; dt = T/N;

dW = sqrt(dt)*randn(1,N);       
z = 2; Dt = z*dt; L = N/z;       
X = zeros(3,L);  
X(:,1) = [Szero;Izero;Rzero];

theta = 1;

for j = 1:L-1

    Winc = sum(dW(z*(j-1)+1:z*j));
   
    X(:,j+1) = fsolve(@(Y) Y - X(:,j) - Dt*(1-theta)*f(X(:,j),...
        lambda,beta,mu,epsilon,gamma)-...
        Dt*theta*f(Y,lambda,beta,mu,epsilon,gamma) - g(X(:,j),...
        sigma1,sigma2,sigma3)*Winc,X(:,j),...
        optimset('Display','off','TolFun',1e-14));
  
end

S=X(1,:);

I=X(2,:);

R=X(3,:);

plot([0:Dt:T], [Szero,S],'b--*'); hold on
plot([0:Dt:T], [Izero,I],'r--*'); hold on
plot([0:Dt:T], [Rzero,R],'g--*');
xlabel('$t$ (days)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Population Fraction', 'Interpreter', 'latex', 'FontSize', 14);
title('Kenya', 'Interpreter','latex', 'FontSize',16);
legend({'Susceptible','Infected','Recovered'},'Location','best')


function y=f(x,lambda,beta,mu,epsilon,gamma)
x
y(1)=lambda-beta*x(1).*x(2)-mu*x(1);
y(2)=beta*x(1).*x(2)-(mu+epsilon+gamma)*x(2);
y(3)=gamma*x(2)-mu*x(3);
end

function y=g(x,sigma1,sigma2,sigma3)
y(1)=sigma1*x(1);
y(2)=sigma2*x(2);
y(3)=sigma3*x(3);
end
function [t,x] = ATP_timer()

%Rate constants
k.k1=0.01;
k.k2=14.8;
k.k3=6.0;

%Concentrations
x0=zeros(1,5); 
x0=[1e-8; %ADP
    1e-6; %ATP
    3.52e-4; %LUC
    1e-3; %PEP
    1e-3; %AMP
    ];
tspan=[0:1:5000];

options = odeset('AbsTol',1e-12,'RelTol',1e-6,'NonNegative',ones(20,1));
[t,x]=ode23t(@diff_eq_ATP,tspan,x0,options,k);

plot(t,x(:,2));

end
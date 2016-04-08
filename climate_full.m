

eps = 0.000001;
initV1 = [0.1 0.1 0.1];
Tscale = 10;
T1 = [0 140];

p = 0.8; q = 1.2; r = 0.7; s = 0.8; 
options = odeset('RelTol',eps,'AbsTol',[eps eps eps/10]);
[T1,X1] = ode45(@(T1,X1) F(T1, X1, p, r, s,q), T1, initV1, options);
Tdim = T1*Tscale;


figure(3)
subplot(3,1,1);
plot(Tdim,X1(:,1),'r');
hold on
ylabel('X'); 
subplot(3,1,2);
plot(Tdim,X1(:,2),'g');
hold on
ylabel('Y'); 
subplot(3,1,3);
plot(Tdim,X1(:,3),'b');
hold on
xlabel('kyr'); ylabel('Z');
hold on


%initV2(1:3,1) = [X1(end,1) X1(end,2) X1(end,3)]

rr = 0.7:0.01:0.8;
pp = 2*rr -0.6;
initV2 = [X1(end,1) X1(end,2) X1(end,3)]
%for i = 1: length(rr)-1
for i = 1: length(rr)-1
TT = [140+i-1 140+i]
options = odeset('RelTol',eps,'AbsTol',[eps eps eps/10]);
[TT,X2] = ode45(@(TT,X2) F(TT, X2, pp(i), rr(i), s,q), TT, initV2, options);

Tdim = TT*Tscale;

subplot(3,1,1);
plot(Tdim,X2(:,1),'r');
hold on
ylabel('X'); 
subplot(3,1,2);
plot(Tdim,X2(:,2),'g');
hold on
ylabel('Y'); 
subplot(3,1,3);
plot(Tdim,X2(:,3),'b');
hold on
xlabel('kyr'); ylabel('Z');
hold on
initV2 = [X2(end,1) X2(end,2) X2(end,3)]
end



T3 = [150 200];
options = odeset('RelTol',eps,'AbsTol',[eps eps eps/10]);
p = 1.0; q = 1.2; r = 0.8; s = 0.8; 
[T3,X3] = ode45(@(T3,X3) F(T3, X3, p, r, s,q), T3, initV2, options);
Tdim = T3*Tscale;
subplot(3,1,1);
plot(Tdim,X3(:,1),'r');
hold on
ylabel('X'); 
subplot(3,1,2);
plot(Tdim,X3(:,2),'g');
hold on
ylabel('Y'); 
subplot(3,1,3);
plot(Tdim,X3(:,3),'b');
hold on
xlabel('kyr'); ylabel('Z');
hold on



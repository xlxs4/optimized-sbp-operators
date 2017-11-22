function [D,H,x,dx] = D1_4th(N, L)

dx = L/(N-1);
x = linspace(0,L,N)';

if N<8
    disp('Too few grid points'); return
end

Pinv=[48/17 48/59 48/43 48/49 ...
    ones(1,N-8) 48/49 48/43 48/59 48/17] / dx;
diagQ=ones(N,1)*[1/12 -2/3 0 2/3 -1/12];
Q=spdiags(diagQ,-2:2,N,N);
Q(1:4,1:4)=[-1/2 59/96 -1/12 -1/32;-59/96 0 59/96 0;...
    1/12 -59/96 0 59/96; 1/32 0 -59/96 0];
Q(N-3:N,N-3:N) = -rot90(Q(1:4,1:4),2);

H = spdiags((1./Pinv).',0,N,N);
D = spdiags(Pinv.',0,N,N) * Q;

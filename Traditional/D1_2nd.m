function [D,H,x,dx] = D1_2nd(N, L)

dx = L/(N-1);
x = linspace(0,L,N)';

Pinv= [2 ones(1,N-2) 2] / dx;
Q = 0.5*sparse(diag([-1;zeros(N-2,1);1])...
    +diag(ones(N-1,1),1)-diag(ones(N-1,1),-1));

H = spdiags((1./Pinv).',0,N,N);
D = spdiags(Pinv.',0,N,N) * Q;

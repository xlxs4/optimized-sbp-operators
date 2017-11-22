function [D1,H,x,h] = D1x_10_FreeX5(N,L)

% L: Domain length
% N: Number of grid points
if(nargin < 2)
    L = 1;
end

% BP: Number of boundary points
% m:  Number of nonequidistant spacings
% order: Accuracy of interior stencil
BP = 10;
m = 5;
order = 10;

%%%% Non-equidistant grid points %%%%%
x0 =  0.0000000000000e+00;
x1 =  3.5902433622052e-01;
x2 =  1.1436659188355e+00;
x3 =  2.2144895894456e+00;
x4 =  3.3682742337736e+00;
x5 =  4.4309689056870e+00;
x6 =  5.4309689056870e+00;
x7 =  6.4309689056870e+00;
x8 =  7.4309689056870e+00;
x9 =  8.4309689056870e+00;
x10 =  9.4309689056870e+00;

xb = zeros(m+1,1);
for i = 0:m
    xb(i+1) = eval(['x' num2str(i)]);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Compute h %%%%%%%%%%
h = L/(2*xb(end) + N-1-2*m);
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Define grid %%%%%%%%
x = h*[xb; linspace(xb(end)+1,L/h-xb(end)-1,N-2*(m+1))'; L/h-flip(xb) ];
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Norm matrix %%%%%%%%
P = zeros(BP,1);
%#ok<*NASGU>
P0 =  1.0000000000000e-01;
P1 =  5.8980851260667e-01;
P2 =  9.5666820955973e-01;
P3 =  1.1500297411596e+00;
P4 =  1.1232986993248e+00;
P5 =  1.0123020150951e+00;
P6 =  9.9877122702527e-01;
P7 =  1.0000873322761e+00;
P8 =  1.0000045540888e+00;
P9 =  9.9999861455083e-01;

for i = 0:BP-1
    P(i+1) = eval(['P' num2str(i)]);
end

H = ones(N,1);
H(1:BP) = P;
H(end-BP+1:end) = flip(P);
H = spdiags(h*H,0,N,N);
%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Q matrix %%%%%%%%%%%

% interior stencil
switch order
    case 2
        d = [-1/2,0,1/2];
    case 4
        d = [1/12,-2/3,0,2/3,-1/12];
    case 6
        d = [-1/60,3/20,-3/4,0,3/4,-3/20,1/60];
    case 8
        d = [1/280,-4/105,1/5,-4/5,0,4/5,-1/5,4/105,-1/280];
    case 10
        d = [-1/1260,5/504,-5/84,5/21,-5/6,0,5/6,-5/21,5/84,-5/504,1/1260];
    case 12
        d = [1/5544,-1/385,1/56,-5/63,15/56,-6/7,0,6/7,-15/56,5/63,-1/56,1/385,-1/5544];
end
d = repmat(d,N,1);
Q = spdiags(d,-order/2:order/2,N,N);

% Boundaries
Q0_0 = -5.0000000000000e-01;
Q0_1 =  6.7548747038002e-01;
Q0_2 = -2.6691978151546e-01;
Q0_3 =  1.4438714982130e-01;
Q0_4 = -7.7273673750760e-02;
Q0_5 =  2.5570078343005e-02;
Q0_6 =  4.2808774693299e-03;
Q0_7 = -8.2902108933389e-03;
Q0_8 =  3.2031176427908e-03;
Q0_9 = -4.4502749689556e-04;
Q0_10 =  0.0000000000000e+00;
Q0_11 =  0.0000000000000e+00;
Q0_12 =  0.0000000000000e+00;
Q0_13 =  0.0000000000000e+00;
Q0_14 =  0.0000000000000e+00;
Q1_0 = -6.7548747038002e-01;
Q1_1 =  0.0000000000000e+00;
Q1_2 =  9.5146052715180e-01;
Q1_3 = -4.2442349882626e-01;
Q1_4 =  2.1538865145190e-01;
Q1_5 = -7.1939778160350e-02;
Q1_6 = -8.2539187832840e-03;
Q1_7 =  1.9930661669090e-02;
Q1_8 = -7.7433256989613e-03;
Q1_9 =  1.0681515760869e-03;
Q1_10 =  0.0000000000000e+00;
Q1_11 =  0.0000000000000e+00;
Q1_12 =  0.0000000000000e+00;
Q1_13 =  0.0000000000000e+00;
Q1_14 =  0.0000000000000e+00;
Q2_0 =  2.6691978151546e-01;
Q2_1 = -9.5146052715180e-01;
Q2_2 =  0.0000000000000e+00;
Q2_3 =  9.6073770842387e-01;
Q2_4 = -3.9378595264609e-01;
Q2_5 =  1.3302097358959e-01;
Q2_6 =  8.1200458151489e-05;
Q2_7 = -2.3849770528789e-02;
Q2_8 =  9.6600442856829e-03;
Q2_9 = -1.3234579460680e-03;
Q2_10 =  0.0000000000000e+00;
Q2_11 =  0.0000000000000e+00;
Q2_12 =  0.0000000000000e+00;
Q2_13 =  0.0000000000000e+00;
Q2_14 =  0.0000000000000e+00;
Q3_0 = -1.4438714982130e-01;
Q3_1 =  4.2442349882626e-01;
Q3_2 = -9.6073770842387e-01;
Q3_3 =  0.0000000000000e+00;
Q3_4 =  9.1551097634196e-01;
Q3_5 = -2.8541713079648e-01;
Q3_6 =  4.1398809121293e-02;
Q3_7 =  1.7256059167927e-02;
Q3_8 = -9.4349194803610e-03;
Q3_9 =  1.3875650645663e-03;
Q3_10 =  0.0000000000000e+00;
Q3_11 =  0.0000000000000e+00;
Q3_12 =  0.0000000000000e+00;
Q3_13 =  0.0000000000000e+00;
Q3_14 =  0.0000000000000e+00;
Q4_0 =  7.7273673750760e-02;
Q4_1 = -2.1538865145190e-01;
Q4_2 =  3.9378595264609e-01;
Q4_3 = -9.1551097634196e-01;
Q4_4 =  0.0000000000000e+00;
Q4_5 =  8.3519401865051e-01;
Q4_6 = -2.0586492924974e-01;
Q4_7 =  3.1230261235901e-02;
Q4_8 = -2.0969453466651e-04;
Q4_9 = -5.0965470499782e-04;
Q4_10 =  0.0000000000000e+00;
Q4_11 =  0.0000000000000e+00;
Q4_12 =  0.0000000000000e+00;
Q4_13 =  0.0000000000000e+00;
Q4_14 =  0.0000000000000e+00;
Q5_0 = -2.5570078343005e-02;
Q5_1 =  7.1939778160350e-02;
Q5_2 = -1.3302097358959e-01;
Q5_3 =  2.8541713079648e-01;
Q5_4 = -8.3519401865051e-01;
Q5_5 =  0.0000000000000e+00;
Q5_6 =  8.1046389580138e-01;
Q5_7 = -2.1879194972141e-01;
Q5_8 =  5.2977237804899e-02;
Q5_9 = -9.0146730522360e-03;
Q5_10 =  7.9365079365079e-04;
Q5_11 =  0.0000000000000e+00;
Q5_12 =  0.0000000000000e+00;
Q5_13 =  0.0000000000000e+00;
Q5_14 =  0.0000000000000e+00;
Q6_0 = -4.2808774693299e-03;
Q6_1 =  8.2539187832840e-03;
Q6_2 = -8.1200458151489e-05;
Q6_3 = -4.1398809121293e-02;
Q6_4 =  2.0586492924974e-01;
Q6_5 = -8.1046389580138e-01;
Q6_6 =  0.0000000000000e+00;
Q6_7 =  8.2787884456005e-01;
Q6_8 = -2.3582460382545e-01;
Q6_9 =  5.9178678209520e-02;
Q6_10 = -9.9206349206349e-03;
Q6_11 =  7.9365079365079e-04;
Q6_12 =  0.0000000000000e+00;
Q6_13 =  0.0000000000000e+00;
Q6_14 =  0.0000000000000e+00;
Q7_0 =  8.2902108933389e-03;
Q7_1 = -1.9930661669090e-02;
Q7_2 =  2.3849770528789e-02;
Q7_3 = -1.7256059167927e-02;
Q7_4 = -3.1230261235901e-02;
Q7_5 =  2.1879194972141e-01;
Q7_6 = -8.2787884456005e-01;
Q7_7 =  0.0000000000000e+00;
Q7_8 =  8.3301028859275e-01;
Q7_9 = -2.3804321850015e-01;
Q7_10 =  5.9523809523809e-02;
Q7_11 = -9.9206349206349e-03;
Q7_12 =  7.9365079365079e-04;
Q7_13 =  0.0000000000000e+00;
Q7_14 =  0.0000000000000e+00;
Q8_0 = -3.2031176427908e-03;
Q8_1 =  7.7433256989613e-03;
Q8_2 = -9.6600442856829e-03;
Q8_3 =  9.4349194803610e-03;
Q8_4 =  2.0969453466651e-04;
Q8_5 = -5.2977237804899e-02;
Q8_6 =  2.3582460382545e-01;
Q8_7 = -8.3301028859275e-01;
Q8_8 =  0.0000000000000e+00;
Q8_9 =  8.3333655748509e-01;
Q8_10 = -2.3809523809524e-01;
Q8_11 =  5.9523809523809e-02;
Q8_12 = -9.9206349206349e-03;
Q8_13 =  7.9365079365079e-04;
Q8_14 =  0.0000000000000e+00;
Q9_0 =  4.4502749689556e-04;
Q9_1 = -1.0681515760869e-03;
Q9_2 =  1.3234579460680e-03;
Q9_3 = -1.3875650645663e-03;
Q9_4 =  5.0965470499782e-04;
Q9_5 =  9.0146730522360e-03;
Q9_6 = -5.9178678209520e-02;
Q9_7 =  2.3804321850015e-01;
Q9_8 = -8.3333655748509e-01;
Q9_9 =  0.0000000000000e+00;
Q9_10 =  8.3333333333333e-01;
Q9_11 = -2.3809523809524e-01;
Q9_12 =  5.9523809523809e-02;
Q9_13 = -9.9206349206349e-03;
Q9_14 =  7.9365079365079e-04;
for i = 1:BP
    for j = 1:BP
        Q(i,j) = eval(['Q' num2str(i-1) '_' num2str(j-1)]);
        Q(N+1-i,N+1-j) = -eval(['Q' num2str(i-1) '_' num2str(j-1)]);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Difference operator %%
D1 = H\Q;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [D1, H, x, dx] = D1_traditional(N, L, order)
 
switch order
	case 2
		fun = @D1_2nd;
	case 4
		fun = @D1_4th;
	case 6
		fun = @D1_6th;
	case 8
		fun = @D1_8th;
	case 10
		fun = @D1_10th;
	case 12
		fun = @D1_12th;
	otherwise
		error('That order is not available');
end

[D1, H, x, dx] = fun(N, L);

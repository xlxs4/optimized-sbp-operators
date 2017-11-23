function [D1, H, x, dx] = D1_accurate(N, L, order)
 
switch order
	case 4
		fun = @D1_accurate_4th;
	case 6
		fun = @D1_accurate_6th;
	case 8
		fun = @D1_accurate_8th;
	case 10
		fun = @D1_accurate_10th;
	case 12
		fun = @D1_accurate_12th;
	otherwise
		error('That order is not available');
end

[D1, H, x, dx] = fun(N, L);

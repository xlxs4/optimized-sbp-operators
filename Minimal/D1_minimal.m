function [D1, H, x, dx] = D1_minimal(N, L, order)
 
switch order
	case 4
		fun = @D1_minimal_4th;
	case 6
		fun = @D1_minimal_6th;
	case 8
		fun = @D1_minimal_8th;
	case 10
		fun = @D1_minimal_10th;
	case 12
		fun = @D1_minimal_12th;
	otherwise
		error('That order is not available');
end

[D1, H, x, dx] = fun(N, L);

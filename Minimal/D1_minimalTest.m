function tests = D1_minimalTest()
	    tests = functiontests(localfunctions);
end

function testBoundaryStencils(testCase)

    [orders, boundary_points, m, L] = parameterSetup();
    
    for o = 1:length(orders)
        order = orders(o);
        bp = boundary_points(o);
        pol = polynomials(order);

        [D1, ~, x] = D1_minimal(m, L, order);

        for q = 0:order/2

            f = pol{q+2};
            fp = pol{q+1};

            fpx = D1*f(x);
            fpx_exact = fp(x);
            err = abs(fpx - fpx_exact);
            err = [err(1:bp); err(end-bp+1:end)]; 

            testCase.verifyLessThan(err, 1e-11);
        end
    end
end

function testInterior(testCase)

    [orders, boundary_points, m, L] = parameterSetup();
    
    for o = 1:length(orders)
        order = orders(o);
        bp = boundary_points(o);
        pol = polynomials(order);

        [D1, ~, x] = D1_minimal(m, L, order);

        for q = 0:order

            f = pol{q+2};
            fp = pol{q+1};

            fpx = D1*f(x);
            fpx_exact = fp(x);
            err = abs(fpx - fpx_exact);
            err = err(bp+1:end-bp); 

            testCase.verifyLessThan(err, 1e-11);
        end
    end
end

function testGridSpacing(testCase)

    [orders, boundary_points, m, L] = parameterSetup();
    
    for o = 1:length(orders)
        order = orders(o);
        bp = boundary_points(o);
        pol = polynomials(order);

        [~, ~, x, h] = D1_minimal(m, L, order);
        h_grid = x(bp+1) - x(bp);

        err = abs(h-h_grid);
        testCase.verifyLessThan(err, 1e-12);
    end
end


function [pol] = polynomials(q)
    % Create cell array of polynomials
    pol = cell(q+2,1);
    pol{1} = @(x) 0*x;
    for p = 0:q
        pol{p+2} = @(x) x.^p/factorial(p);
    end
end

function [orders, boundary_points, m, L] = parameterSetup()
    orders = [4, 6, 8, 10, 12];
    boundary_points = [3, 5, 6, 8, 10];
    m = 41;
    L = 1;
end



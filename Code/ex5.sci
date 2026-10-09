function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    n_min = min([min(n1), min(n2)]);
    n_max = max([max(n1), max(n2)]);
    n = n_min:n_max;
    x1_ext = zeros(1, length(n));
    x2_ext = zeros(1, length(n));
    x1_ext(find(n >= min(n1) & n <= max(n1))) = x1n;
    x2_ext(find(n >= min(n2) & n <= max(n2))) = x2n;
    yn = x1_ext .* x2_ext;
    yorigin = 1 - n_min;
    
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    ny = (1:length(yn)) - yorigin;
    subplot(3, 1, 1);
    plot2d3(n1, x1n, style=2);
    plot(n1, x1n, 'ro');
    xtitle("Tin hieu x1(n)", "n", "x1(n)");
    xgrid();
    subplot(3, 1, 2);
    plot2d3(n2, x2n, style=3);
    plot(n2, x2n, 'go');
    xtitle("Tin hieu x2(n)", "n", "x2(n)");
    xgrid();
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'bs');
    xtitle("Tin hieu tich y(n) = x1(n) . x2(n)", "n", "y(n)");
    xgrid();
endfunction

x1n = [1, -2, 3, 6]; 
x1origin = 3;        
x2n = [2, 4, -1]; 
x2origin = 1;      
[yn, yorigin] = multi(x1n, x1origin, x2n, x2origin);

disp("yn = ", yn);
disp("yorigin = ", yorigin);

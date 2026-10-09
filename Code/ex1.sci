function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
    nx = (1:length(xn)) - xorigin;
    ny = nx + k;
    clf(); 
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);      
    plot(nx, xn, 'ro');            
    xtitle("Tín hiệu gốc x(n)", "n", "x(n)");
    xgrid();
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);      
    plot(ny, yn, 'bs');            
    xtitle("Tín hiệu trễ y(n) = x(n - " + string(k) + ")", "n", "y(n)");
    xgrid();
endfunction

xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;
[yn, yorigin] = delay(xn, xorigin, k);
disp("yn = ", yn);
disp("yorigin = ", yorigin);

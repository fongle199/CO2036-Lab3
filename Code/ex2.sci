function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;
    
    yorigin = xorigin + k;
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    figure(1);
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2); plot(nx, xn, 'ro');
    title("Tín hiệu gốc x(n)");
    xlabel("Chỉ số mẫu (n)"); ylabel("x(n)");
    xgrid();
    
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=3); plot(ny, yn, 'go');
    title("Tín hiệu tiến dịch y(n) = x(n + " + string(k) + ")");
    xlabel("Chỉ số mẫu (n)"); ylabel("y(n)");
    xgrid();
endfunction

xn = [1, -2, 3, 6];
xorigin = 3;
k = 2;

[yn, yorigin] = advance(xn, xorigin, k);

mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    x1n = x1n(:)';
    x2n = x2n(:)';

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    n_start = min(min(n1), min(n2));
    n_end   = max(max(n1), max(n2));
    ny      = n_start:n_end;
    
    x1_ext = zeros(1, length(ny));
    x2_ext = zeros(1, length(ny));
    
    idx1 = find(ny >= min(n1) & ny <= max(n1));
    idx2 = find(ny >= min(n2) & ny <= max(n2));
    
    x1_ext(idx1) = x1n;
    x2_ext(idx2) = x2n;
    
    yn = x1_ext + x2_ext;
    
    yorigin = 1 - n_start;
    
    figure(1);
    
    subplot(3, 1, 1);
    plot2d3(ny, x1_ext, style=2); plot(ny, x1_ext, 'ro');
    title("Tín hiệu x_1(n)"); xlabel("n"); ylabel("x_1(n)"); xgrid();
    
    subplot(3, 1, 2);
    plot2d3(ny, x2_ext, style=3); plot(ny, x2_ext, 'go');
    title("Tín hiệu x_2(n)"); xlabel("n"); ylabel("x_2(n)"); xgrid();
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5); plot(ny, yn, 'mo');
    title("Tín hiệu tổng y(n) = x_1(n) + x_2(n)"); xlabel("n"); ylabel("y(n)"); xgrid();
endfunction

x1n = [0, 1, 3, -2];
x1origin = 1;

x2n = [0, 1, 2, 3];
x2origin = 2;

[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);

mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);

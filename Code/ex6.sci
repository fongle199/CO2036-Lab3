function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    xn = xn(:)';
    hn = hn(:)';
    
    yn = convol(xn, hn);
    
    yorigin = xorigin + horigin - 1;
    
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    figure(1);
    
    subplot(3, 1, 1);
    plot2d3(nx, xn, style=2); plot(nx, xn, 'ro');
    title("Tín hiệu đầu vào x(n)");
    xlabel("Chỉ số mẫu (n)"); ylabel("x(n)");
    xgrid();
    
    subplot(3, 1, 2);
    plot2d3(nh, hn, style=3); plot(nh, hn, 'go');
    title("Đáp ứng xung hệ thống h(n)");
    xlabel("Chỉ số mẫu (n)"); ylabel("h(n)");
    xgrid();
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5); plot(ny, yn, 'mo');
    title("Tín hiệu chập đầu ra y(n) = x(n) * h(n)");
    xlabel("Chỉ số mẫu (n)"); ylabel("y(n)");
    xgrid();
endfunction

xn = [1, 2, 3]; xorigin = 2;
hn = [1, 1, 1]; horigin = 1;

[yn, yorigin] = convolution(xn, xorigin, hn, horigin);

mprintf("yn = "); disp(yn);
mprintf("yorigin = %d\n", yorigin);

// Hàm hỗ trợ lấy giá trị x(n)
function val = get_x(n_array)
    val = zeros(size(n_array));
    for i = 1:length(n_array)
        n_val = n_array(i);
        if n_val == -1 then val(i) = 1;
        elseif n_val == 0 then val(i) = 1;
        elseif n_val == 1 then val(i) = 1;
        elseif n_val == 2 then val(i) = 1;
        elseif n_val == 3 then val(i) = 0.5;
        elseif n_val == 4 then val(i) = 0.5;
        else val(i) = 0;
        end
    end
endfunction

n = -5:7;
x = get_x(n);

// Các biến đổi
ya = get_x(n - 2);            // (a) x(n-2)
yb = get_x(4 - n);            // (b) x(4-n)
yc = get_x(n + 2);            // (c) x(n+2)
yd = x .* (n <= 2);           // (d) x(n)u(2-n)
ye = get_x(n - 1) .* (n == 3);// (e) x(n-1)delta(n-3)
yf = get_x(n.^2);             // (f) x(n^2)
xe = 0.5 * (get_x(n) + get_x(-n)); // (g) Even part
xo = 0.5 * (get_x(n) - get_x(-n)); // (h) Odd part

// Vẽ các đồ thị minh họa
figure(1);
subplot(4, 2, 1); plot2d3(n, ya, style=2); plot(n, ya, 'ro'); title("(a) x(n-2)"); xgrid();
subplot(4, 2, 2); plot2d3(n, yb, style=3); plot(n, yb, 'go'); title("(b) x(4-n)"); xgrid();
subplot(4, 2, 3); plot2d3(n, yc, style=4); plot(n, yc, 'bo'); title("(c) x(n+2)"); xgrid();
subplot(4, 2, 4); plot2d3(n, yd, style=5); plot(n, yd, 'mo'); title("(d) x(n)u(2-n)"); xgrid();
subplot(4, 2, 5); plot2d3(n, ye, style=6); plot(n, ye, 'co'); title("(e) x(n-1)\delta(n-3)"); xgrid();
subplot(4, 2, 6); plot2d3(n, yf, style=2); plot(n, yf, 'ko'); title("(f) x(n^2)"); xgrid();
subplot(4, 2, 7); plot2d3(n, xe, style=3); plot(n, xe, 'ro'); title("(g) Even part x_e(n)"); xgrid();
subplot(4, 2, 8); plot2d3(n, xo, style=4); plot(n, xo, 'bo'); title("(h) Odd part x_o(n)"); xgrid();

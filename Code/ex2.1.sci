function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
endfunction

function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

nx = -3:3;
xorigin = 4; 

xn = zeros(1, length(nx));
for i = 1:length(nx)
    n_val = nx(i);
    if n_val >= -3 & n_val <= -1 then
        xn(i) = 1 + n_val / 3;
    elseif n_val >= 0 & n_val <= 3 then
        xn(i) = 1;
    else
        xn(i) = 0;
    end
end
disp("--- CAU (a): Giá trị x(n) ---");
disp("xn = ", xn);
disp("Cac mốc n tuong ung = ",nx);

// (b1) Lật x(n) trước, sau đó trễ 4 mẫu: y_b1(n) = x(-(n - 4)) = x(-n + 4)
[x_folded, xf_origin] = fold(xn, xorigin);
[yb1_n, yb1_origin] = delay(x_folded, xf_origin, 4);
ny_b1 = (1:length(yb1_n)) - yb1_origin;

// (b2) Trễ x(n) 4 mẫu trước, sau đó lật kết quả: y_b2(n) = x((-n) - 4) = x(-n - 4)
[x_delayed, xd_origin] = delay(xn, xorigin, 4);
[yb2_n, yb2_origin] = fold(x_delayed, xd_origin);
ny_b2 = (1:length(yb2_n)) - yb2_origin;

// (c) Biểu diễn tín hiệu x(-n + 4)
yc_n = yb1_n;
ny_c = ny_b1;

subplot(2, 2, 1);
plot2d3(nx, xn, style=2);
plot(nx, xn, 'ro');
xtitle("a.Tin hieu x(n)", "n", "x(n)");
xgrid();
subplot(2, 2, 2);
plot2d3(ny_b1, yb1_n, style=3);
plot(ny_b1, yb1_n, 'go');
xtitle("b1.Lat x(n) roi tre 4 mau: y(n) = x(-n + 4)", "n", "y(n)");
xgrid();
subplot(2, 2, 3);
plot2d3(ny_b2, yb2_n, style=5);
plot(ny_b2, yb2_n, 'bs');
xtitle("b2.Tre x(n) 4 mau roi lat: y(n) = x(-n - 4)", "n", "y(n)");
xgrid();
subplot(2, 2, 4);
plot2d3(ny_c, yc_n, style=2);
plot(ny_c, yc_n, 'm*');
xtitle("c.Tin hieu x(-n + 4)", "n", "x(-n+4)");
xgrid();

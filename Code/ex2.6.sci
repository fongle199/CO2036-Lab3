n = -4:7;

x = zeros(1, length(n));
x(find(n >= 0 & n <= 3)) = 1;

x2 = zeros(1, length(n));
x2(find(n >= 2 & n <= 5)) = 1;

y_sys1       = zeros(1, length(n));
y2_sys1      = zeros(1, length(n));
y_shift_sys1 = zeros(1, length(n));

for i = 1:length(n)
    n_val = n(i);
    idx_sq = find(n == (n_val^2));
    if ~isempty(idx_sq) then 
        y_sys1(i)  = x(idx_sq);
        y2_sys1(i) = x2(idx_sq);
    end
end

for i = 1:length(n)
    n_val = n(i);
    idx_sh = find(n == (n_val - 2));
    if ~isempty(idx_sh) then 
        y_shift_sys1(i) = y_sys1(idx_sh); 
    end
end

figure(1);

subplot(2, 1, 1);
plot2d3(n, y_shift_sys1, style=2); plot(n, y_shift_sys1, 'ro');
title("Hệ thống y(n)=x(n^2): Đáp ứng dịch y(n-2)"); 
xlabel("Chỉ số mẫu (n)"); ylabel("y(n-2)");
xgrid();

subplot(2, 1, 2);
plot2d3(n, y2_sys1, style=3); plot(n, y2_sys1, 'go');
title("Hệ thống y(n)=x(n^2): Đáp ứng với đầu vào dịch y_2(n)"); 
xlabel("Chỉ số mẫu (n)"); ylabel("y_2(n)");
xgrid();

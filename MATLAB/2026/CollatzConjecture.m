%% Collatz Conjecture: 冰雹猜想
% 当一个数为偶数时，除以二；当一个数为奇数时，乘以3加1
max_len = 1e4;
a_n = 27;
series = zeros(1, max_len);
i = 1;
while i <= max_len
  if mod(a_n, 2) == 0
    next_a_n = a_n / 2;
    series(i) = next_a_n;
  else
    next_a_n = a_n * 3 + 1;
    series(i) = next_a_n;
  end
  i = i+ 1;
  a_n = next_a_n;
  if next_a_n == 1
    break
  end
end

stem(series(1:i))
hold on
plot(series(1:i))
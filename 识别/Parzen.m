% Parzen窗算法
% w：c类训练样本
% x：测试样本
% h：参数
% 输出p：测试样本x落在每个类的概率
function p = Parzen(w,x,h)

[xt,yt,zt] = size(w);

p = zeros(1,zt);

for i = 1:zt
    hn = h;
    for j = 1:xt
        hn = hn / sqrt(j);
        p(i) = p(i) + exp(-(x - w(j,:,i))*(x - w(j,:,i))'/ (2 * power(hn,2))) / (hn * sqrt(2*3.14));
    end
    p(i) = p(i) / xt;
end
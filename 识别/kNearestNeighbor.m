% k-最近邻算法
% w：c类训练样本
% x：测试样本
% k：参数
function p = kNearestNeighbor(w,k,x)

% w = [w(:,:,1);w(:,:,2);w(:,:,3)];

[xt,yt,zt] = size(w);

wt = [];%zeros(xt*zt, yt);

if nargin==2
p = zeros(1,zt);
    for i = 1:xt
        for j = 1:xt
        dist(j,i) = norm(wt(i,:) - wt(j,:));
        end
        t(:,i) = sort(dist(:,i));
        m(:,i) = find(dist(:,i) <= t(k+1,i)); % 找到k个最近邻的编号
    end
end  

if nargin==3
    for q = 1:zt
    wt = [wt; w(:,:,q)];
    [xt,yt] = size(wt);
    end
        for i = 1:xt
        dist(i) = norm(x - wt(i,:));
        end
        t = sort(dist); % 欧氏距离排序
        [a,b] = size(t);

        m = find(dist <= t(k+1)); % 找到k个最近邻的编号

        num1 = length(find(m>0 & m<11));
        num2 = length(find(m>10 & m<21));
        num3 = length(find(m>20 & m<31));
if yt == 3
        plot3(w(:,1,1),w(:,2,1),w(:,3,1), 'r.');
        hold on;
        grid on;
        plot3(w(:,1,2),w(:,2,2),w(:,3,2), 'g.');
        plot3(w(:,1,3),w(:,2,3),w(:,3,3), 'b.');

if (num1 > num2) || (num1 > num3)
    plot3(x(1,1),x(1,2),x(1,3), 'ro');
    disp(['点：[',num2str(x),']属于第一类']);
elseif (num2 > num1) || (num2 > num3)
    plot3(x(1,1),x(1,2),x(1,3), 'go');
    disp(['点：[',num2str(x),']属于第二类']);
elseif (num3 > num1) || (num3 > num2)
    plot3(x(1,1),x(1,2),x(1,3), 'bo');
    disp(['点：[',num2str(x),']属于第三类']);
else
    disp('无法分类');
end
end

if yt == 2
        plot(w(:,1,1),w(:,2,1), 'r.');
        hold on;
        grid on;
        plot(w(:,1,2),w(:,2,2), 'g.');
        plot(w(:,1,3),w(:,2,3), 'b.');

if (num1 > num2) || (num1 > num3)
    plot(x(1,1),x(1,2), 'ro');
    disp(['点：[',num2str(x),']属于第一类']);
elseif (num2 > num1) || (num2 > num3)
    plot(x(1,1),x(1,2), 'go');
    disp(['点：[',num2str(x),']属于第二类']);
elseif (num3 > num1) || (num3 > num2)
    plot(x(1,1),x(1,2), 'bo');
    disp(['点：[',num2str(x),']属于第三类']);
else
    disp('无法分类');
end
end

end
title('k-最近邻分类器');
legend('第一类数据',...
       '第二类数据',...
       '第三类数据',...
       '测试样本点');
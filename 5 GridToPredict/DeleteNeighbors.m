% ����ͬһ����������������ʱ������ͬһ�����һ��GPS��Ϣ��ɾ���������ʱ������ͬһ�����GPS��Ϣ
function [taxi_grid] = DeleteNeighbors(data)

i = 1;
while i < length(data)
    if data(i) == data(i + 1)
        data(i + 1) = [];
    else
        i = i + 1;
    end
end
taxi_grid = data;
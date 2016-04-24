% �˺�������ͳ�Ƴ����ڲ�ͬ������ת�ƴ���
function [table] = TableStatistic(data, table)

% �ҳ���ͬ�ĳ���id
taxi_id = unique(data(:, 1));
taxi_num = size(taxi_id, 1);

% ��ÿһ�������б������������߹��Ĺ켣����Ӧ�����е���Ŀ��1
for i = 1:taxi_num
    taxi_tmp = data(data(:, 1) == taxi_id(i), :);
    % ����ʱ��˳�������������Ա�ͳ�ƹ켣״̬
    taxi_tmp = sortrows(taxi_tmp, 5);
    % ȡ�����ĵ�6�У���������
    taxi_grid = taxi_tmp(:, 6);
    % ����ͬһ����������������ʱ������ͬһ�����һ��GPS��Ϣ��ɾ���������ʱ������ͬһ�����GPS��Ϣ
    taxi_grid = DeleteNeighbors(taxi_grid);
    % ע��˴����ܳ��ֵ�״�������ڲ������ȵĹ�ϵ���������п�����һ�������У�����ǰ��������������������ڣ������Ҫ�жϡ�
    % �����ǰһ��������������ȹ�ϸ���͵ȴ���һ��GPS�켣����ȥ��λ��������Ǻ�һ�����������
    taxi_grid_num = size(taxi_grid, 1);
    if (taxi_grid_num >= 3)
        for j = 1:(taxi_grid_num - 2)
            pre_grid = taxi_grid(j);
            curr_grid = taxi_grid(j + 1);
            next_grid = taxi_grid(j + 2);
            row1 = find(table(:, 1) == pre_grid);
            row2 = find(table(:, 2) == curr_grid);
            row3 = find(table(:, 3) == next_grid);
            row4 = intersect(row1, row2);
            row = intersect(row3, row4);
            if (size(row, 1) > 0)
                table(row, 4) = table(row, 4) + 1;
            end
        end
    end
end
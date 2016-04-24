% �˺�����������table����ʾ����֮��Ĺ�ϵ������Ԥ�������ת�Ƹ���
function [table] = CalculateNeighborGrid(row_num, col_num)

table = [];
grid_num = row_num * col_num;

for i_grid = 1:grid_num
    neighbor_grid = [];
    % ����i������С���ֵ
    i_row = ceil(i_grid / col_num);
    i_col = i_grid - (i_row - 1) * col_num;
    % ���ݵ�ǰ��������ھ�����
    % �����Ϸ�����ʼ��˳ʱ���ж�
    % ���Ϸ�����
    row = i_row + 1;
    col = i_col - 1;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ���Ϸ�����
    row = i_row + 1;
    col = i_col;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ���Ϸ�����
    row = i_row + 1;
    col = i_col + 1;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ���ҷ�����
    row = i_row;
    col = i_col + 1;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ���·�����
    row = i_row - 1;
    col = i_col + 1;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ���·�����
    row = i_row - 1;
    col = i_col;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ���·�����
    row = i_row - 1;
    col = i_col - 1;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    % ��������
    row = i_row;
    col = i_col - 1;
    if row >= 1 && row <= row_num && col >= 1 && col <= col_num
        neighbor_grid = [neighbor_grid; (row - 1) * col_num + col];
    end
    neighbor_grid_num = size(neighbor_grid, 1);
    % ����table
    for i = 1:neighbor_grid_num
        for j = 1:neighbor_grid_num
            table = [table; neighbor_grid(i) i_grid  neighbor_grid(j) 0];
        end
    end
end

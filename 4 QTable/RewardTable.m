% �˺�����������Reward��
function [RTable] = RewardTable(row_num, col_num)

% ����������������ʼ��Reward��
grid_num = row_num * col_num;
RTable = zeros(grid_num, grid_num, grid_num);

% ��ÿһ��Ŀ���������ѭ��
for dest_grid = 1:grid_num
    % ����Ŀ�������Reward���ʼ��ֵΪ-1
    RTable(:, :, dest_grid) = ones(grid_num, grid_num) * -1;
    % ÿһ��Ŀ����������£�������Reward��
    for i_grid = 1:grid_num
        % ����i������С���ֵ
        i_col = ceil(i_grid / row_num);
        i_row = i_grid - (i_col - 1) * row_num;
        for j_grid = 1:grid_num
            % ����j������С���ֵ
            j_col = ceil(j_grid / row_num);
            j_row = j_grid - (j_col - 1) * row_num;
            % �ж�i��j�Ƿ�ɴ����ɴ���jΪĿ��������RewardֵΪ100������ɴ���j��Ŀ��������RewardֵΪ0
            % �ж�i��j�Ƿ�Ϊͬһ��
            if (i_grid == j_grid)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����Ϸ�
            if (i_row == j_row - 1 && i_col == j_col - 1)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����Ϸ�
            if (i_row == j_row - 1 && i_col == j_col)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����Ϸ�
            if (i_row == j_row - 1 && i_col == j_col + 1)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����ҷ�
            if (i_row == j_row && i_col == j_col + 1)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����·�
            if (i_row == j_row + 1 && i_col == j_col + 1)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����·�
            if (i_row == j_row + 1 && i_col == j_col)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j�����·�
            if (i_row == j_row + 1 && i_col == j_col - 1)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
            % �ж�i���Ƿ���j������
            if (i_row == j_row && i_col == j_col - 1)
                if (j_grid == dest_grid)
                    RTable(i_grid, j_grid, dest_grid) = 100;
                else
                    RTable(i_grid, j_grid, dest_grid) = 0;
                end
            end
        end
    end
end

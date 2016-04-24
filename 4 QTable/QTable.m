
% ͨ������GridCountStatistics��ȡ��������������������GPS����
[row_num, col_num, grid_num, grid_list] = GridCountStatistics();
% ����ÿ������ÿ���ƽ����
grid_cnt = sum(grid_list, 2) / size(grid_list, 2);
% ��������ƽ����
avg = sum(grid_cnt) / grid_num;

% ͨ������RewardTable��ȡReward��
[RTable] = RewardTable(row_num, col_num);

% ͨ������QLearning����Qֵ��
Q = zeros(grid_num, grid_num, grid_num);
for dest_grid = 1:grid_num
    Q(:, :, dest_grid) = QLearning(RTable(:, :, dest_grid), grid_cnt, avg);
end

% ����Qֵ��
save QTable Q
% �˺�������ͳ��ĳһʱ��β�ͬ�����ڵĳ�����
function [row_num, col_num, grid_num, grid_list] = GridCountStatistics()

% �����2���õ�������Χ�ڵ�GPS����
load('taxi20070201.mat');
load('taxi20070202.mat');
load('taxi20070203.mat');
load('taxi20070204.mat');
load('taxi20070205.mat');
load('taxi20070206.mat');
load('taxi20070207.mat');
load('taxi20070208.mat');
load('taxi20070209.mat');

% ��������
days = 9;
% ������������
region_x = 1211313.0;
region_y = 3482427.0;
% ��������Χ
length = 1500.0;
x_min = region_x - length;
x_max = region_x + length;
y_min = region_y - length;
y_max = region_y + length;
% �����������
grid_length = 500;                              % ����߳�
row_num = ceil((x_max - x_min) / grid_length);	% ��������=6
col_num = ceil((y_max - y_min) / grid_length);	% ��������=6
grid_num = row_num * col_num;                   % ������=36

% ѡ��ָ��ʱ����ڵ�GPS����
t_start = 10 * 60 * 60;                         % ��ʼʱ��Ϊ10��
t_end = 11 * 60 * 60;                           % ��ֹʱ��Ϊ11��
taxi20070201 = taxi20070201(taxi20070201(:, 5) >= t_start & taxi20070201(:, 5) < t_end, :);
taxi20070202 = taxi20070202(taxi20070202(:, 5) >= t_start & taxi20070202(:, 5) < t_end, :);
taxi20070203 = taxi20070203(taxi20070203(:, 5) >= t_start & taxi20070203(:, 5) < t_end, :);
taxi20070204 = taxi20070204(taxi20070204(:, 5) >= t_start & taxi20070204(:, 5) < t_end, :);
taxi20070205 = taxi20070205(taxi20070205(:, 5) >= t_start & taxi20070205(:, 5) < t_end, :);
taxi20070206 = taxi20070206(taxi20070206(:, 5) >= t_start & taxi20070206(:, 5) < t_end, :);
taxi20070207 = taxi20070207(taxi20070207(:, 5) >= t_start & taxi20070207(:, 5) < t_end, :);
taxi20070208 = taxi20070208(taxi20070208(:, 5) >= t_start & taxi20070208(:, 5) < t_end, :);
taxi20070209 = taxi20070209(taxi20070209(:, 5) >= t_start & taxi20070209(:, 5) < t_end, :);

% ��ʼ�����ݣ���36�У�9��
grid_list = zeros(grid_num, days);

% ͳ��ÿ��ÿ�������������
% 20070201
data = taxi20070201;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 1) = grid_list(grid_id, 1) + 1;
end
% 20070202
data = taxi20070202;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 2) = grid_list(grid_id, 2) + 1;
end
% 20070203
data = taxi20070203;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 3) = grid_list(grid_id, 3) + 1;
end
% 20070204
data = taxi20070204;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 4) = grid_list(grid_id, 4) + 1;
end
% 20070205
data = taxi20070205;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 5) = grid_list(grid_id, 5) + 1;
end
% 20070206
data = taxi20070206;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 6) = grid_list(grid_id, 6) + 1;
end
% 20070207
data = taxi20070207;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 7) = grid_list(grid_id, 7) + 1;
end
% 20070208
data = taxi20070208;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 8) = grid_list(grid_id, 8) + 1;
end
% 20070209
data = taxi20070209;
for i = 1:size(data, 1)
    % ��ȡ��ǰ���ݵ�������
    grid_id = data(i, 6);
    % ����Ӧ�������������1
    grid_list(grid_id, 9) = grid_list(grid_id, 9) + 1;
end

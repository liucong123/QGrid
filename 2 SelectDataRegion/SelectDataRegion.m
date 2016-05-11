% ������������
load('taxi20070201_all.mat');
load('taxi20070202_all.mat');
load('taxi20070203_all.mat');
load('taxi20070204_all.mat');
load('taxi20070205_all.mat');
load('taxi20070206_all.mat');
load('taxi20070207_all.mat');
load('taxi20070208_all.mat');
load('taxi20070209_all.mat');

% ȥ���ظ�����
taxi20070201 = unique(taxi20070201_all, 'rows');
taxi20070202 = unique(taxi20070202_all, 'rows');
taxi20070203 = unique(taxi20070203_all, 'rows');
taxi20070204 = unique(taxi20070204_all, 'rows');
taxi20070205 = unique(taxi20070205_all, 'rows');
taxi20070206 = unique(taxi20070206_all, 'rows');
taxi20070207 = unique(taxi20070207_all, 'rows');
taxi20070208 = unique(taxi20070208_all, 'rows');
taxi20070209 = unique(taxi20070209_all, 'rows');

% ������������
region_x = 1211313.0;
region_y = 3482427.0;
% ��������Χ
length = 1500.0;
x_min = region_x - length;
x_max = region_x + length;
y_min = region_y - length;
y_max = region_y + length;
% ��������߳�
grid_length = 500;

% ȥ����������Χ�ڵ�����
taxi20070201 = taxi20070201((taxi20070201(:,2) >= x_min) & (taxi20070201(:,2) <= x_max) & (taxi20070201(:,3) >= y_min) & (taxi20070201(:,3) <= y_max),:);
taxi20070202 = taxi20070202((taxi20070202(:,2) >= x_min) & (taxi20070202(:,2) <= x_max) & (taxi20070202(:,3) >= y_min) & (taxi20070202(:,3) <= y_max),:);
taxi20070203 = taxi20070203((taxi20070203(:,2) >= x_min) & (taxi20070203(:,2) <= x_max) & (taxi20070203(:,3) >= y_min) & (taxi20070203(:,3) <= y_max),:);
taxi20070204 = taxi20070204((taxi20070204(:,2) >= x_min) & (taxi20070204(:,2) <= x_max) & (taxi20070204(:,3) >= y_min) & (taxi20070204(:,3) <= y_max),:);
taxi20070205 = taxi20070205((taxi20070205(:,2) >= x_min) & (taxi20070205(:,2) <= x_max) & (taxi20070205(:,3) >= y_min) & (taxi20070205(:,3) <= y_max),:);
taxi20070206 = taxi20070206((taxi20070206(:,2) >= x_min) & (taxi20070206(:,2) <= x_max) & (taxi20070206(:,3) >= y_min) & (taxi20070206(:,3) <= y_max),:);
taxi20070207 = taxi20070207((taxi20070207(:,2) >= x_min) & (taxi20070207(:,2) <= x_max) & (taxi20070207(:,3) >= y_min) & (taxi20070207(:,3) <= y_max),:);
taxi20070208 = taxi20070208((taxi20070208(:,2) >= x_min) & (taxi20070208(:,2) <= x_max) & (taxi20070208(:,3) >= y_min) & (taxi20070208(:,3) <= y_max),:);
taxi20070209 = taxi20070209((taxi20070209(:,2) >= x_min) & (taxi20070209(:,2) <= x_max) & (taxi20070209(:,3) >= y_min) & (taxi20070209(:,3) <= y_max),:);

% ��ÿ�����ݣ����2�У���һ��Ϊ��ǰ���������ţ��ڶ���Ϊ��һ��ʱ�������������
row_num = ceil((y_max- y_min) / grid_length);
[taxi20070201] = AddGridInfo(taxi20070201, grid_length, x_min, y_min, row_num);
[taxi20070202] = AddGridInfo(taxi20070202, grid_length, x_min, y_min, row_num);
[taxi20070203] = AddGridInfo(taxi20070203, grid_length, x_min, y_min, row_num);
[taxi20070204] = AddGridInfo(taxi20070204, grid_length, x_min, y_min, row_num);
[taxi20070205] = AddGridInfo(taxi20070205, grid_length, x_min, y_min, row_num);
[taxi20070206] = AddGridInfo(taxi20070206, grid_length, x_min, y_min, row_num);
[taxi20070207] = AddGridInfo(taxi20070207, grid_length, x_min, y_min, row_num);
[taxi20070208] = AddGridInfo(taxi20070208, grid_length, x_min, y_min, row_num);
[taxi20070209] = AddGridInfo(taxi20070209, grid_length, x_min, y_min, row_num);

% ��������Χ�ڵ�����
save taxi20070201 taxi20070201
save taxi20070202 taxi20070202
save taxi20070203 taxi20070203
save taxi20070204 taxi20070204
save taxi20070205 taxi20070205
save taxi20070206 taxi20070206
save taxi20070207 taxi20070207
save taxi20070208 taxi20070208
save taxi20070209 taxi20070209
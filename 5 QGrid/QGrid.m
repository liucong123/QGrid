% QGrid_G��ʹ��̰��ѡ�����

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
% �������ڴ�Ž���ľ���data
data = [];

% ��������
load('taxi20070201.mat');
% ����Qֵ��
load('QTable.mat');

% �������ļ�¼����������Ϣ
row_num = ceil((y_max- y_min) / grid_length);
[taxi20070201] = AddGridInfo(taxi20070201, grid_length, x_min, y_min, row_num);
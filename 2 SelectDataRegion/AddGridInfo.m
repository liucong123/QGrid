% ���ڸ�ÿһ����¼�����һ��ʱ�̵�������
function [output_args] = AddGridInfo(input_args, grid_length, x_min, y_min, row_num)

% ���������ݽ����������ȳ���ID�����ʱ��
input_args = sortrows(input_args, [1, 5]);
% �½�����grid_id����input_args������ͬ����2�У���һ��Ϊ��ǰ���񣬵ڶ���Ϊ��һ������
grid_id = zeros(size(input_args, 1), 2);
% ������һ�����⳵idΪ0�������ֵ�һ������
pre_taxi_id = 0;
for i = 1:size(input_args, 1)
    % ��ǰ���⳵id
    curr_taxi_id = input_args(i, 1);
    % ��ǰ���⳵��������
    x = ceil((input_args(i, 2) - x_min) / grid_length);
    y = ceil((input_args(i, 3) - y_min) / grid_length);
    grid = (x - 1) * row_num + y;
    % ����ǰ����Ŵ���grid_id��һ��
    grid_id(i, 1) = grid;
    % �����ǰ�����Ǹó���ID�ĵ�һ�����ݣ�����һ�������Ǳ�����������һ��ʱ��������
    if (curr_taxi_id ~= pre_taxi_id)
        grid_id(i, 2) = grid;
    else
        grid_id(i, 2) = grid_id(i - 1, 1);
    end
    % �޸���һ�����⳵idֵ
    pre_taxi_id = curr_taxi_id;
end
% �������Ϊinput_args��grid_id
[output_args] = [input_args grid_id];
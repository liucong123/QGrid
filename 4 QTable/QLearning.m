% �˺�������Qѧϰ�㷨��ʵ��
function [QTable] = QLearning(RTable, grid_cnt, avg)

% [RTable] = RewardTable(6, 6);
% RTable = RTable(:, :, 1);
% grid_cnt = 36;
% avg = 0;

% ����Qֵ�����
alpha = 0.8;
QTable = zeros(size(RTable));

% ��������ѧϰ
for episode = 0:50000
    % ���ѡ��һ��״̬
    y = randperm(size(RTable, 1));      % ����������������ҳ�һ������
    state = y(1);                       % ȡ��������еĵ�һ��ֵ��Ϊ״ֵ̬state
    x = find(RTable(state,:) >= 0);     % Ѱ��state���ܵ���һ��״̬����Reward���е�state��ֵ���ڵ���0��������
    if size(x, 1) > 0
        x0 = RandomPermutation(x);      % ��state���ܵ���һ��״̬������ҳ�һ������
        x0 = x0(1);                     % ȡ��������еĵ�һ��ֵ��Ϊ��һ��״̬x0
        taxi_num = grid_cnt(x0);        % taxi_numΪx0�����������
        % ���������Ŀ����ƽ��ֵ
        % �����ĳ���һ�����������ۿ�������Ϊ0.9,
        % ������Ϊ����*0.6
        % ������Ŀ������ƽ��ֵ
        % ���С�ĳ���һ�����������ۿ�������Ϊ0.3
        % ������Ϊ����*0.6
        if taxi_num > avg
            if taxi_num / avg * 0.6 > 0.9
                gamma = 0.9;
            else
                gamma = taxi_num / avg * 0.6;
            end
        else if taxi_num / avg * 0.6 < 0.3
                gamma = 0.3;
            else
                gamma = taxi_num / avg * 0.6;
            end
        end
    end
    % Ѱ��x0���ܵ���һ��״̬�����ڼ���QTable_max=max(QTable(x0,x0_next))
    x0_next = find(RTable(x0,:) >= 0);
    QTable_max = 0;
    for i = 1:size(x0_next, 2)
        q_val = QTable(x0, x0_next(i));
        QTable_max = max(QTable_max, q_val);
    end
    % ����Qֵ����QTable(state, x0)��ֵ
    QTable(state, x0) = (1 - alpha) * QTable(state, x0) + alpha * (RTable(state, x0) + gamma * QTable_max);
end

% �淶��Qֵ����Qֵ�������ֵΪ100��
g = max(max(QTable));
if g > 0
    QTable = 100 * QTable / g; 
end
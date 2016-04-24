% �˺�������Qѧϰ�㷨��ʵ��
function [QTable] = QLearning(RTable, grid_cnt, avg)

% [RTable] = RewardTable(6, 6);
% RTable = RTable(:, :, 1);
% grid_cnt = 36;
% avg = 0;

% ����Qֵ�����
gamma = 0.8;
QTable = zeros(size(RTable));
QTable1 = ones(size(RTable)) * inf;
cnt = 0;

% ��������ѧϰ
for episode = 0:50000
    % ���ѡ��һ��״̬
    y = randperm(size(RTable, 1));      % ����������������ҳ�һ������
    state = y(1);                       % ȡ��������еĵ�һ��ֵ��Ϊ״ֵ̬state
    x = find(RTable(state,:) >= 0);     % Ѱ��state���ܵ���һ��״̬����Reward���е�state��ֵ���ڵ���0��������
    if size(x, 1) > 0
        x0 = RandomPermutation(x);      % ��state���ܵ���һ��״̬������ҳ�һ������
        taxi_num = grid_cnt(x0(1));     % ������������
        % ���������Ŀ����ƽ��ֵ
        % �����ĳ���һ�����������ۿ�������Ϊ0.9,
        % ������Ϊ����*0.7
        % ������Ŀ������ƽ��ֵ
        % ���С�ĳ���һ�����������ۿ�������Ϊ0.5
        % ������Ϊ����*0.7
        if taxi_num > avg
            if taxi_num / avg * 0.7 > 0.9
                gamma_x0 = 0.9;
            else
                gamma_x0 = taxi_num / avg * 0.7;
            end
        else if taxi_num / avg * 0.7 < 0.5
                gamma_x0 = 0.5;
            else
                gamma_x0 = taxi_num / avg * 0.7;
            end
        end
        x0 = x0(1);                     % ȡ��������еĵ�һ��ֵ��Ϊ��һ��״̬x0
    end
    % Ѱ��x0���ܵ���һ��״̬�����ڼ���QTable_max=max(QTable(x0,x0_next))
    x0_next = find(RTable(x0,:) >= 0);
    QTable_max = 0;
    for i = 1:size(x0_next, 2)
        q_val = QTable(x0, x0_next(i));
        QTable_max = max(QTable_max, q_val);
    end
    % ����Qֵ����QTable(state, x0)��ֵ
    QTable(state, x0) = (1 - gamma) * QTable(state, x0) + gamma * (RTable(state, x0) + gamma_x0 * QTable_max);
    if sum(sum(abs(QTable1 - QTable))) < 0.0001 && sum(sum(QTable > 0))
        if cnt > 1000
            break
        else
            cnt = cnt + 1;
        end
    else
        QTable1 = QTable;
        cnt = 0;
    end
end

% �淶��Qֵ����Qֵ�������ֵΪ100��
g = max(max(QTable));
if g > 0
    QTable = 100 * QTable / g; 
end
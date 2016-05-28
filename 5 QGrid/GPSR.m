% GPSR

% ��������
load('taxi20070201.mat');
load('taxi20070202.mat');
load('taxi20070203.mat');
load('taxi20070204.mat');
load('taxi20070205.mat');
load('taxi20070206.mat');
load('taxi20070207.mat');
load('taxi20070208.mat');
load('taxi20070209.mat');

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
load('taxi20070209.mat');

% QGrid
for radius = 200:100:500 %radius = 200:100:500
    for t_delta = 5:5:20 %t_delta = 5:5:20
        for TTL = 10:10:50 %TTL = 10:10:50
            gps_data = taxi20070209;
            % ѡ��ָ��ʱ����ڵ�GPS����
            t_start = 10 * 60 * 60;     % ��ʼʱ��Ϊ10��
            t_end = 11 * 60 * 60;       % ��ֹʱ��Ϊ11��
            gps_data = gps_data(gps_data(:, 5) >= t_start & gps_data(:, 5) < t_end, :);
            % ��ʱ���Ƭ�������Ϊt_delta
            gps_data(:, 5) = floor(gps_data(:, 5) / t_delta);
            % ���gps_dataΪ�գ�������
            if size(gps_data, 1) <= 0
                continue;
            end
            
            % *****������Ϣ����*****
            % ����1s����10����Ϣ,��һ��ʱ��Ƭ�ڲ���t_delta*10����Ϣ
            message_delta_num = t_delta * 10;
            % ��¼��Ϣ������
            message_cnt = 0;
            % ��¼��ͬ��Ϣ�����������������ƺ����ֵ
            message_id = 0;
            message = [];
            % ������ʼʱ��
            start_time = min(gps_data(:,5));
            end_time = max(gps_data(:,5));
            for time = start_time:end_time
                select_taxi = gps_data(gps_data(:, 5) == time, :);
                % �п���һ��ʱ��Ƭ��һ�����Ķ�����¼�����Ҫ����ȥ��
                [B,I,J] = unique(select_taxi(:,1));
                select_taxi = select_taxi(I,:);
                if size(select_taxi, 1) <= 0
                    continue;
                end
                
                % ***������Ϣ***
                % ��ʼ��һ��ʱ��Ƭ�ڲ�����������Ϣ
                % ÿ��ʱ��β���һ����������Ϣ,end_time-TTL���ٲ����µ���Ϣ
                if (time < end_time - TTL)
                    for i = 1:message_delta_num
                        message_cnt = message_cnt + 1;
                        message_id = message_id + 1;
                        % ���ѡȡԴ�ڵ�
                        source_id_row = randi(size(select_taxi,1)); % ���ѡȡ��ʱ���GPS���ݵ�һ��
                        source_grid = select_taxi(source_id_row, 6);% Դ�ڵ㳵�����ڵ�������
                        source_taxi = select_taxi(source_id_row, 1);% Դ�ڵ㳵����id
                        % ���ѡȡĿ��ڵ�
                        dest_id_row = randi(size(gps_data,1));      % ���ѡȡ����ʱ���GPS���ݵ�һ��
                        dest_grid = gps_data(dest_id_row, 6);       % Ŀ��ڵ�����
                        dest_x = gps_data(dest_id_row, 2);          % Ŀ��ڵ�x����
                        dest_y = gps_data(dest_id_row, 3);          % Ŀ��ڵ�y����
                        % ��ǰ��Ϣ
                        curr_grid = source_grid;                    % Я����Ϣ�������ڵ�������
                        curr_taxi = source_taxi;                    % Я����Ϣ������id
                        % ��Ϣ����
                        message(message_cnt, 1) = message_id;       % ��Ϣ���
                        message(message_cnt, 2) = source_grid;      % Դ�ڵ�������
                        message(message_cnt, 3) = source_taxi;      % Դ�ڵ㳵��ID
                        message(message_cnt, 4) = curr_grid;        % Я����Ϣ�������ڵ�������
                        message(message_cnt, 5) = curr_taxi;        % Я����Ϣ������id
                        message(message_cnt, 6) = dest_grid;        % Ŀ��ڵ�������
                        message(message_cnt, 7) = dest_x;           % Ŀ��ڵ�x����
                        message(message_cnt, 8) = dest_y;           % Ŀ��ڵ�y����
                        message(message_cnt, 9) = time;             % ��Ϣ������ʱ��
                        message(message_cnt, 10) = TTL;             % ��Ϣ��TTL
                        message(message_cnt, 11) = 0;               % ��Ϣ���ݵ�����
                        message(message_cnt, 12) = 0;               % ��Ϣ�Ƿ���ɹ����ɹ�Ϊ1���ȴ�����Ϊ0
                    end
                end
                
                % ***������Ϣ***
                % ��һʱ�̵����г�������Ϣ�Ѿ�ѡ����select_taxi
                taxi_gps_message = select_taxi;
                for message_i = 1:message_cnt
                    % �����Ϣ�ȴ����䣬��TTLδ����
                    if message(message_i, 12) == 0 && message(message_i, 10) >= 1
                        % ���ȸ��µ�ǰ��Ϣ������λ�á���ʱѰ��Я������Ϣ�ĳ�����ȥ�ж������Ϣ���ڵ�����
                        taxi_id = message(message_i, 5);
                        curr_message_row = find(taxi_gps_message(:, 1) == taxi_id);
                        % ��ʱ�иó����ļ�¼
                        if size(curr_message_row, 1) > 0
                            % Ŀǰ��Ϣ���ڵ�����
                            state = taxi_gps_message(curr_message_row, 6);
                            % Ŀ������
                            dest = message(message_i, 6);
                            % �жϵ�ǰ�ڵ���Ŀ�Ľڵ�ľ��룬�����жϵ�ǰ������Ŀ������Ĺ�ϵ
                            curr_x0 = taxi_gps_message(curr_message_row, 2);
                            curr_y0 = taxi_gps_message(curr_message_row, 3);
                            dest_x0 = message(message_i, 7);
                            dest_y0 = message(message_i, 8);
                            curr_dist = CalculateDistance(curr_x0, curr_y0, dest_x0, dest_y0);
                            % ���Ŀ��ڵ��ڵ�ǰ�ڵ�ͨ�ŷ�Χ�ڣ�������Ϣ
                            if (curr_dist <= radius)
                                message(message_i, 11) = message(message_i, 11) + 1;
                                message(message_i, 12) = 1;
                                disp('**********�ɹ�һ��**********');
                                continue;
                            % ��������Χ����Ŀ��ڵ�����ĳ���Ϊ��һ������������Ϊ����
                            else
                                % ��ɸѡ����ǰ�ڵ���Χ���������ڵĽڵ㣨�����α߳�=�뾶*2��
                                neighbor_candidate = taxi_gps_message((taxi_gps_message(:,2)>(taxi_gps_message(curr_message_row,2)-radius))&...
                                	(taxi_gps_message(:,2)<(taxi_gps_message(curr_message_row,2)+radius))&...
                                   	(taxi_gps_message(:,3)>(taxi_gps_message(curr_message_row,3)-radius))&...
                                   	(taxi_gps_message(:,3)<(taxi_gps_message(curr_message_row,3)+radius)),:);
                                % �������������ڣ�ɸѡ�����䷶Χ�ڵĽڵ�
                                if size(neighbor_candidate, 1) > 0
                                    neighbor_num = 0;
                                    neighbor = [];
                                    for candidate_i = 1:size(neighbor_candidate, 1)
                                        candidate_x1 = neighbor_candidate(candidate_i, 2);
                                        candidate_y1 = neighbor_candidate(candidate_i, 3);
                                        candidate_x2 = taxi_gps_message(curr_message_row, 2);
                                        candidate_y2 = taxi_gps_message(curr_message_row, 3);
                                        candidate_dist = CalculateDistance(candidate_x1, candidate_y1, candidate_x2, candidate_y2);
                                        if candidate_dist <= radius
                                            neighbor_num = neighbor_num + 1;
                                            neighbor(neighbor_num, :) = neighbor_candidate(candidate_i, :);
                                        end
                                    end
                                    % �Ӵ��䷶Χ�ڵĽڵ㣬Ѱ�Ҿ���Ŀ��ڵ�����Ľڵ㴫����Ϣ
                                    if neighbor_num > 0
                                        delta_x = neighbor(:, 2) - message(message_i, 7);
                                        delta_y = neighbor(:, 3) - message(message_i, 8);
                                        neighbor_dist = sqrt(delta_x.^2 + delta_y.^2);
                                        min_dist = min(neighbor_dist);
                                        % ����ýڵ㵽Ŀ��ڵ����ȵ�ǰ�ڵ㵽Ŀ��ڵ����������򴫵ݸ���Ϣ
                                        if min_dist < curr_dist
                                            % ѡ��������̵���һ��������Ϣ�������ж��
                                            next_taxi = neighbor(neighbor_dist == min_dist,:);
                                            % ����ж�������ѡ��һ�������ֻ��һ��������Ľ�����Ǳ���
                                            next_taxi_row = randi(size(next_taxi,1));
                                            next_taxi = next_taxi(next_taxi_row,:);
                                            % ����message��Ϣ
                                            message(message_i, 4) = next_taxi(1, 6);
                                            message(message_i, 5) = next_taxi(1, 1);
                                            message(message_i, 11) = message(message_i, 11) + 1;
                                            disp('��Ϣ���ݵ���Χ�ĳ���');
                                            continue;
                                        end
                                    else
                                        continue;
                                    end
                                else
                                    continue;
                                end
                            end
                        else
                            continue;
                        end
                    else
                        continue;
                    end
                end
                % ���һ��ѭ������Ϣ��Ȼû�д��ݳɹ�����TTL��1
                row = find (message(:, 12) == 0 & message(:, 10) > 0);
                if size(row, 1) > 0
                    message(row, 10) = message(row, 10) - 1;
                end
            end
            % *****������Ϣ����*****
            
            % ��Ϣͳ��
            delivery_ratio = sum(message(:, 12)) / message_cnt;
            success_message = message(message(:, 12) == 1, :);          % ����ɹ�����Ϣ
            % ����ȥ�ش�������һ����ͬmessage_id����Ϣȥ��
            [B I J] = unique(success_message(:, 1), 'rows');
            success_message = success_message(I, :);
            success_num = size(success_message, 1);                     % ����ɹ���Ϣ������
            success_skip = sum(success_message(:, 11)) / success_num;   % ����ɹ�����Ϣ��ƽ������
            success_delay = (success_num * TTL - sum(success_message(:, 10))) / success_num;    % ����ɹ�����Ϣ��ƽ���ӳ�
            number_of_forwarding = sum(message(:, 11)) / message_cnt;
            data = [data; grid_length, radius, t_delta, TTL, delivery_ratio, success_num, success_skip, success_delay, number_of_forwarding];
        end
    end
end

xlswrite('GPSR.xls', data, 'sheet1', 'A1');

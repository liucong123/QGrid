% �˺������ڽ�����A��Ԫ��ȫ������˳���������
function y = RandomPermutation(A)

[r, c] = size(A);
b = reshape(A, r * c, 1);       % convert to column vector
x = randperm(r * c);            % make integer permutation of similar array as key
w = [b, x'];                    % combine matrix and key
d = sortrows(w, 2);             % sort according to key
y = reshape(d(:, 1), r, c);     % return back the matrix

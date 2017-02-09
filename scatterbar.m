function scatterbar(x,y,z,scale)
%   ����ɢ�����ݻ���3ά��ɫ��״ͼ
%   scatterbar(x,y,z,scale)  x,y,z��ʵֵ���飬����ָ�����Ӷ������ĵ���ά���ꡣ
%              scale�Ǵ���0�ı���������ָ�����ӵĴ�ϸ��scaleԽ������Խϸ��Ĭ
%              ������¸���������Զ��������ӵĴ�ϸ��
%
%   CopyRight:xiezhh��л�л���
%   2011.10.31
%   Example��
%       [x,y] = meshgrid(-6:6,-3:0.5:3);
%       z = mvnpdf([x(:),y(:)],[0,0],[4,0;0,1]);
%       scatterbar(x,y,z)
%       scatterbar(x,y,z,50);

% ������������ж�
if nargin < 3
    error('������Ҫ�����������');
end
if ~isreal(x) || ~isreal(y) || ~isreal(z)
    error('ǰ��������ӦΪʵֵ����');
end

% ��ȡx,y,z�ȳ����ֵ�Ԫ��
x = x(:);
y = y(:);
z = z(:);
n = min([numel(x) numel(y) numel(z)]);
x = x(1:n);
y = y(1:n);
z = z(1:n);

% ���㼫��Ͳ��ֵ
rx = range(x);
ry = range(y);
dx = abs(diff(x));
dx = min(dx(dx>0));
dy = abs(diff(y));
dy = min(dy(dy>0));

% �Զ��������ӵĴ�ϸ
if nargin == 3
    if ~isempty(dx)
        hx = dx/2;
    else
        hx = 0.5;
    end
    if ~isempty(dy)
        hy = dy/2;
    else
        hy = 0.5;
    end
end

% �����û��������scale�������ӵĴ�ϸ
if nargin == 4
    if ~isreal(scale) || scale < 0
        error('���ĸ�����ӦΪ���ı���');
    end
    if rx == 0 && ry == 0
        rx = 0.5*scale;
        ry = rx;
    elseif rx == 0 || ry == 0
        rx = max(rx,ry);
        ry = rx;
    end
    hx = rx/scale;
    hy = ry/scale;
end

% ͨ��ѭ��������ά��ɫ��״ͼ
figure
hold on
Xp = [];
Yp = [];
Zp = [];
for i = 1:n
    [xp,yp,zp] = Vertices(x(i),y(i),z(i));
    Xp = [Xp;xp];
    Yp = [Yp;yp];
    Zp = [Zp;zp];
end
%ͨ��surf�������ɲ�ɫ�����������
h = surf(Xp,Yp,Zp,Zp,'FaceColor','interp');
%set(h,'FaceAlpha',0.25);    %�������������͸����
grid on
view(3)
hold off

%--------------------------------------------------
% �����Ӷ�����Ӻ���
%--------------------------------------------------
function [xp,yp,zp] = Vertices(x,y,z)
    % �ɳ�����������������󶥵�����
    xp = [x-hx x-hx x+hx x+hx x-hx
          x-hx x-hx x+hx x+hx x-hx
          x-hx x-hx x+hx x+hx x-hx
          x-hx x-hx x+hx x+hx x-hx
          x    x    x    x    x
          NaN  NaN  NaN  NaN  NaN];
    yp = [y-hy y+hy y+hy y-hy y-hy
          y-hy y+hy y+hy y-hy y-hy
          y-hy y+hy y+hy y-hy y-hy
          y-hy y+hy y+hy y-hy y-hy
          y    y    y    y    y
          NaN  NaN  NaN  NaN  NaN];
    zp = [repmat(linspace(0,z,4)',[1,5]);z z z z z;NaN NaN NaN NaN NaN];
end
end
% function scatterbar(x,y,z,scale)
% % ����ɢ�����ݻ�����״ͼ
% % x,y,z�ǵȳ�������
%     hx = range(x)/scale;
%     hy = range(y)/scale;
%     n = numel(x);
% 
%     figure
%     hold on
%     for i = 1:n
%         vert = Vertices(x(i),y(i),z(i));
%         %�涨����˳��
%         fac = [1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
%         %ͨ��patch����������ɫ�����������
%         h = patch('faces',fac,'vertices',vert,'FaceColor','b');
%         %set(h,'FaceAlpha',0.25);    %�������������͸����
%     end
%     grid on
%     view(3)
%     hold off
% 
%     %--------------------------------------------------
%     % �����Ӷ�����Ӻ���
%     %--------------------------------------------------
%     function Ver = Vertices(x,y,z)
%         % �ɳ�����������������󶥵�����
%         Ver = [x-hx y-hy 0
%             x-hx y+hy 0
%             x+hx y+hy 0
%             x+hx y-hy 0
%             x-hx y-hy z
%             x-hx y+hy z
%             x+hx y+hy z
%             x+hx y-hy z];
%         end
% end
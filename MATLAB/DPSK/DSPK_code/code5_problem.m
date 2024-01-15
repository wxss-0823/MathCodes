% ƥ���˲�ʵ��
clear
close all

% ��Ԫ��������
Ts = 8;

% ��Դ����
N = 16;
a = randi(2,1,N)*2-3;                % ����ת��

g = rcosdesign(0.5, 8, Ts, 'sqrt');     % ƽ����������(֪ʶ�㣺�����˲���)

% mt_send = upfirdn(a,g,Ts);     % ��������ȼ����������仰
d = [ a; zeros(Ts-1,length(a)) ];  % �������(֪ʶ�㣺������������) 
d = d(:).';
s = conv(d, g(end:-1:1));

% �ŵ�������ƫ
p = 30/180*pi;
x = s * exp(j*p);

% ƥ���˲�
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �ı��������ʵ��ƥ���˲�������˲�����洢��r��
r = x;
%ʱ��ƥ���˲�
ht=conj(fliplr(x));
r=conv(x,ht);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r = r(length(g)-3:end-length(g));
figure(9)
plot (s);
% ��ʵ��ͬ����λ�õĽ��
figure; 
for k = 1:8
    figure(k); hold on;
    plot(real(r)); plot(imag(r)); 
    plot(k:Ts:length(r), real(r(k:Ts:length(r))), 'o');
    plot(k:Ts:length(r), imag(r(k:Ts:length(r))), 's')
end

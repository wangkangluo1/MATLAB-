clear
syms a b;
c=[a b]';
A=[89677,99215,109655,120333,135823,159878,182321,209407,246619,300670];
B=cumsum(A);  % ԭʼ�����ۼ�
n=length(A);
for i=1:(n-1)
    C(i)=(B(i)+B(i+1))/2;  % �����ۼӾ���
end
% �������������ֵ
D=A;D(1)=[];
D=D';
E=[-C;ones(1,n-1)];
c=inv(E*E')*E*D;
c=c';
a=c(1);b=c(2);
% Ԥ���������
F=[];F(1)=A(1);
for i=2:(n+10)
    F(i)=(A(1)-b/a)/exp(a*(i-1))+b/a ;
end
G=[];G(1)=A(1);
for i=2:(n+10)
    G(i)=F(i)-F(i-1); %�õ�Ԥ�����������
end 
t1=1999:2008;
t2=1999:2018;
G
plot(t1,A,'ko', 'LineWidth',2)
hold on
plot(t2,G,'k', 'LineWidth',2)
xlabel('���', 'fontsize',12)
ylabel('����/(Ԫ/��)','fontsize',12)
set(gca,  'LineWidth',2);

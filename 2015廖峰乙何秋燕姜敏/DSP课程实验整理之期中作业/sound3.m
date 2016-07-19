clear all; clc;
% ȡԭʼ����
[x,f1]=wavread('sound1234.wav');
x = x(:,1);
x = resample(x,8000,f1);      %y�ĳ���34738
%��������,�������ݴ���indata.dat��
% % normal = x/max(x);
% % indata = round(32767*normal);   %32767��7FFF
% % indata(indata<0) = indata(indata<0)+65536;
% % teml = fopen('sound1234_data.dat','w');
% % fprintf(teml,'1651 1\r\n');
% % fprintf(teml,'%#X\r\n',indata);
% % fclose(teml);
% ��ԭʼ����Ƶ��
n = length(x);
NFFT = 2^nextpow2(n); % Next power of 2 from length of x
X = fft(x,NFFT);
fs = 8000;ff = (1:NFFT/2+1)*fs/NFFT;
% �ӵ�Ƶ(f1)����,����������ݵ�Ƶ��
f1 = 3000; t = (1:n)';
m = sin(2*pi*f1*t/fs);
x2 = 0.1*m + x;      %���������SNR = 10log(2.55)=4.1dB
wavwrite(x2,fs,16,'sound_noise.wav');
X2 = fft(x2,NFFT);
%����������ݣ�������nindata.dat
% % normal_1 = x2/max(x2);
% % n_indata = round(32767*normal_1);
% % n_indata(n_indata<0) = n_indata(n_indata<0)+65536;
% % t1 = fopen('sound_noise.dat','w');
% % fprintf(t1,'1651 1\r\n');
% % fprintf(t1,'%#X\r\n',n_indata);
% % fclose(t1);
%��ͼ
f = 1;
figure(f);
subplot(2,2,1);
plot([0:n-1]/fs,x);
axis([0,n/fs,-0.4,0.4]);
xlabel('ʱ��(s)');
ylabel('����');
title('ԭʼ�źŲ���');
subplot(2,2,2);
plot(ff,abs(X(1:NFFT/2+1))/max(abs(X(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('Ƶ��(Hz)');
ylabel('��һ������');
title('ԭʼ�ź�Ƶ��');
subplot(2,2,3);
plot([0:n-1]/fs,x2);
axis([0,n/fs,-0.4,0.4]);
xlabel('ʱ��(s)');
ylabel('����');
title('�����źŲ���');
subplot(2,2,4);
plot(ff,abs(X2(1:NFFT/2+1))/max(abs(X2(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('Ƶ��(Hz)');
ylabel('��һ������');
title('�����ź�Ƶ��');

z = filter_50(x2);
Z = fft(z,NFFT);
figure(f+1);
subplot(2,2,1);
plot([0:n-1]/fs,x);
axis([0,n/fs,-0.4,0.4]);
xlabel('ʱ��(s)');
ylabel('����');
title('ԭʼ�źŲ���');
subplot(2,2,2);
plot(ff,abs(X(1:NFFT/2+1))/max(abs(X(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('Ƶ��(Hz)');
ylabel('��һ������');
title('ԭʼ�ź�Ƶ��');
subplot(2,2,3);
plot([0:n-1]/fs,z);
axis([0,n/fs,-0.4,0.4]);
xlabel('ʱ��(s)');
ylabel('����');
title('FIR�˲����źŲ���');
subplot(2,2,4);
plot(ff,abs(Z(1:NFFT/2+1))/max(abs(Z(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('Ƶ��(Hz)');
ylabel('��һ������');
title('FIR�˲����ź�Ƶ��');
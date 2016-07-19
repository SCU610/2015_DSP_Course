clear all; clc;
% fid = fopen('sound_noise.dat','r');
fid = fopen('filterout_100.dat','r');
% fid = fopen('filterout_50.dat','r');
% fid = fopen('filterout_20.dat','r');
% fid = fopen('filterout_10.dat','r');
y1 = fscanf(fid,'%x');
y = y1;
y(y>32767)=y(y>32767)-65536;
y = y/32768;
y = y(1:34738);  %��Ϊԭʼ���ݵĳ���Ϊ34738

wavwrite(y,8000,16,'filterout_100.wav');

n = length(y);
NFFT = 2^nextpow2(n); % Next power of 2 from length of x
Y = fft(y,NFFT);
fs = 8000;ff = (1:NFFT/2+1)*fs/NFFT;

% % ori = load('ori_sound.mat');
% % ori = ori.x;

%ԭʼ��������
ori2 = load('ori_sound_noise.mat');
x2 = ori2.x2;
x2 = x2/max(x2);
ORI = fft(x2,NFFT);


fid2 = fopen('input_100.dat','r');
ori1 = fscanf(fid2,'%x');
ori = ori1;
ori(ori>32767)= ori(ori>32767)-65536;
ori = ori/32768;
ori = ori(1:34738);  %��Ϊԭʼ���ݵĳ���Ϊ34738

%�����
noise = y - ori;
sn = sum(noise.*noise);
sori = sum(ori.*ori);
snr = sori/sn;
gsnr = 10*log10(snr)

subplot(2,2,1);
plot([0:n-1]/fs,x2);
axis([0,n/fs,-1,1]);
xlabel('ʱ��(s)','fontsize',16);
ylabel('����','fontsize',12);
title('�����źŲ���','fontsize',16);
subplot(2,2,2);
plot(ff,abs(ORI(1:NFFT/2+1))/max(abs(ORI(1:NFFT/2+1))));
axis([0,4000,0,0.1]);
xlabel('Ƶ��(Hz)','fontsize',16);
ylabel('��һ������','fontsize',12);
title('�����ź�Ƶ��','fontsize',16);

subplot(2,2,3);
plot([0:n-1]/fs,y);
axis([0,n/fs,-1,1]);
xlabel('ʱ��(s)','fontsize',16);
ylabel('����','fontsize',12);
title('CCS FIR�˲����źŲ���','fontsize',16);
subplot(2,2,4);
plot(ff,abs(Y(1:NFFT/2+1))/max(abs(Y(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('Ƶ��(Hz)','fontsize',16);
ylabel('��һ������','fontsize',12);
title('CCS FIR�˲����ź�Ƶ��','fontsize',16);
sound(y,fs,16);

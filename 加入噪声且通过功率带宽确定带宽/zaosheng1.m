fs=1000 %信号采样频率。
% signal %假设信号频率低，能整除f1和f2.如果不能。则需要插值
Fs=1000;
T=1/Fs;
L=1000;
t=(0:L-1)*T;
signal=0.7*cos(2*pi*40*t)+sin(2*pi*200*t);

%单边傅里叶变换
NFFT=L;
Y=fft(signal,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
subplot(211)
plot(f,2*abs(Y(1:NFFT/2+1)))
xlabel('频率(HZ)')
ylabel('幅度')


f1=100;
f2=10;
n=1/fs; %
noise1=rand(1,f1);
noise2=rand(1,f2);
for i=1:length(signal)
for j =1:(f1/fs)
x((i-1)*(f1/fs)+j) = signal(i) +noise1(j);
end
end
for i=1:length(signal)
for j =1:(f2/fs)
x((i-1)*(f2/fs)+j) = signal(i) +noise1(j);
end
end

NFFT=L;
Y=fft(signal,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
subplot(212)
plot(f,2*abs(Y(1:NFFT/2+1)))
xlabel('频率(HZ)')
ylabel('幅度')
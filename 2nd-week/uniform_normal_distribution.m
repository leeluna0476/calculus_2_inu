close all; clear all; clc; %% 기존에 떠있는 그림 닫.

N=10000

Lu = (0.8+0.4*(rand(1, N)));
hist(Lu, [0.8:0.01:1.2])
xlabel('Inductance [mH]')
ylabel('Frequency')


% Normally Distributed
Ln=(1+(0.2/3.5*(randn(1,N))));
hist(Ln,[0.8:0.01:1.2])
xlabel('Inductance [mH]');
ylabel('Frequency');

% Uniformly Distributed
Cu=(1.8+0.4*(rand(1,N)));
hist(Cu,[1.8:0.01:2.2])
xlabel('Capacitance [mF]');
ylabel('Frequency');

% Normally Distributed
Cn=(2+(0.2/3.5*(randn(1,N))));
hist(Cn,[1.8:0.01:2.2])
xlabel('Capacitance [mF]');
ylabel('Frequency');

% Uniformly Distributed 10000개로 
fru=1./(2*pi.*sqrt(Lu.*Cu*10^(-9)));
hist(fru,[3100:50:4200])
xlabel('Resonance Freq [Hz]');
ylabel('Frequency');

% Normally Distributed
frn=1./(2*pi.*sqrt(Ln.*Cn*10^(-9)));
hist(frn,[3100:50:4200])
xlabel('Resonance Freq [Hz]');
ylabel('Frequency');
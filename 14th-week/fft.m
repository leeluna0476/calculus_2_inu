% 사인파 정의 (시간영역)
%fo = 7; % 사인파의 주파수 (Hz)
f = 127;
fs = 200; % 샘플링 주파수 (Hz)
Ts = 1 / fs; % 샘플링 주기 (샘플링 시간간격, sec)
maxTime = 1; % x 신호의 최대시간 (sec)

t = 0 : Ts : maxTime - Ts; % 샘플링 시간 벡터
n = length(t); % 샘플 개수
x = 3 * sin(2 * pi * fo * t); % 사인파 벡터
%x=3*sin(2*pi*fo*(0:n-1)/fs); %사인파벡터(위와 동일함)

figure(1);
clf;
stem(t, x);
%xlim([0 0.2]);
hold on;
plot(t, x);
xlabel('t');
ylabel('x(t)');
title('Sine wave samples');
subtitle('fs = 200Hz');


% 사인파 시간영역 그림 그리기
figure(101);
clf;
plot(t,x);
xlabel('Time (seconds)');
ylabel('x(t)');
title('Single sine wave in time domain');
subtitle('202500062 이서진');
grid;

% (Step 1) fft : Matlab Fourier Transform (단순 적용)
Xf1 = fft(x);
figure(2); clf;
stem(abs(Xf1)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude');

% (Step 2) fft + fftshift : Matlab FT (단순 적용)
% + - 순서 바꾸기??
Xf2 = fftshift(fft(x));
figure(3); clf; stem(abs(Xf2)); grid on;
xlabel('Frequency point number'); ylabel('Amplitude');
title('fft + fftshift by Matlab');

% (Step 3) fft + fftshift : Matlab FT (Frequency 적용)
Xf3 = fftshift(fft(x));
freq3 = -n/2 : n/2 - 1;
figure(4); clf;
stem(freq3, abs(Xf3)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('fft + fftshift with Frequency by Matlab');

% (Step 4) fft + fftshift : Matlab FT (Double-sided, Freq + Amp 적용)
Xf4 = Xf3 / n;
freq4 = freq3;
figure(5); clf; stem(freq4, abs(Xf4)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('fft + fftshift (double-sided) by Matlab');

% (Step 5) fft + fftshift : Matlab FT (Single-sided, Freq + Amp 적용)
Xf5 = 2 * Xf4;
% Xf5 = 2 * fftshift(fft(x)/length(x)); % 위와 동일함
Xf5_plus = Xf5(n/2 + 1 : n);
freq5 = 0 : n/2 - 1;
figure(6);
clf;
stem(freq5, abs(Xf5_plus));
grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('fft + fftshift (single-sided) by Matlab');



% (Final) fft : Matlab FT (실제 적용)
% Nfft보다 데이터가 짧으면 zero padding된다.
[Xf_vector,freq_vector] = onesideFFT(x,fs);
figure(7); clf;
stem(freq_vector, abs(Xf_vector)); grid on
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('Sine wave in frequency domain')


% 사인파 정의 (시간영역)
fo1 = 7; % 사인파1의 주파수 (Hz)
fo2 = 15; % 사인파2의 주파수 (Hz)
fs = 200; % 샘플링 주파수 (Hz)
Ts = 1 / fs; % 샘플링 주기 (샘플링 시간간격, sec)
maxTime = 1; % x 신호의 최대시간 (sec)
t = 0 : Ts : maxTime - Ts; % 샘플링 시간 벡터
n = length(t); % 샘플 개수
x1 = 3 * sin(2 * pi * fo1 * t); % 사인파1 벡터
%x1=3*sin(2*pi*fo1*(0:n-1)/fs); %사인파벡터(위와 동일함)
x2 = 2 * sin(2 * pi * fo2 * t); % 사인파2 벡터
%x2=2*sin(2*pi*fo2*(0:n-1)/fs); %사인파벡터(위와 동일함)
x = x1 + x2;
% 사인파 시간영역 그림 그리기
figure(10); clf; plot(t,x1,'b'); hold on;
plot(t,x2,'k'); plot(t,x,'r','LineWidth',1);
xlabel('Time (seconds)'); ylabel('x(t)');
title('Two sine waves and thier interfered wave in time domain'); grid;
% (Final) fft : Matlab FT (실제 적용)
[Xf_vector,freq_vector] = onesideFFT(x,fs);
figure(7); clf;
stem(freq_vector, abs(Xf_vector)); grid on;
xlabel('Frequency (Hz)'); ylabel('Amplitude');
title('Sine wave in frequency domain');



function [Xf,freq] = onesideFFT(x,fs)
nx = length(x); % x 길이 (시간영역 길이)
Nfft = nx; % FFT point 개수 정의 (주파수영역 길이)
Xf = 2 * fft(x, Nfft) / Nfft; % fft
% if Nfft > nx 경우 x(nx + 1 : N) = 0 이 추가됨 (zero padding)
% if Nfft < nx 경우 x = x(1:N) 으로 잘림
freq = (0 : Nfft - 1) * fs / Nfft; % 주파수 벡터
freq_plus = ceil(Nfft / 2);
Xf = Xf(1:freq_plus);
freq = freq(1:freq_plus);
end

% omega = circular frequency
% Amplitude (진폭)
% Height (파고)

% stem: 콩나물... 각각이 dirac delta function. 단 높이에 진폭을 표시한 것.
% 콩나물 사이 사이는 무시한다.
% 일정한 시간 간격마다 컴퓨터 안으로 집어 넣는다.
% x(t) -> analog data. time domain.
% x(n) -> digital data. sample domain. n번째 샘플...
% 시간 t를 만드는 게 어렵다. 아날로그 데이터를 어떻게 디지털로 바꿀 것인가
% 맨 위 코드 fs -> sampling frequency -> 시간 간격 delta t 의 역수. fs는 1초에 몇번 데이터를 가져올 것인가.
% plot: analog data처럼 그림을 그린다. 점과 점 사이를 직선으로 연결한다. 이 직선은 실제 데이터 아니고 가짜 선...
% stem: 각 데이터만 찍는다.


% sine 주파수와 샘플링 주파수간의 관계
% 회전을 찍어보면... 실제 방향이랑 다른 방향으로 회전되는 것으로 보임.
% 샘플링 주파수가 실제 회전 주파수를 못 따라가서?
% 찍은 것들을 연결해서 보여주니... 실제 방향이랑 다르게 보일 수 있다.
% Nyquist Sampling Frequency
% 내가 관심 있는 주파수의 두배 이상으로 샘플링해야 한다.
% fs >= 7

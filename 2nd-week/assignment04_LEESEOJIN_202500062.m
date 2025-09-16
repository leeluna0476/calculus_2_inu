% YSL.ACL.ESE.INU
close all; clear all;

k=10000;
M=2000;
m=0;
pp=zeros(1,M); % zeros(sz1, ..., szM): 1*M 크기의 영행렬 반환.

% 정사각형 면적 4r^2. 전체 면적에 찍힌 점 개수 N. (r^2=>N/4)
% 단위원 면적 pi*r^2. 내부에 찍힌 점 개수 c=pi*N/4. (pi=>4c/N)
for N = k:k:k*M % for N = start:step:end -> N=k, 2k, 3k, ..., (M-1)k, Mk
    m = m + 1;
    x = -1 + 2 * rand(1, N); % rand(1, N): a 1*N matrix of uniformly distributed random numbers between 0 and 1.
    y = -1 + 2 * rand(1, N); % -1 <= y <= 1, -1 <= x <= 1이어야 한다.
    z = sqrt(x.^2 + y.^2); % z(i) = x(i)^2 + y(i)^2 to every i.

% 너무 오래 걸려서 코드를 조금 바꿨습니다. 제 노트북이 불타려고 했습니다.
    c = sum(z <= 1); % 단위원 내부에 있는 점들을 센다. (sum: 조건식을 주면 조건에 해당하는 값들의 개수를 센다.)
    d = N - c;

    pp(m) = 4*c/N; % matlab은 인덱스가 1부터 시작. pi 값을 구한 걸 저장.
end

figure(1);clf; % 1번 창 열고 기존 그림 지우기(clf).
plot(1:M,pp);grid;hold on; % x= [1, M], y= 각 pp값
plot([1 M],[pi pi],'r','LineWidth',2); % x 구간 [1, M]에 대해 직선 y=pi 긋는다.
xlabel('Number of Random Points (*10^4))');
ylabel('Estimation of \pi');

figure(2);clf;
plot(x,y,'.'); hold on; grid; % 모든 (x, y)에 점을 찍는다.
xx=-1:0.001:1; % [-1, 1] 구간에 0.001 간격의 벡터 생성.
plot(xx,sqrt(1-xx.^2),'r','LineWidth',2); % y=sqrt(1 - x^2) x축 위 1/2원 그리는 함수.
plot(xx,-sqrt(1-xx.^2),'r','LineWidth',2);  % y=-sqrt(1 - x^2) x축 아래 1/2원 그리는 함수.

pbaspect([1 1 1]);  % 박스 비율 x:y:z = 1:1:1

format long
mean(pp(1500:2000))


% 타원 그리기. x^2 + 25y^2 = 1
% 직사각형 면적=0.4*2=0.8, 직사각형 내부의 점=N.
% 타원의 면적=0.2pi, 타원 내부의 점=c=pi*N/4.
% pi=c*4/N
% 타원의 면적 추정=0.8 * c / N

m=0;
ellipse_area=zeros(1, M);
for N = k:k:k*M
    m = m + 1;
    x = -1 + 2 * rand(1, N); % [-1, 1]
    y = -0.2 + 0.4 * rand(1, N); % [-0.2, 0.2]
    z = sqrt(x.^2 + 25 * y.^2);
    
    c = sum(z <= 1);
    d = N - c;

    ellipse_area(m)=0.8 * c / N;
end

figure(3);clf;
plot(1:M,ellipse_area);grid;hold on;
plot([1 M],[0.2*pi 0.2*pi],'r','LineWidth',2);
xlabel('Number of Random Points (*10^4))');
ylabel('Estimation of the area of the ellipse');

figure(4);clf;
plot(x,y,'.'); hold on; grid;
xx=-1:0.001:1;
plot(xx, sqrt((1-xx.^2)/25), 'r', 'LineWidth', 2); hold on; grid;
plot(xx, -sqrt((1-xx.^2)/25), 'r', 'LineWidth', 2);

format long
mean(ellipse_area(1500:2000))
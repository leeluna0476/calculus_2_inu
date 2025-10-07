import math

SQRT_2PI_INV = 1 / math.sqrt(2 * math.pi)

def std_normalized_gaussian_pdf(z: float):
    return SQRT_2PI_INV * math.pow(math.e, -(z * z / 2))

# 오차가 너무 심해서 못 써먹겠다
def std_normalized_gaussian_cdf(z: float, prev=-10.00001):
    ret = 0
    du = 0.00001
    i = prev + du
#    print(i)
    while i < z:
        ret += std_normalized_gaussian_pdf(i) * du
        i += du
    return ret

print('\t|0.00\t|0.01\t|0.02\t|0.03\t|0.04\t|0.05\t|0.06\t|0.07\t|0.08\t|0.09\t|')
prev = -10.0
result = 0.0
for i in range(-349, 350):
    print(f'|{i/100:.2f}\t|', end='')
    for j in range(10):
        z = i / 100 + j / 100
        result += std_normalized_gaussian_cdf(z, prev)
        print(f'{result:.4f}\t|', end='')
        prev = z
    print()




# 그럼 표준정규분포표에 나오는 각 z값들의 pdf 값을 먼저 구한 다음에, 거기에 모두 dz를 구해서 누적합을 출력하면 비슷하게 나올 것 같은데

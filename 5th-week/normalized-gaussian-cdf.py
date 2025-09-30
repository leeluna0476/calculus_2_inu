import math

SQRT_2PI_INV = 1 / math.sqrt(2 * math.pi)

def std_normalized_gaussian_pdf(z: float):
    return SQRT_2PI_INV * math.pow(math.e, -(z * z / 2))

def std_normalized_gaussian_cdf(z: float):
    ret = 0
    du_inv = 100000
    i = -349000
    z_amp = int(z * 100000)
    while i < z_amp:
        ret += std_normalized_gaussian_pdf(i / du_inv) / du_inv
        i += 1
    return ret

print('\t|0.00\t|0.01\t|0.02\t|0.03\t|0.04\t|0.05\t|0.06\t|0.07\t|0.08\t|0.09\t|')
i = 0
while i < 35:
    print(f'|{i*0.1:.1f}\t|', end='')
    j = 0
    while j < 10:
        print(f'{std_normalized_gaussian_cdf(i*0.1 + j*0.01):.4f}\t|', end='')
        j += 1
    print()
    i += 1

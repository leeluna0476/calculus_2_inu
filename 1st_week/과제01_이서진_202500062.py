import math

# 'data' must be sorted.
# If 'data' is not sorted, the behaviour is undefined.
# RETURN VALUES:
# The quantile is returned.
def quantile(data: list, q: float):
    data_len = len(data)

    idx = (data_len - 1)*q
    if isinstance(idx, int):
        q_value = data[l_idx]
    else:
        l_idx = math.floor(idx)
        u_idx = l_idx + 1
        q_value = (data[l_idx] + data[u_idx]) / 2

    return q_value


# 'data' must be sorted.
# If 'data' is not sorted, the behaviour is undefined.
# RETURN VALUES:
# If 'val' is less than the first element of 'data', None is returned
# Else, the upper extreme and its index are returned.
def upper_extreme(data: list, val: float):
    if val < data[0]:
        return None

    left = 0
    right = len(data) - 1
    mid = (left + right) // 2
    while left <= right:
        if val < data[mid]:
            right = mid - 1
        else:
            left = mid + 1
        mid = (left + right) // 2
    return data[left - 1], left - 1


# 'data' must be sorted.
# If 'data' is not sorted, the behaviour is undefined.
# RETURN VALUES:
# If 'val' is greater than the last element of 'data', None is returned.
# Else, the lower extreme and its index are returned.
def lower_extreme(data: list, val: float):
    last_idx = len(data) - 1
    if val > data[last_idx]:
        return None

    left = 0
    right = last_idx
    mid = (left + right) // 2
    while left <= right:
        if val < data[mid]:
            right = mid - 1
        else:
            left = mid + 1
        mid = (left + right) // 2
    return data[left], left


# 'data' must be sorted.
# If 'data' is not sorted, the behaviour is undefined.
# RETURN VALUE:
# A list of outliers is returned.
def outliers(data: list, up_idx: int, low_idx: int):
    outliers = []
    for i in range(0, low_idx):
        outliers.append(data[i])
    for i in range(up_idx + 1, len(data)):
        outliers.append(data[i])
    return outliers


import matplotlib.pyplot as plt

def boxplot(data: list, q1: float, q2: float, q3: float, upper_extreme: float, lower_extreme: float, outliers: list):
    fig, ax = plt.subplots(figsize=(6, 6))

    ax.add_patch(plt.Rectangle((0.9, q1), 0.2, q3 - q1,
                               fill=False, edgecolor='black'))

    ax.hlines(q2, 0.9, 1.1, colors='black')

    ax.vlines(1, lower_extreme, q1, colors='black')
    ax.vlines(1, q3, upper_extreme, colors='black')

    ax.hlines(lower_extreme, 0.95, 1.05, colors='black')
    ax.hlines(upper_extreme, 0.95, 1.05, colors='black')

    ax.plot([1]*len(outliers), outliers, 'o', color='black')

    ax.set_xlim(0.5, 1.5)
    plt.show()


# given data
data = [140, 145, 160, 190, 155, 165, 150, 190, 195, 138, 160, 155, 153, 145, 170, 175, 175, 170, 180, 135, 170, 157, 130, 185, 190, 155, 170, 155, 215, 150, 145, 155, 155, 150, 155, 150, 180, 160, 135, 160, 130, 155, 150, 148, 155, 150, 140, 180, 190, 145, 150, 164, 140, 142, 136, 123, 155, 140, 120, 130, 138, 121, 125, 116, 145, 150, 112, 125, 130, 120, 130, 131, 120, 118, 125, 135, 125, 118, 122, 115, 102, 115, 150, 110, 116, 108, 95, 125, 133, 110, 150, 108]

sorted_data = sorted(data)

q1 = quantile(sorted_data, 0.25)
q2 = quantile(sorted_data, 0.5)
q3 = quantile(sorted_data, 0.75)

print(f'q1: {q1}')
print(f'q2: {q2}')
print(f'q3: {q3}')

iqr = q3 - q1
print(f'iqr: {iqr}')

upper_extreme, up_idx = upper_extreme(sorted_data, q3 + 1.5 * iqr)
lower_extreme, low_idx = lower_extreme(sorted_data, q1 - 1.5 * iqr)
print(f'upper_extreme: {upper_extreme}')
print(f'lower_extreme: {lower_extreme}')

outliers = outliers(sorted_data, up_idx, low_idx)

print(f'outliers: {outliers}')

boxplot(data, q1, q2, q3, upper_extreme, lower_extreme, outliers)

# [100, 10000] 구간의 2000개의 균일분포 랜덤 데이터.
import random

data = random.choices(range(100, 10001), k=2000)

sorted_data = sorted(data)

q1 = quantile(sorted_data, 0.25)
q2 = quantile(sorted_data, 0.5)
q3 = quantile(sorted_data, 0.75)

print(f'q1: {q1}')
print(f'q2: {q2}')
print(f'q3: {q3}')

iqr = q3 - q1
print(f'iqr: {iqr}')

upper_extreme, up_idx = upper_extreme(sorted_data, q3 + 1.5 * iqr)
lower_extreme, low_idx = lower_extreme(sorted_data, q1 - 1.5 * iqr)
print(f'upper_extreme: {upper_extreme}')
print(f'lower_extreme: {lower_extreme}')

outliers = outliers(sorted_data, up_idx, low_idx)

print(f'outliers: {outliers}')

boxplot(data, q1, q2, q3, upper_extreme, lower_extreme, outliers)

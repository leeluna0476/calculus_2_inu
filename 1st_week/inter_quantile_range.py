import math

# 'data' must be sorted.
# If 'data' is not sorted, the behaviour is undefined.
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


# If 'data' is not sorted, the behaviour is undefined.
# RETURN VALUE:
# A list of outliers is returned.
def outliers(data: list, up_idx: int, low_idx: int):
    outliers = []
    for i in range(0, low_idx):
        outliers.append(sorted_data[i])
    for i in range(up_idx + 1, len(sorted_data)):
        outliers.append(sorted_data[i])
    return outliers


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

outliers = []
for i in range(0, low_idx):
    ourliers.append(sorted_data[i])

for i in range(up_idx + 1, len(sorted_data)):
    outliers.append(sorted_data[i])

print(f'outliers: {outliers}')

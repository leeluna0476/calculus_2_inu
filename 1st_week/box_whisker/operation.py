# 'data' must be sorted.
# If 'data' is not sorted, the behaviour is undefined.
# RETURN VALUE:
# The quantile is returned.
def quantile(data: list, q: float):
    data_len = len(data)

    idx = (data_len - 1)*q
    if isinstance(idx, int):
        q_value = data[idx]
    else:
        l_idx = int(idx // 1)
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
    o = data[0:low_idx] + data[up_idx + 1:len(data)]
    return o

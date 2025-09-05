import box_whisker.operation as op
import random

data = random.choices(range(100, 10001), k=2000)

sorted_data = sorted(data)

q1 = op.quantile(sorted_data, 0.25)
q2 = op.quantile(sorted_data, 0.5)
q3 = op.quantile(sorted_data, 0.75)

print(f'q1: {q1}')
print(f'q2: {q2}')
print(f'q3: {q3}')

iqr = q3 - q1
print(f'iqr: {iqr}')

upper_extreme, up_idx = op.upper_extreme(sorted_data, q3 + 1.5 * iqr)
lower_extreme, low_idx = op.lower_extreme(sorted_data, q1 - 1.5 * iqr)
print(f'upper_extreme: {upper_extreme}')
print(f'lower_extreme: {lower_extreme}')

outliers = op.outliers(sorted_data, up_idx, low_idx)

print(f'outliers: {outliers}')

import box_whisker.plot as plot

plot.boxplot(data, q1, q2, q3, upper_extreme, lower_extreme, outliers)

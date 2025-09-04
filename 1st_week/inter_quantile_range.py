import box_whisker.operation as op

data = [140, 145, 160, 190, 155, 165, 150, 190, 195, 138, 160, 155, 153, 145, 170, 175, 175, 170, 180, 135, 170, 157, 130, 185, 190, 155, 170, 155, 215, 150, 145, 155, 155, 150, 155, 150, 180, 160, 135, 160, 130, 155, 150, 148, 155, 150, 140, 180, 190, 145, 150, 164, 140, 142, 136, 123, 155, 140, 120, 130, 138, 121, 125, 116, 145, 150, 112, 125, 130, 120, 130, 131, 120, 118, 125, 135, 125, 118, 122, 115, 102, 115, 150, 110, 116, 108, 95, 125, 133, 110, 150, 108]

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

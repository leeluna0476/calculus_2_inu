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

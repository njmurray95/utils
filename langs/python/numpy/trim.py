import numpy as np

def trim_matrix(matrix):
    # Find rows and columns that are completely zeroed out
    zero_rows = np.all(arr == 0, axis=1)
    zero_cols = np.all(arr == 0, axis=0)

    # Find the indices where both row and column should be removed
    empty_indices = np.where(np.logical_and(zero_rows, zero_cols))[0]

    # Keep only the rows and columns where either the row or the column is not completely zeroed out
    result = np.delete(np.delete(arr, empty_indices, axis=0), empty_indices, axis=1)

    return result

if __name__ == "__main__":

    arr = np.array([[1, 0, 0, 0], [0, 0, 0, 0], [3, 0, 0, 2], [0, 0, 0, 4]])

    print(arr)
    print(trim_matrix(arr))
    print('===')

    arr = np.array([[0, 0, 0, 0, 0], [0, 4, 0, 0, 0], [0, 0, 0, 0, 0], [0, 2, 0, 0, 0], [0, 0, 0, 0, 3]])
    print(arr)
    print(trim_matrix(arr))
    print('===')

    arr = np.array([[0, 1], [0, 0]])
    print(arr)
    print(trim_matrix(arr))
    print('===')

    arr = np.array([[0, 1, 0], [0, 3, 0], [0, 0, 2]])
    print(arr)
    print(trim_matrix(arr))
    print('===')

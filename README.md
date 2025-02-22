# NumpyForGDScript

NumpyForGDScript is a lightweight GDScript implementation of common NumPy functions, providing basic numerical operations such as matrix multiplication, reshaping, transposition, identity matrix creation, and random number generation for Godot 4.3.

## Installation
1. Download the script `simpleNumpyForGDScript.gd`.
2. Place it in your Godot project under the `res://` directory.
3. Load the script in your Godot project:
   ```gdscript
   var npLoad = load("res://simpleNumpyForGDScript.gd")
   var np = npLoad.new()
   ```

## Features
- **Zeros Matrix (`zeros`)**: Generates a matrix filled with zeros, supporting up to 3D matrices.
- **Matrix Multiplication (`matmul`)**: Performs matrix multiplication with error handling for incompatible dimensions.
- **Random Normal Matrix (`randn`)**: Generates a matrix with normally distributed random values.
- **Reshape (`reshape`)**: Reshapes a matrix into a new shape with error handling for invalid transformations.
- **Transpose (`transpose`)**: Computes the transpose of a given matrix.
- **Identity Matrix (`identity`)**: Creates an identity matrix of a given size.
- **Print Matrix (`print_matrix`)**: Prints a matrix to the console for debugging.
- **Unit Testing (`run_tests`)**: Runs a set of predefined tests to validate functions.

## Usage

```gdscript
print(np.randn(2,2))
# Output: [[0.850811, 0.09966], [2.688669, 2.25595]]

print(np.zeros(2,2))
# Output: [[0, 0], [0, 0]]

print(np.reshape([[1,2],[3,4],[5,6]],2,3))
# Output: [[1, 2, 3], [4, 5, 6]]

print(np.reshape([[1, 2, 3],[4, 5, 6]],3,2))
# Output: [[1, 2], [3, 4], [5, 6]]

print(np.matmul([[1], [2], [3]],[[4, 5, 6]]))
# Output: [[4, 5, 6], [8, 10, 12], [12, 15, 18]]

print(np.matmul([[4, 5, 6]],[[1], [2], [3]]))
# Output: [[32]]

print(np.transpose([[1, 2, 3], [4, 5, 6]]))
# Output: [[1, 4], [2, 5], [3, 6]]

print(np.identity(3))
# Output: [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
```

## Function Descriptions
### `zeros(matLengthX, matLengthY, matLengthZ=0)`
Generates a matrix of given dimensions filled with zeros, supporting up to 3D matrices.
- **Parameters**:
  - `matLengthX` *(int)*: Number of rows.
  - `matLengthY` *(int)*: Number of columns.
  - `matLengthZ` *(int, optional)*: Depth (default: 0 for 2D matrix).
- **Returns**: A 2D or 3D list of zeros.

### `matmul(mat1, mat2)`
Performs matrix multiplication between two matrices with error handling for incompatible dimensions.
- **Parameters**:
  - `mat1` *(2D list)*: First matrix.
  - `mat2` *(2D list)*: Second matrix.
- **Returns**: The resulting matrix from multiplication or an error message.

### `randn(sizeX, sizeY)`
Generates a matrix filled with normally distributed random numbers (mean=0, std=1).
- **Parameters**:
  - `sizeX` *(int)*: Number of rows.
  - `sizeY` *(int)*: Number of columns.
- **Returns**: A 2D list with random values from a normal distribution.

### `reshape(mat, newSizeX, newSizeY)`
Reshapes a given matrix into a new size with error handling for size mismatches.
- **Parameters**:
  - `mat` *(2D list)*: Input matrix.
  - `newSizeX` *(int)*: New number of rows.
  - `newSizeY` *(int)*: New number of columns.
- **Returns**: Reshaped matrix as a 2D list or an error message.

### `transpose(mat)`
Computes the transpose of a matrix.
- **Parameters**:
  - `mat` *(2D list)*: Input matrix.
- **Returns**: The transposed matrix.

### `identity(size)`
Creates an identity matrix of a given size.
- **Parameters**:
  - `size` *(int)*: The size of the identity matrix (square matrix).
- **Returns**: An identity matrix as a 2D list.

### `print_matrix(mat)`
Prints the given matrix row by row.
- **Parameters**:
  - `mat` *(2D list)*: Matrix to print.

### `run_tests()`
Runs a set of unit tests for function validation.
- **Tests**:
  - `test_zeros()`
  - `test_matmul()`
  - `test_reshape()`
  - `test_transpose()`
  - `test_identity()`

## License
This project is open-source and free to use under the GNU GENERAL PUBLIC LICENSE.

---

This implementation of NumPy-like functionality in GDScript enables easier numerical computation within Godot. Feel free to extend the script for additional numerical methods!



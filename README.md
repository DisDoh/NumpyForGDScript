# NumpyForGDScript

NumpyForGDScript is a lightweight GDScript implementation of common NumPy functions, providing basic numerical operations such as matrix multiplication, reshaping, and random number generation for Godot 4.3.

## Installation
1. Download the script `simpleNumpyForGDScript.gd`.
2. Place it in your Godot project under the `res://` directory.
3. Load the script in your Godot project:
   ```gdscript
   var npLoad = load("res://simpleNumpyForGDScript.gd")
   var np = npLoad.new()
   ```

## Features
- **Zeros Matrix (`zeros`)**: Generates a matrix filled with zeros.
- **Matrix Multiplication (`matmul`)**: Performs matrix multiplication.
- **Random Normal Matrix (`randn`)**: Generates a matrix with normally distributed random values.
- **Reshape (`reshape`)**: Reshapes a matrix into a new shape.

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
```

## Function Descriptions
### `zeros(matLengthX, matLengthY)`
Generates a matrix of given dimensions filled with zeros.
- **Parameters**:
  - `matLengthX` *(int)*: Number of rows.
  - `matLengthY` *(int)*: Number of columns.
- **Returns**: A 2D list of zeros.

### `matmul(mat1, mat2)`
Performs matrix multiplication between two matrices.
- **Parameters**:
  - `mat1` *(2D list)*: First matrix.
  - `mat2` *(2D list)*: Second matrix.
- **Returns**: The resulting matrix from multiplication.

### `randn(sizeX, sizeY)`
Generates a matrix filled with normally distributed random numbers.
- **Parameters**:
  - `sizeX` *(int)*: Number of rows.
  - `sizeY` *(int)*: Number of columns.
- **Returns**: A 2D list with random values from a normal distribution.

### `reshape(mat, newSizeX, newSizeY)`
Reshapes a given matrix into a new size.
- **Parameters**:
  - `mat` *(2D list)*: Input matrix.
  - `newSizeX` *(int)*: New number of rows.
  - `newSizeY` *(int)*: New number of columns.
- **Returns**: Reshaped matrix as a 2D list.

## License
This project is open-source and free to use under the MIT License.

---

This implementation of NumPy-like functionality in GDScript enables easier numerical computation within Godot. Feel free to extend the script for additional numerical methods!



extends Node
var random: RandomNumberGenerator = RandomNumberGenerator.new()

func zeros(matLengthX, matLengthY, matLengthZ=0):
	var matrix = []
	if matLengthZ == 0:
		for x in range(matLengthX):
			matrix.append([])
			for y in range(matLengthY):
				matrix[x].append(0)
	else:
		for x in range(matLengthX):
			matrix.append([])
			for y in range(matLengthY):
				matrix[x].append([])
				for z in range(matLengthZ):
					matrix[x][y].append(0)
	return matrix

func matmul(mat1, mat2):
	if len(mat1[0]) != len(mat2):
		push_error("Erreur: Dimensions incompatibles pour la multiplication de matrices")
		return []
	var result = zeros(len(mat1), len(mat2[0]))
	for x in range(len(mat1)):
		for y in range(len(mat2[0])):
			for z in range(len(mat2)):
				result[x][y] += mat1[x][z] * mat2[z][y]
	return result

# Strassen's Optimized Matrix Multiplication
func strassen_matmul(mat1, mat2):
	var n = len(mat1)
	if n <= 2: # Use standard multiplication for small matrices
		return matmul(mat1, mat2)
	
	var mid = n / 2
	var A11 = submatrix(mat1, 0, 0, mid)
	var A12 = submatrix(mat1, 0, mid, mid)
	var A21 = submatrix(mat1, mid, 0, mid)
	var A22 = submatrix(mat1, mid, mid, mid)

	var B11 = submatrix(mat2, 0, 0, mid)
	var B12 = submatrix(mat2, 0, mid, mid)
	var B21 = submatrix(mat2, mid, 0, mid)
	var B22 = submatrix(mat2, mid, mid, mid)

	var M1 = strassen_matmul(add(A11, A22), add(B11, B22))
	var M2 = strassen_matmul(add(A21, A22), B11)
	var M3 = strassen_matmul(A11, subtract(B12, B22))
	var M4 = strassen_matmul(A22, subtract(B21, B11))
	var M5 = strassen_matmul(add(A11, A12), B22)
	var M6 = strassen_matmul(subtract(A21, A11), add(B11, B12))
	var M7 = strassen_matmul(subtract(A12, A22), add(B21, B22))

	var C11 = add(subtract(add(M1, M4), M5), M7)
	var C12 = add(M3, M5)
	var C21 = add(M2, M4)
	var C22 = add(subtract(add(M1, M3), M2), M6)

	return combine_matrices(C11, C12, C21, C22)

# Utility functions for Strassen's method
func add(mat1, mat2):
	var result = zeros(len(mat1), len(mat1[0]))
	for x in range(len(mat1)):
		for y in range(len(mat1[0])):
			result[x][y] = mat1[x][y] + mat2[x][y]
	return result

func subtract(mat1, mat2):
	var result = zeros(len(mat1), len(mat1[0]))
	for x in range(len(mat1)):
		for y in range(len(mat1[0])):
			result[x][y] = mat1[x][y] - mat2[x][y]
	return result

func submatrix(mat, startX, startY, size):
	var submat = zeros(size, size)
	for x in range(size):
		for y in range(size):
			submat[x][y] = mat[startX + x][startY + y]
	return submat

func combine_matrices(C11, C12, C21, C22):
	var size = len(C11) * 2
	var result = zeros(size, size)
	for x in range(len(C11)):
		for y in range(len(C11[0])):
			result[x][y] = C11[x][y]
			result[x][y + len(C11)] = C12[x][y]
			result[x + len(C11)][y] = C21[x][y]
			result[x + len(C11)][y + len(C11)] = C22[x][y]
	return result

func randn(sizeX, sizeY):
	var result = zeros(sizeX, sizeY)
	for x in range(sizeX):
		for y in range(sizeY):
			result[x][y] = random.randfn(0, 1)
	return result

func reshape(mat, newSizeX, newSizeY):
	var total_elements = len(mat) * len(mat[0])
	if total_elements != newSizeX * newSizeY:
		push_error("Erreur: Impossible de redimensionner, tailles incompatibles")
		return []
	var newMat = zeros(newSizeX, newSizeY)
	var elements = []
	for row in mat:
		elements.append_array(row)
	var index = 0
	for reshapeX in range(newSizeX):
		for reshapeY in range(newSizeY):
			newMat[reshapeX][reshapeY] = elements[index]
			index += 1
	return newMat

func transpose(mat):
	var transposed = zeros(len(mat[0]), len(mat))
	for x in range(len(mat)):
		for y in range(len(mat[0])):
			transposed[y][x] = mat[x][y]
	return transposed

func identity(size):
	var mat = zeros(size, size)
	for i in range(size):
		mat[i][i] = 1
	return mat

func print_matrix(mat):
	for row in mat:
		print(row)

# ----------- UNIT TESTS -----------
func test_zeros():
	var mat = zeros(2, 3)
	assert(mat == [[0, 0, 0], [0, 0, 0]], "Error in zeros()")

func test_matmul():
	var mat1 = [[1, 2], [3, 4]]
	var mat2 = [[2, 0], [1, 2]]
	var expected = [[4, 4], [10, 8]]
	assert(matmul(mat1, mat2) == expected, "Error in matmul()")

func test_strassen():
	var mat1 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]]
	var mat2 = [[2, 3, 4, 5], [6, 7, 8, 9], [10, 11, 12, 13], [14, 15, 16, 17]]
	var expected = matmul(mat1, mat2)
	assert(strassen_matmul(mat1, mat2) == expected, "Error in Strassen's matrix multiplication")

func test_reshape():
	var mat = [[1, 2, 3], [4, 5, 6]]
	var expected = [[1, 2], [3, 4], [5, 6]]
	assert(reshape(mat, 3, 2) == expected, "Error in reshape()")

func test_transpose():
	var mat = [[1, 2, 3], [4, 5, 6]]
	var expected = [[1, 4], [2, 5], [3, 6]]
	assert(transpose(mat) == expected, "Error in transpose()")

func test_identity():
	var expected = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
	assert(identity(3) == expected, "Error in identity()")

func run_tests():
	print("Launching all tests...")
	test_zeros()
	test_matmul()
	test_strassen()
	test_reshape()
	test_transpose()
	test_identity()
	print("All tests passed! ✅")

# Exécuter les tests
func _ready() -> void:
	run_tests()


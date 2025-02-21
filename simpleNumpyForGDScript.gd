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
	test_reshape()
	test_transpose()
	test_identity()
	print("All tests passed ! ✅")

# Exécuter les tests
func _ready() -> void:
	run_tests()


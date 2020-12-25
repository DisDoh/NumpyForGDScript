extends Node



var random: RandomNumberGenerator = RandomNumberGenerator.new()


func zeros(matLengthX, matLengthY, matLengthZ=0):
	#Init returning matrix
	var matrix = []
	# iterate through rows of r1
	for x in range(matLengthX):
		matrix.append([])
		# iterate through columns of c2
		for y in range(matLengthY):
			matrix[x].append(0)
			
	return matrix
		
func matmul(mat1, mat2):
	#Init with zeros
	var result = zeros(len(mat1), len(mat2[0]))
	# iterate through rows of r1
	for x in range(len(mat1)):
		# iterate through columns of c2
		for y in range(len(mat2[0])):
			# iterate through rows of r2
			for z in range(len(mat2)):
				result[x][y] += mat1[x][z] * mat2[z][y]
	
	return result
	
func randn(sizeX,sizeY):
	#Init with zeros
	var result = zeros(sizeX, sizeY)
	for x in range(sizeX):
		for y in range(sizeY):
			result[x][y] = random.randfn(1,1)
	return result
	
func reshape(mat,newSizeX,newSizeY):
#	var count = mat.size() +  mat[0].size()
	var newMat = zeros(newSizeX,newSizeY)
#	if newSizeX + newSizeY !=  mat.size() +  mat[0].size():
#		return -1 
#	else:
	
	var x = 0
	var y = 0
	for reshapeX in range(newSizeX):
		for reshapeY in range(newSizeY):
			newMat[reshapeX][reshapeY] = mat[x][y]
			y += 1
			if y >= len(mat[0]):
				y = 0
				x += 1
	return newMat

# NumpyForGDScript


var npLoad = load("res://simpleNumpyForGDScript.gd")
var np = npLoad.new()

print(np.randn(2,2))
#Output
[[0.850811, 0.09966], [2.688669, 2.25595]]

print(np.zeros(2,2))
#Output
[[0, 0], [0, 0]]


print(np.reshape([[1,2],[3,4],[5,6]],2,3))
#Output
[[1, 2, 3], [4, 5, 6]]


print(np.reshape([[1, 2, 3],[4, 5, 6]],3,2))
#Output
[[1, 2], [3, 4], [5, 6]]


print(np.matmul([[1], [2], [3]],[[4, 5, 6]]))
#Output
[[4, 5, 6], [8, 10, 12], [12, 15, 18]]

print(np.matmul([[4, 5, 6]],[[1], [2], [3]]))
#Output
[[32]]




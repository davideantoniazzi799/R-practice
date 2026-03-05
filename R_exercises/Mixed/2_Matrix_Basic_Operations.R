# Exercise 2 - Matrices and Basic Matrix Operations
# 
# Create a 3x3 matrix called M using the numbers from 1 to 9 (filled by row).
# 
# Extract:
# - The second row
# - The third column
# 
# - Compute:
#   - The transpose of M
#   - The determinant of M
# 
# - Multiply M by itself using matrix multiplication.
# - Replace the center value of the matrix with 0.

M <- matrix(seq(1,9), 3, 3, byrow=TRUE)
print(M)

print(M[2,])
print(M[, 3])

t_M <- t(M)
print(t_M)

print("Determinant:")
print(det(M))

print(M%*%M)

M[2,2] <- 0
print(M)
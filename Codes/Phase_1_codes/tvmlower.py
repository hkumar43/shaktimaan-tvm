import tvm
from tvm import te # te stands for tensor expression

# Save to the d2ltvm package.
def vector_add(n):
    """TVM expression for vector add"""
    A = te.placeholder((n,), name='a')
    B = te.placeholder((n,), name='b')
    C = te.compute(A.shape, lambda i: A[i] + B[i], name='c')
    return A, B, C

A, B, C = vector_add(5)
# print(type(A))
# print(type(C))
# print((A.dtype, A.shape))
# print( (C.dtype, C.shape))
# print(type(A.op))
# print( type(C.op))
A.op.__class__.__bases__[0]
s = te.create_schedule(C.op)
# print(type(s))
# print( type(s[C]))
print(tvm.lower(s, [A, B, C]))
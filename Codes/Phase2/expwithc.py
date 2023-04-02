import tvm
import numpy as np
from tvm import te


n = te.var('n')
A = te.placeholder((n,), name='A')
B = te.compute(A.shape, lambda i: A[i] + 1, name='B')

# Compile the computation to IR
s = te.create_schedule(B.op)
module = tvm.build(s, [A, B], 'c')
# print(tvm.runtime.__file__)

c_code = str(module.get_source())


with open('add_one.c', 'w') as f:
    f.write(c_code)
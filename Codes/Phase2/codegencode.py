import tvm
from tvm import relay


def get_demo_mod():
    d1 = relay.var("d1", shape=(1, 32, 56, 56), dtype="float32")
    w1 = relay.var("w1", shape=(32, 32, 3, 3), dtype="float32")
    b1 = relay.var("b1", shape=(32,), dtype="float32")
    conv = relay.nn.conv2d(d1, w1, strides=(1, 1), padding=(1, 1))
    bias = relay.nn.bias_add(conv, b1)
    relu = relay.nn.relu(bias)

    func = relay.Function([d1, w1, b1], conv)
    mod = tvm.IRModule.from_expr(func)
    mod = relay.transform.InferType()(mod)
    return mod

# if not tvm.get_global_func("relay.ext.shakti", True):
#     print("skip because Shakti codegen is not available")

mod  = get_demo_mod()
# print (mod)
# with tvm.transform.PassContext(opt_level=2):
#     graph, lib, params = relay.build(mod, target="c", params=None)

# # print(graph)
# print(lib.get_source())

mod = relay.transform.AnnotateTarget("shakti")(mod)
mod = relay.transform.PartitionGraph()(mod)
print(mod)
with tvm.transform.PassContext(opt_level=2):
    graph, lib, params = relay.build(mod, target="c", params=None)

# lib.export_library("/tmp/liba.so")    
# print(lib.imported_modules[0].get_source())
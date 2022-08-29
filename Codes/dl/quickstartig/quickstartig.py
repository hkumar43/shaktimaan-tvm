import numpy as np

from tvm import relay
from tvm.relay import testing
import tvm
from tvm import te
from tvm.contrib import graph_executor
import tvm.testing

batch_size = 1
num_class = 1000
image_shape = (3, 224, 224)
data_shape = (batch_size,) + image_shape
out_shape = (batch_size, num_class)

mod, params = relay.testing.resnet.get_workload(
    num_layers=18, batch_size=batch_size, image_shape=image_shape
)

# set show_meta_data=True if you want to show meta data
#print(mod.astext(show_meta_data=False))

opt_level = 3
#target = 'llvm'
target = tvm.target.intel_graphics()
'''
with relay.build_config(opt_level=opt_level):
    lib = relay.build_module.build(
        mod, target, params=params)
'''
with tvm.transform.PassContext(opt_level=opt_level):
    lib = relay.build(mod, target, params=params)
# save the graph, lib and params into separate files
from tvm.contrib import utils
'''
this is saving model in temperory file
temp = utils.tempdir()
path_lib = temp.relpath("deploy_lib.tar")
lib.export_library(path_lib)
print(temp.listdir())
'''
#save model in the current directory
#lib.export_library("deploy_lib.so")
lib.export_library("deploy_lib.tar")

'''

# load the module back.
dev = tvm.cpu(0)
data = np.random.uniform(-1, 1, size=data_shape).astype("float32")
loaded_lib = tvm.runtime.load_module("deploy_lib.tar")
input_data = tvm.nd.array(data)


module = graph_executor.GraphModule(loaded_lib["default"](dev))
module.run(data=input_data)
out_deploy = module.get_output(0).numpy()

# Print first 10 elements of output
print(out_deploy.flatten()[0:10])
'''
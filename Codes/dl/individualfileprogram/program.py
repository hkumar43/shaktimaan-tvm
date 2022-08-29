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
target = 'llvm'
#target = tvm.target.intel_graphics()
with relay.build_config(opt_level=opt_level):
    graph, lib, params = relay.build_module.build(
        mod, target, params=params)

    '''

# save the graph, lib and params into separate files
from tvm.contrib import utils

temp = utils.tempdir()
path_lib = temp.relpath("deploy_lib.tar")
lib.export_library(path_lib)
with open(temp.relpath("deploy_graph.json"), "w") as fo:
    fo.write(graph)
with open(temp.relpath("deploy_param.params"), "wb") as fo:
    fo.write(relay.save_param_dict(params))
print(temp.listdir())
'''
'''

# save the graph, lib and params into separate files temperory
from tvm.contrib import utils

temp = utils.tempdir()
path_lib = temp.relpath("deploy_lib.tar")
lib.export_library(path_lib)
print(temp.listdir())
'''

# Save the model as a library.
 
lib.export_library("model.so")
 
# Save the graph definition as a JSON.
 
with open("model.json", "w") as fo:
    fo.write(graph)
 
# Save the params.
 
with open("model.params", "wb") as fo:
    fo.write(relay.save_param_dict(params))

#print(temp.listdir())
'''
below code gives error

dev=tvm.cpu(0)
data = np.random.uniform(-1, 1, size=data_shape).astype("float32")
lib: tvm.runtime.Module = tvm.runtime.load_module("model.so")
input_data = tvm.nd.array(data)

gmod = graph_executor.GraphModule(lib["default"])
# use the graph module.
gmod.set_input("x", data)
gmod.run()

# Print first 10 elements of output
#print(out_deploy.flatten()[0:10])
'''

''' below code is working fine
loaded_lib = tvm.runtime.load_module("model.so")
loaded_json = open("model.json").read()
loaded_params = bytearray(open("model.params", "rb").read())

from tvm.contrib import graph_runtime
#module = graph_runtime.create(loaded_json, loaded_lib, tvm.cpu(0))
module.load_params(loaded_params)
input_data = np.random.uniform(-1, 1, size=data_shape).astype("float32")
module.run(data=input_data)
out_deploy = module.get_output(0).numpy()

# Print first 10 elements of output
print(out_deploy.flatten()[0:10])
'''


''' experiment'''
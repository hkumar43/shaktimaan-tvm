import numpy as np
from PIL import Image
from numpy import asarray
import onnx
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
'''
mod, params = tvm.relay.testing.mobilenet.get_workload(
    batch_size=1, num_classes=1000, image_shape=(3, 224, 224), dtype='float32', layout='NCHW')
'''
#loading own model
onnx_model = onnx.load('model.onnx')
mod, params = relay.frontend.from_onnx(onnx_model)
# set show_meta_data=True if you want to show meta data
#print(mod.astext(show_meta_data=False))

opt_level = 3
target = 'llvm'
#target = tvm.target.intel_graphics()
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
lib.export_library("mymobile.tar")
lib.export_library("mymobile.so")

img = Image.open('keyboard.png').convert('RGB')
numpydata = asarray(img)
pilImage = Image.fromarray(numpydata)
image = img.resize((224,224),Image.ANTIALIAS)
image.save(fp="convertedcatimage.png")
numpydata = asarray(image)
pilImage = Image.fromarray(numpydata)
numpydata=np.transpose(numpydata, (0,2,1))
numpydata=np.transpose(numpydata, (1,0,2))

# load the module back.
dev = tvm.cpu(0)
#data=np.array([numpydata]).astype("float32")
data = np.random.uniform(-1, 1, size=data_shape).astype("float32")

print(type(data))
print(data.shape)

loaded_lib = tvm.runtime.load_module("mymobile.tar")
input_data = tvm.nd.array(data)

print(type(input_data))
print(input_data.shape)


module = graph_executor.GraphModule(loaded_lib["default"](dev))
module.run(data=input_data)
out_deploy = module.get_output(0).numpy()

# Print first 10 elements of output
print(type(out_deploy))
print(out_deploy.shape)
print(out_deploy.flatten()[0:10])
#print(type(module))   <class 'tvm.contrib.graph_executor.GraphModule'>    
print(type(loaded_lib))
print(out_deploy.max())
print(out_deploy.sum())

print(out_deploy.argmax(axis=1))



''''this file conatins how to convert an image to nd array and transpose its input vector and then run the model using the .so file that is already generated of resent 18 model '''
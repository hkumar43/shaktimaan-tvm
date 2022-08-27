from tvm.driver import tvmc
model = tvmc.load('my_model.onnx')
package = tvmc.compile(model, target="llvm") #Step 2: Compile
result = tvmc.run(package, device="cpu") #Step 3: Run
print(result)
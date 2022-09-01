from tabnanny import verbose
import torch
import torch.onnx
import torchvision.models as models
device = torch.device("cpu") 

model = models.mobilenet_v2(pretrained = True) # we do not specify pretrained=True, i.e. do not load default weights
model.load_state_dict(torch.load('mobimodel.pt'))
model.eval()
input_names = ["actual_input_1"]
output_names = ["output1"]
dummy_input = torch.randn(1, 3, 224, 224)
torch.onnx.export(model, dummy_input, "model.onnx",verbose=True)
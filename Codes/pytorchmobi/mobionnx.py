import torch
model = torch.hub.load('pytorch/vision:v0.10.0', 'mobilenet_v2', pretrained=True)
torch.save(model.state_dict(),"mobimodel.pt")

#include "/mnt/d/Tvmwith3713/tvm/include/tvm/runtime/registry.h"
#include "/mnt/d/Tvmwith3713/tvm/include/tvm/runtime/device_api.h"

#include <vector>
#include <string>

int main() {
  std::vector<std::string> device_types = tvm::runtime::DeviceAPI::GetDeviceTypes();
  for (const auto& device_type : device_types) {
    std::cout << "Device type: " << device_type << std::endl;
    auto* device_api = tvm::runtime::DeviceAPI::Get(device_type);
    if (!device_api) {
      continue;
    }
    std::vector<tvm::runtime::DeviceAttr> attrs = device_api->ListAttrs();
    for (const auto& attr : attrs) {
      std::cout << "\tDevice ID: " << attr->device_type << std::endl;
    }
  }
  return 0;
}

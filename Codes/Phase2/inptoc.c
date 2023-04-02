#include "/mnt/d/Tvmwith3713/tvm/include/tvm/runtime/c_runtime_api.h"
#include <stdio.h>
#include "/mnt/d/Tvmwith3713/tvm/include/tvm/runtime/module.h"
#include "dmlc/io.h"
int main() {
  // Load the module
  tvm_module_t module;
  int ret = TVMModLoadFromFile("add_one.so", NULL, &module);
  if (ret != 0) {
    printf("Error loading module: %s\n", TVMGetLastError());
    return 1;
  }

  // Get the function from the module
  tvm_function_t add_one_func;
  ret = TVMModGetFunction(module, "add_one", &add_one_func);
  if (ret != 0) {
    printf("Error getting function: %s\n", TVMGetLastError());
    return 1;
  }

  // Create the input tensor
  int ndim = 1;
  int64_t shape[1] = {1};
  DLTensor* x;
  ret = TVMArrayAlloc(shape, ndim, kDLFloat, 32, kDLCPU, 0, &x);
  if (ret != 0) {
    printf("Error allocating input tensor: %s\n", TVMGetLastError());
    return 1;
  }

  // Set the input data
  float* x_data = (float*)x->data;
  x_data[0] = 1.0;

  // Create the output tensor
  DLTensor* y;
  ret = TVMArrayAlloc(shape, ndim, kDLFloat, 32, kDLCPU, 0, &y);
  if (ret != 0) {
    printf("Error allocating output tensor: %s\n", TVMGetLastError());
    return 1;
  }

  // Create the input arguments
  tvm_value_t args[2];
  args[0].v_handle = x;
  args[1].v_handle = y;

  // Run the function
  ret = TVMFuncCall(add_one_func, args, 2, NULL);
  if (ret != 0) {
    printf("Error running function: %s\n", TVMGetLastError());
    return 1;
  }

  // Print the output
  float* y_data = (float*)y->data;
  printf("output: %f\n", y_data[0]);

  // Free the tensors
  TVMArrayFree(x);
  TVMArrayFree(y);

  // Free the module
  TVMModFree(module);

  return 0;
}

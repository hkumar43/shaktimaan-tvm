// tvm target: c -keys=cpu -link-params=0
#define TVM_EXPORTS
#include "/mnt/d/Tvmwith3713/tvm/include/tvm/runtime/c_runtime_api.h"
#include "/mnt/d/Tvmwith3713/tvm/include/tvm/runtime/c_backend_api.h"
#include <math.h>
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t default_function(void* args, int32_t* arg_type_ids, int32_t num_args, void* out_ret_value, int32_t* out_ret_tcode, void* resource_handle) {
  void* arg_A = (((TVMValue*)args)[0].v_handle);
  int32_t arg_A_code = arg_type_ids[0];
  void* arg_B = (((TVMValue*)args)[1].v_handle);
  int32_t arg_B_code = arg_type_ids[1];
  void* A = (((DLTensor*)arg_A)[0].data);
  void* arg_A_shape = (((DLTensor*)arg_A)[0].shape);
  int32_t n = ((int32_t)((int64_t*)arg_A_shape)[0]);
  void* arg_A_strides = (((DLTensor*)arg_A)[0].strides);
  int32_t stride = ((n == 1) ? 0 : ((arg_A_strides == NULL) ? 1 : ((int32_t)((int64_t*)arg_A_strides)[0])));
  int32_t dev_id = (((DLTensor*)arg_A)[0].device.device_id);
  void* B = (((DLTensor*)arg_B)[0].data);
  void* arg_B_shape = (((DLTensor*)arg_B)[0].shape);
  void* arg_B_strides = (((DLTensor*)arg_B)[0].strides);
  int32_t stride_1 = ((n == 1) ? 0 : ((arg_B_strides == NULL) ? 1 : ((int32_t)((int64_t*)arg_B_strides)[0])));
  for (int32_t i = 0; i < n; ++i) {
    ((float*)B)[(i * stride_1)] = (((float*)A)[(i * stride)] + 1.000000e+00f);
  }
  return 0;
}

// CodegenC: NOTE: Auto-generated entry function
#ifdef __cplusplus
extern "C"
#endif
TVM_DLL int32_t __tvm_main__(void* args, int* arg_type_ids, int num_args, void* out_ret_value, int* out_ret_tcode, void* resource_handle) {
  return default_function(args, arg_type_ids, num_args, out_ret_value, out_ret_tcode, resource_handle);
}

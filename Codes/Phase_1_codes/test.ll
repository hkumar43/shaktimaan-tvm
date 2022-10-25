primfn(a_1: handle, b_1: handle, c_1: handle) -> ()
  attr = {"from_legacy_te_schedule": True, "global_symbol": "main", "tir.noalias": True}
  buffers = {a: Buffer(a_2: Pointer(float32), float32, [5], []),
             b: Buffer(b_2: Pointer(float32), float32, [5], []),
             c: Buffer(c_2: Pointer(float32), float32, [5], [])}
  buffer_map = {a_1: a, b_1: b, c_1: c}
  preflattened_buffer_map = {a_1: a_3: Buffer(a_2, float32, [5], []), b_1: b_3: Buffer(b_2, float32, [5], []), c_1: c_3: Buffer(c_2, float32, [5], [])} {
  for (i: int32, 0, 5) {
    c[i] = (a[i] + b[i])
  }
}
; ModuleID = 'TVMMod'
source_filename = "TVMMod"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%0 = type { i8*, %1, i32, %2, i64*, i64*, i64 }
%1 = type { i32, i32 }
%2 = type { i8, i8, i16 }

@__TVMAPISetLastError = linkonce dllexport local_unnamed_addr global void (i8*)* null, align 8
@.str = private constant [69 x i8] c"Assert fail: (num_args == 2), default_function: num_args should be 2\00", align 1
@.str.1 = private constant [148 x i8] c"Assert fail: ((((arg.A.code == 3) || (arg.A.code == 13)) || (arg.A.code == 7)) || (arg.A.code == 4)), default_function: Expect arg[0] to be pointer\00", align 1
@.str.2 = private constant [148 x i8] c"Assert fail: ((((arg.B.code == 3) || (arg.B.code == 13)) || (arg.B.code == 7)) || (arg.B.code == 4)), default_function: Expect arg[1] to be pointer\00", align 1
@.str.3 = private constant [87 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg.A, 0, 4)), arg.A.ndim is expected to equal 1\00", align 1
@.str.4 = private constant [202 x i8] c"Assert fail: (((tir.tvm_struct_get(arg.A, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg.A, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg.A, 0, 7) == (uint16)1)), arg.A.dtype is expected to be float32\00", align 1
@.str.5 = private constant [166 x i8] c"Assert fail: ((uint64)0 == tir.tvm_struct_get(arg.A, 0, 8)), Argument arg.A.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg.A, 0, 8))\00", align 1
@.str.6 = private constant [152 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg.A, 0, 10)), Argument arg.A.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg.A, 0, 10))\00", align 1
@.str.7 = private constant [87 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg.B, 0, 4)), arg.B.ndim is expected to equal 1\00", align 1
@.str.8 = private constant [202 x i8] c"Assert fail: (((tir.tvm_struct_get(arg.B, 0, 5) == (uint8)2) && (tir.tvm_struct_get(arg.B, 0, 6) == (uint8)32)) && (tir.tvm_struct_get(arg.B, 0, 7) == (uint16)1)), arg.B.dtype is expected to be float32\00", align 1
@.str.9 = private constant [127 x i8] c"Assert fail: (n == int32(arg.B.shape[0])), Argument arg.B.shape[0] has an unsatisfied constraint: (n == int32(arg.B.shape[0]))\00", align 1
@.str.10 = private constant [166 x i8] c"Assert fail: ((uint64)0 == tir.tvm_struct_get(arg.B, 0, 8)), Argument arg.B.byte_offset has an unsatisfied constraint: ((uint64)0 == tir.tvm_struct_get(arg.B, 0, 8))\00", align 1
@.str.11 = private constant [152 x i8] c"Assert fail: (1 == tir.tvm_struct_get(arg.B, 0, 10)), Argument arg.B.device_type has an unsatisfied constraint: (1 == tir.tvm_struct_get(arg.B, 0, 10))\00", align 1
@.str.12 = private constant [158 x i8] c"Assert fail: (dev_id == tir.tvm_struct_get(arg.B, 0, 9)), Argument arg.B.device_id has an unsatisfied constraint: (dev_id == tir.tvm_struct_get(arg.B, 0, 9))\00", align 1
@__tvm_main__ = weak dllexport local_unnamed_addr constant [17 x i8] c"default_function\00", align 1
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

define dllexport i32 @default_function(i8* noalias nocapture readonly %args, i32* noalias nocapture readonly %arg_type_ids, i32 %num_args, i8* noalias nocapture readnone %out_ret_value, i32* noalias nocapture readnone %out_ret_tcode, i8* noalias nocapture readnone %resource_handle) local_unnamed_addr #0 !dbg !5 {
entry:
  call void @llvm.dbg.value(metadata i8* %args, metadata !12, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32* %arg_type_ids, metadata !13, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %num_args, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i8* %out_ret_value, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32* %out_ret_tcode, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i8* %resource_handle, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = icmp eq i32 %num_args, 2, !dbg !18
  br i1 %0, label %assert_end, label %assert_fail, !dbg !18, !prof !19

assert_fail:                                      ; preds = %entry
  %1 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %1(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end:                                       ; preds = %entry
  %2 = bitcast i8* %args to %0**, !dbg !18
  %arg.A43 = load %0*, %0** %2, align 8, !dbg !18
  %arg.A.code = load i32, i32* %arg_type_ids, align 4, !dbg !18, !tbaa !23
  %3 = getelementptr inbounds i8, i8* %args, i64 8, !dbg !18
  %4 = bitcast i8* %3 to %0**, !dbg !18
  %arg.B44 = load %0*, %0** %4, align 8, !dbg !18
  %5 = getelementptr inbounds i32, i32* %arg_type_ids, i64 1, !dbg !18
  %arg.B.code = load i32, i32* %5, align 4, !dbg !18, !tbaa !34
  %6 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 0, !dbg !18
  %A = load i8*, i8** %6, align 8, !dbg !18
  %ptrint = ptrtoint i8* %A to i64, !dbg !18
  %maskedptr = and i64 %ptrint, 127, !dbg !18
  %maskcond = icmp eq i64 %maskedptr, 0, !dbg !18
  tail call void @llvm.assume(i1 %maskcond), !dbg !18
  %7 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 4, !dbg !18
  %arg.A.shape = load i64*, i64** %7, align 8, !dbg !18
  %8 = load i64, i64* %arg.A.shape, align 8, !dbg !18, !tbaa !36
  %n = trunc i64 %8 to i32, !dbg !18
  %9 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 5, !dbg !18
  %arg.A.strides = load i64*, i64** %9, align 8, !dbg !18
  %10 = icmp eq i32 %n, 1, !dbg !18
  br i1 %10, label %if_end, label %if_else, !dbg !18

if_else:                                          ; preds = %assert_end
  %11 = icmp eq i64* %arg.A.strides, null, !dbg !18
  br i1 %11, label %if_end, label %if_else2, !dbg !18

if_end:                                           ; preds = %if_else2, %if_else, %assert_end
  %stride = phi i32 [ 0, %assert_end ], [ %17, %if_else2 ], [ 1, %if_else ], !dbg !18
  %12 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 1, i32 1, !dbg !18
  %dev_id = load i32, i32* %12, align 4, !dbg !18
  %13 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 0, !dbg !18
  %B = load i8*, i8** %13, align 8, !dbg !18
  %ptrint4 = ptrtoint i8* %B to i64, !dbg !18
  %maskedptr5 = and i64 %ptrint4, 127, !dbg !18
  %maskcond6 = icmp eq i64 %maskedptr5, 0, !dbg !18
  tail call void @llvm.assume(i1 %maskcond6), !dbg !18
  %14 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 4, !dbg !18
  %arg.B.shape = load i64*, i64** %14, align 8, !dbg !18
  %15 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 5, !dbg !18
  %arg.B.strides = load i64*, i64** %15, align 8, !dbg !18
  br i1 %10, label %if_end9, label %if_else8, !dbg !18

if_else2:                                         ; preds = %if_else
  %16 = load i64, i64* %arg.A.strides, align 8, !dbg !18, !tbaa !46
  %17 = trunc i64 %16 to i32, !dbg !18
  br label %if_end, !dbg !18

if_else8:                                         ; preds = %if_end
  %18 = icmp eq i64* %arg.B.strides, null, !dbg !18
  br i1 %18, label %if_end9, label %if_else11, !dbg !18

if_end9:                                          ; preds = %if_else11, %if_else8, %if_end
  %stride42 = phi i32 [ 0, %if_end ], [ %20, %if_else11 ], [ 1, %if_else8 ], !dbg !18
  switch i32 %arg.A.code, label %assert_fail14 [
    i32 13, label %assert_end15
    i32 7, label %assert_end15
    i32 4, label %assert_end15
    i32 3, label %assert_end15
  ], !dbg !18

if_else11:                                        ; preds = %if_else8
  %19 = load i64, i64* %arg.B.strides, align 8, !dbg !18, !tbaa !56
  %20 = trunc i64 %19 to i32, !dbg !18
  br label %if_end9, !dbg !18

assert_fail14:                                    ; preds = %if_end9
  %21 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %21(i8* getelementptr inbounds ([148 x i8], [148 x i8]* @.str.1, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end15:                                     ; preds = %if_end9, %if_end9, %if_end9, %if_end9
  switch i32 %arg.B.code, label %assert_fail16 [
    i32 13, label %assert_end17
    i32 7, label %assert_end17
    i32 4, label %assert_end17
    i32 3, label %assert_end17
  ], !dbg !18

assert_fail16:                                    ; preds = %assert_end15
  %22 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %22(i8* getelementptr inbounds ([148 x i8], [148 x i8]* @.str.2, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end17:                                     ; preds = %assert_end15, %assert_end15, %assert_end15, %assert_end15
  %23 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 2, !dbg !18
  %24 = load i32, i32* %23, align 4, !dbg !18
  %25 = icmp eq i32 %24, 1, !dbg !18
  br i1 %25, label %assert_end21, label %assert_fail18, !dbg !18, !prof !19

assert_fail18:                                    ; preds = %assert_end17
  %26 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %26(i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.3, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end21:                                     ; preds = %assert_end17
  %27 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 3, i32 2, !dbg !18
  %28 = load i16, i16* %27, align 2, !dbg !18
  %29 = icmp eq i16 %28, 1, !dbg !18
  %30 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 3, i32 1, !dbg !18
  %31 = load i8, i8* %30, align 1, !dbg !18
  %32 = icmp eq i8 %31, 32, !dbg !18
  %33 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 3, i32 0, !dbg !18
  %34 = load i8, i8* %33, align 1, !dbg !18
  %35 = icmp eq i8 %34, 2, !dbg !18
  %36 = and i1 %32, %35, !dbg !18
  %37 = and i1 %29, %36, !dbg !18
  br i1 %37, label %assert_end23, label %assert_fail22, !dbg !18, !prof !19

assert_fail22:                                    ; preds = %assert_end21
  %38 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %38(i8* getelementptr inbounds ([202 x i8], [202 x i8]* @.str.4, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end23:                                     ; preds = %assert_end21
  %39 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 6, !dbg !18
  %40 = load i64, i64* %39, align 8, !dbg !18
  %41 = icmp eq i64 %40, 0, !dbg !18
  br i1 %41, label %assert_end25, label %assert_fail24, !dbg !18, !prof !19

assert_fail24:                                    ; preds = %assert_end23
  %42 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %42(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @.str.5, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end25:                                     ; preds = %assert_end23
  %43 = getelementptr inbounds %0, %0* %arg.A43, i64 0, i32 1, i32 0, !dbg !18
  %44 = load i32, i32* %43, align 4, !dbg !18
  %45 = icmp eq i32 %44, 1, !dbg !18
  br i1 %45, label %assert_end27, label %assert_fail26, !dbg !18, !prof !19

assert_fail26:                                    ; preds = %assert_end25
  %46 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %46(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @.str.6, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end27:                                     ; preds = %assert_end25
  %47 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 2, !dbg !18
  %48 = load i32, i32* %47, align 4, !dbg !18
  %49 = icmp eq i32 %48, 1, !dbg !18
  br i1 %49, label %assert_end31, label %assert_fail28, !dbg !18, !prof !19

assert_fail28:                                    ; preds = %assert_end27
  %50 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %50(i8* getelementptr inbounds ([87 x i8], [87 x i8]* @.str.7, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end31:                                     ; preds = %assert_end27
  %51 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 3, i32 2, !dbg !18
  %52 = load i16, i16* %51, align 2, !dbg !18
  %53 = icmp eq i16 %52, 1, !dbg !18
  %54 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 3, i32 1, !dbg !18
  %55 = load i8, i8* %54, align 1, !dbg !18
  %56 = icmp eq i8 %55, 32, !dbg !18
  %57 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 3, i32 0, !dbg !18
  %58 = load i8, i8* %57, align 1, !dbg !18
  %59 = icmp eq i8 %58, 2, !dbg !18
  %60 = and i1 %56, %59, !dbg !18
  %61 = and i1 %53, %60, !dbg !18
  br i1 %61, label %assert_end33, label %assert_fail32, !dbg !18, !prof !19

assert_fail32:                                    ; preds = %assert_end31
  %62 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %62(i8* getelementptr inbounds ([202 x i8], [202 x i8]* @.str.8, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end33:                                     ; preds = %assert_end31
  %63 = load i64, i64* %arg.B.shape, align 8, !dbg !18, !tbaa !66
  %64 = trunc i64 %63 to i32, !dbg !18
  %65 = icmp eq i32 %n, %64, !dbg !18
  br i1 %65, label %assert_end35, label %assert_fail34, !dbg !18, !prof !19

assert_fail34:                                    ; preds = %assert_end33
  %66 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %66(i8* getelementptr inbounds ([127 x i8], [127 x i8]* @.str.9, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end35:                                     ; preds = %assert_end33
  %67 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 6, !dbg !18
  %68 = load i64, i64* %67, align 8, !dbg !18
  %69 = icmp eq i64 %68, 0, !dbg !18
  br i1 %69, label %assert_end37, label %assert_fail36, !dbg !18, !prof !19

assert_fail36:                                    ; preds = %assert_end35
  %70 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %70(i8* getelementptr inbounds ([166 x i8], [166 x i8]* @.str.10, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end37:                                     ; preds = %assert_end35
  %71 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 1, i32 0, !dbg !18
  %72 = load i32, i32* %71, align 4, !dbg !18
  %73 = icmp eq i32 %72, 1, !dbg !18
  br i1 %73, label %assert_end39, label %assert_fail38, !dbg !18, !prof !19

assert_fail38:                                    ; preds = %assert_end37
  %74 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %74(i8* getelementptr inbounds ([152 x i8], [152 x i8]* @.str.11, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end39:                                     ; preds = %assert_end37
  %75 = getelementptr inbounds %0, %0* %arg.B44, i64 0, i32 1, i32 1, !dbg !18
  %76 = load i32, i32* %75, align 4, !dbg !18
  %77 = icmp eq i32 %dev_id, %76, !dbg !18
  br i1 %77, label %assert_end41, label %assert_fail40, !dbg !18, !prof !19

assert_fail40:                                    ; preds = %assert_end39
  %78 = load void (i8*)*, void (i8*)** @__TVMAPISetLastError, align 8, !dbg !18, !tbaa !20
  tail call void %78(i8* getelementptr inbounds ([158 x i8], [158 x i8]* @.str.12, i64 0, i64 0)), !dbg !18
  ret i32 -1, !dbg !18

assert_end41:                                     ; preds = %assert_end39
  tail call fastcc void @default_function_compute_(i32 %n, i8* %B, i32 %stride42, i8* %A, i32 %stride), !dbg !18
  ret i32 0, !dbg !18
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

; Function Attrs: nofree noinline norecurse nounwind
define internal fastcc void @default_function_compute_(i32 %0, i8* noalias nocapture align 128 %1, i32 %2, i8* noalias nocapture readonly align 128 %3, i32 %4) unnamed_addr #2 {
entry:
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %for_body_i.lr.ph, label %for_end_i, !prof !19

for_body_i.lr.ph:                                 ; preds = %entry
  %6 = bitcast i8* %3 to float*
  %7 = bitcast i8* %1 to float*
  %8 = sext i32 %2 to i64
  %9 = sext i32 %4 to i64
  %wide.trip.count = zext i32 %0 to i64
  %min.iters.check = icmp ult i32 %0, 8
  br i1 %min.iters.check, label %for_body_i.preheader, label %vector.scevcheck

vector.scevcheck:                                 ; preds = %for_body_i.lr.ph
  %ident.check = icmp ne i32 %4, 1
  %ident.check2 = icmp ne i32 %2, 1
  %10 = or i1 %ident.check, %ident.check2
  br i1 %10, label %for_body_i.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.scevcheck
  %n.vec = and i64 %wide.trip.count, 4294967288
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = mul nsw i64 %index, %9
  %12 = getelementptr inbounds float, float* %6, i64 %11
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %13, align 32, !tbaa !76
  %14 = getelementptr inbounds float, float* %12, i64 4
  %15 = bitcast float* %14 to <4 x float>*
  %wide.load4 = load <4 x float>, <4 x float>* %15, align 16, !tbaa !76
  %16 = fadd <4 x float> %wide.load, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
  %17 = fadd <4 x float> %wide.load4, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>
  %18 = mul nsw i64 %index, %8
  %19 = getelementptr inbounds float, float* %7, i64 %18
  %20 = bitcast float* %19 to <4 x float>*
  store <4 x float> %16, <4 x float>* %20, align 32, !tbaa !78
  %21 = getelementptr inbounds float, float* %19, i64 4
  %22 = bitcast float* %21 to <4 x float>*
  store <4 x float> %17, <4 x float>* %22, align 16, !tbaa !78
  %index.next = add i64 %index, 8
  %23 = icmp eq i64 %index.next, %n.vec
  br i1 %23, label %middle.block, label %vector.body, !llvm.loop !80

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count
  br i1 %cmp.n, label %for_end_i, label %for_body_i.preheader

for_body_i.preheader:                             ; preds = %middle.block, %vector.scevcheck, %for_body_i.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.scevcheck ], [ 0, %for_body_i.lr.ph ], [ %n.vec, %middle.block ]
  br label %for_body_i

for_body_i:                                       ; preds = %for_body_i.preheader, %for_body_i
  %indvars.iv = phi i64 [ %indvars.iv.next, %for_body_i ], [ %indvars.iv.ph, %for_body_i.preheader ]
  %24 = mul nsw i64 %indvars.iv, %9
  %25 = getelementptr inbounds float, float* %6, i64 %24
  %26 = load float, float* %25, align 4, !tbaa !76
  %27 = fadd float %26, 1.000000e+00
  %28 = mul nsw i64 %indvars.iv, %8
  %29 = getelementptr inbounds float, float* %7, i64 %28
  store float %27, float* %29, align 4, !tbaa !78
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for_end_i, label %for_body_i, !prof !82, !llvm.loop !83

for_end_i:                                        ; preds = %for_body_i, %middle.block, %entry
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #3

attributes #0 = { "target-cpu"="generic" }
attributes #1 = { nounwind willreturn }
attributes #2 = { nofree noinline norecurse nounwind "target-cpu"="generic" }
attributes #3 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4}

!0 = distinct !DICompileUnit(language: DW_LANG_C, file: !1, producer: "TVM", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, dwoId: 1)
!1 = !DIFile(filename: "model.tvm", directory: "/tmp/")
!2 = !{}
!3 = !{i32 2, !"tvm_target", !"llvm -mtriple=x86_64-pc-linux-gnu"}
!4 = !{i32 4, !"Debug Info Version", i32 3}
!5 = distinct !DISubprogram(name: "default_function", scope: !1, file: !1, type: !6, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !11)
!6 = !DISubroutineType(types: !7)
!7 = !{!8, !9, !10, !8, !9, !10, !9}
!8 = !DIBasicType(name: "int32", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8)
!11 = !{!12, !13, !14, !15, !16, !17}
!12 = !DILocalVariable(name: "arg1", arg: 1, scope: !5, file: !1, type: !9)
!13 = !DILocalVariable(name: "arg2", arg: 2, scope: !5, file: !1, type: !10)
!14 = !DILocalVariable(name: "arg3", arg: 3, scope: !5, file: !1, type: !8)
!15 = !DILocalVariable(name: "arg4", arg: 4, scope: !5, file: !1, type: !9)
!16 = !DILocalVariable(name: "arg5", arg: 5, scope: !5, file: !1, type: !10)
!17 = !DILocalVariable(name: "arg6", arg: 6, scope: !5, file: !1, type: !9)
!18 = !DILocation(line: 0, scope: !5)
!19 = !{!"branch_weights", i32 1048576, i32 1}
!20 = !{!21, !21, i64 0}
!21 = !{!"ctx_ptr", !22, i64 0}
!22 = !{!"tvm-tbaa"}
!23 = !{!24, !24, i64 0}
!24 = !{!"0x5629906bb110.w4.b0", !25, i64 0}
!25 = !{!"0x5629906bb110.w8.b0", !26, i64 0}
!26 = !{!"0x5629906bb110.w16.b0", !27, i64 0}
!27 = !{!"0x5629906bb110.w32.b0", !28, i64 0}
!28 = !{!"0x5629906bb110.w64.b0", !29, i64 0}
!29 = !{!"0x5629906bb110.w128.b0", !30, i64 0}
!30 = !{!"0x5629906bb110.w256.b0", !31, i64 0}
!31 = !{!"0x5629906bb110.w512.b0", !32, i64 0}
!32 = !{!"0x5629906bb110.w1024.b0", !33, i64 0}
!33 = !{!"0x5629906bb110", !22, i64 0}
!34 = !{!35, !35, i64 0}
!35 = !{!"0x5629906bb110.w4.b4", !25, i64 0}
!36 = !{!37, !37, i64 0}
!37 = !{!"0x5629906d9ae0.w8.b0", !38, i64 0}
!38 = !{!"0x5629906d9ae0.w16.b0", !39, i64 0}
!39 = !{!"0x5629906d9ae0.w32.b0", !40, i64 0}
!40 = !{!"0x5629906d9ae0.w64.b0", !41, i64 0}
!41 = !{!"0x5629906d9ae0.w128.b0", !42, i64 0}
!42 = !{!"0x5629906d9ae0.w256.b0", !43, i64 0}
!43 = !{!"0x5629906d9ae0.w512.b0", !44, i64 0}
!44 = !{!"0x5629906d9ae0.w1024.b0", !45, i64 0}
!45 = !{!"0x5629906d9ae0", !22, i64 0}
!46 = !{!47, !47, i64 0}
!47 = !{!"0x5629906d9cd0.w8.b0", !48, i64 0}
!48 = !{!"0x5629906d9cd0.w16.b0", !49, i64 0}
!49 = !{!"0x5629906d9cd0.w32.b0", !50, i64 0}
!50 = !{!"0x5629906d9cd0.w64.b0", !51, i64 0}
!51 = !{!"0x5629906d9cd0.w128.b0", !52, i64 0}
!52 = !{!"0x5629906d9cd0.w256.b0", !53, i64 0}
!53 = !{!"0x5629906d9cd0.w512.b0", !54, i64 0}
!54 = !{!"0x5629906d9cd0.w1024.b0", !55, i64 0}
!55 = !{!"0x5629906d9cd0", !22, i64 0}
!56 = !{!57, !57, i64 0}
!57 = !{!"0x5629906dbc00.w8.b0", !58, i64 0}
!58 = !{!"0x5629906dbc00.w16.b0", !59, i64 0}
!59 = !{!"0x5629906dbc00.w32.b0", !60, i64 0}
!60 = !{!"0x5629906dbc00.w64.b0", !61, i64 0}
!61 = !{!"0x5629906dbc00.w128.b0", !62, i64 0}
!62 = !{!"0x5629906dbc00.w256.b0", !63, i64 0}
!63 = !{!"0x5629906dbc00.w512.b0", !64, i64 0}
!64 = !{!"0x5629906dbc00.w1024.b0", !65, i64 0}
!65 = !{!"0x5629906dbc00", !22, i64 0}
!66 = !{!67, !67, i64 0}
!67 = !{!"0x5629906db7f0.w8.b0", !68, i64 0}
!68 = !{!"0x5629906db7f0.w16.b0", !69, i64 0}
!69 = !{!"0x5629906db7f0.w32.b0", !70, i64 0}
!70 = !{!"0x5629906db7f0.w64.b0", !71, i64 0}
!71 = !{!"0x5629906db7f0.w128.b0", !72, i64 0}
!72 = !{!"0x5629906db7f0.w256.b0", !73, i64 0}
!73 = !{!"0x5629906db7f0.w512.b0", !74, i64 0}
!74 = !{!"0x5629906db7f0.w1024.b0", !75, i64 0}
!75 = !{!"0x5629906db7f0", !22, i64 0}
!76 = !{!77, !77, i64 0}
!77 = !{!"0x5629906c7510", !22, i64 0}
!78 = !{!79, !79, i64 0}
!79 = !{!"0x5629906b8c90", !22, i64 0}
!80 = distinct !{!80, !81}
!81 = !{!"llvm.loop.isvectorized", i32 1}
!82 = !{!"branch_weights", i32 1, i32 1048576}
!83 = distinct !{!83, !81}

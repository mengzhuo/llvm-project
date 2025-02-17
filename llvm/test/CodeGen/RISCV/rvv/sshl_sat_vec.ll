; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=riscv64 -mattr=+v | FileCheck %s

declare <2 x i64> @llvm.sshl.sat.v2i64(<2 x i64>, <2 x i64>)
declare <4 x i32> @llvm.sshl.sat.v4i32(<4 x i32>, <4 x i32>)
declare <8 x i16> @llvm.sshl.sat.v8i16(<8 x i16>, <8 x i16>)
declare <16 x i8> @llvm.sshl.sat.v16i8(<16 x i8>, <16 x i8>)

define <2 x i64> @vec_v2i64(<2 x i64> %x, <2 x i64> %y) nounwind {
; CHECK-LABEL: vec_v2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e64, m1, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    li a0, -1
; CHECK-NEXT:    srli a1, a0, 1
; CHECK-NEXT:    slli a0, a0, 63
; CHECK-NEXT:    vmv.v.x v10, a1
; CHECK-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK-NEXT:    vsll.vv v11, v8, v9
; CHECK-NEXT:    vsra.vv v9, v11, v9
; CHECK-NEXT:    vmsne.vv v0, v8, v9
; CHECK-NEXT:    vmerge.vvm v8, v11, v10, v0
; CHECK-NEXT:    ret
  %tmp = call <2 x i64> @llvm.sshl.sat.v2i64(<2 x i64> %x, <2 x i64> %y)
  ret <2 x i64> %tmp
}

define <4 x i32> @vec_v4i32(<4 x i32> %x, <4 x i32> %y) nounwind {
; CHECK-LABEL: vec_v4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    lui a0, 524288
; CHECK-NEXT:    addi a1, a0, -1
; CHECK-NEXT:    vmv.v.x v10, a1
; CHECK-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK-NEXT:    vsll.vv v11, v8, v9
; CHECK-NEXT:    vsra.vv v9, v11, v9
; CHECK-NEXT:    vmsne.vv v0, v8, v9
; CHECK-NEXT:    vmerge.vvm v8, v11, v10, v0
; CHECK-NEXT:    ret
  %tmp = call <4 x i32> @llvm.sshl.sat.v4i32(<4 x i32> %x, <4 x i32> %y)
  ret <4 x i32> %tmp
}

define <8 x i16> @vec_v8i16(<8 x i16> %x, <8 x i16> %y) nounwind {
; CHECK-LABEL: vec_v8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    lui a0, 8
; CHECK-NEXT:    addi a1, a0, -1
; CHECK-NEXT:    vmv.v.x v10, a1
; CHECK-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK-NEXT:    vsll.vv v11, v8, v9
; CHECK-NEXT:    vsra.vv v9, v11, v9
; CHECK-NEXT:    vmsne.vv v0, v8, v9
; CHECK-NEXT:    vmerge.vvm v8, v11, v10, v0
; CHECK-NEXT:    ret
  %tmp = call <8 x i16> @llvm.sshl.sat.v8i16(<8 x i16> %x, <8 x i16> %y)
  ret <8 x i16> %tmp
}

define <16 x i8> @vec_v16i8(<16 x i8> %x, <16 x i8> %y) nounwind {
; CHECK-LABEL: vec_v16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e8, m1, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    li a0, 127
; CHECK-NEXT:    vmv.v.x v10, a0
; CHECK-NEXT:    li a0, 128
; CHECK-NEXT:    vmerge.vxm v10, v10, a0, v0
; CHECK-NEXT:    vsll.vv v11, v8, v9
; CHECK-NEXT:    vsra.vv v9, v11, v9
; CHECK-NEXT:    vmsne.vv v0, v8, v9
; CHECK-NEXT:    vmerge.vvm v8, v11, v10, v0
; CHECK-NEXT:    ret
  %tmp = call <16 x i8> @llvm.sshl.sat.v16i8(<16 x i8> %x, <16 x i8> %y)
  ret <16 x i8> %tmp
}

declare <vscale x 2 x i64> @llvm.sshl.sat.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)
declare <vscale x 4 x i32> @llvm.sshl.sat.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)
declare <vscale x 8 x i16> @llvm.sshl.sat.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)
declare <vscale x 16 x i8> @llvm.sshl.sat.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>)

define <vscale x 2 x i64> @vec_nxv2i64(<vscale x 2 x i64> %x, <vscale x 2 x i64> %y) nounwind {
; CHECK-LABEL: vec_nxv2i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e64, m2, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    li a0, -1
; CHECK-NEXT:    srli a1, a0, 1
; CHECK-NEXT:    slli a0, a0, 63
; CHECK-NEXT:    vmv.v.x v12, a1
; CHECK-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK-NEXT:    vsll.vv v14, v8, v10
; CHECK-NEXT:    vsra.vv v10, v14, v10
; CHECK-NEXT:    vmsne.vv v0, v8, v10
; CHECK-NEXT:    vmerge.vvm v8, v14, v12, v0
; CHECK-NEXT:    ret
  %tmp = call <vscale x 2 x i64> @llvm.sshl.sat.nxv2i64(<vscale x 2 x i64> %x, <vscale x 2 x i64> %y)
  ret <vscale x 2 x i64> %tmp
}

define <vscale x 4 x i32> @vec_nxv4i32(<vscale x 4 x i32> %x, <vscale x 4 x i32> %y) nounwind {
; CHECK-LABEL: vec_nxv4i32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e32, m2, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    lui a0, 524288
; CHECK-NEXT:    addi a1, a0, -1
; CHECK-NEXT:    vmv.v.x v12, a1
; CHECK-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK-NEXT:    vsll.vv v14, v8, v10
; CHECK-NEXT:    vsra.vv v10, v14, v10
; CHECK-NEXT:    vmsne.vv v0, v8, v10
; CHECK-NEXT:    vmerge.vvm v8, v14, v12, v0
; CHECK-NEXT:    ret
  %tmp = call <vscale x 4 x i32> @llvm.sshl.sat.nxv4i32(<vscale x 4 x i32> %x, <vscale x 4 x i32> %y)
  ret <vscale x 4 x i32> %tmp
}

define <vscale x 8 x i16> @vec_nxv8i16(<vscale x 8 x i16> %x, <vscale x 8 x i16> %y) nounwind {
; CHECK-LABEL: vec_nxv8i16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e16, m2, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    lui a0, 8
; CHECK-NEXT:    addi a1, a0, -1
; CHECK-NEXT:    vmv.v.x v12, a1
; CHECK-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK-NEXT:    vsll.vv v14, v8, v10
; CHECK-NEXT:    vsra.vv v10, v14, v10
; CHECK-NEXT:    vmsne.vv v0, v8, v10
; CHECK-NEXT:    vmerge.vvm v8, v14, v12, v0
; CHECK-NEXT:    ret
  %tmp = call <vscale x 8 x i16> @llvm.sshl.sat.nxv8i16(<vscale x 8 x i16> %x, <vscale x 8 x i16> %y)
  ret <vscale x 8 x i16> %tmp
}

define <vscale x 16 x i8> @vec_nxv16i8(<vscale x 16 x i8> %x, <vscale x 16 x i8> %y) nounwind {
; CHECK-LABEL: vec_nxv16i8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetvli a0, zero, e8, m2, ta, ma
; CHECK-NEXT:    vmsle.vi v0, v8, -1
; CHECK-NEXT:    li a0, 127
; CHECK-NEXT:    vmv.v.x v12, a0
; CHECK-NEXT:    li a0, 128
; CHECK-NEXT:    vmerge.vxm v12, v12, a0, v0
; CHECK-NEXT:    vsll.vv v14, v8, v10
; CHECK-NEXT:    vsra.vv v10, v14, v10
; CHECK-NEXT:    vmsne.vv v0, v8, v10
; CHECK-NEXT:    vmerge.vvm v8, v14, v12, v0
; CHECK-NEXT:    ret
  %tmp = call <vscale x 16 x i8> @llvm.sshl.sat.nxv16i8(<vscale x 16 x i8> %x, <vscale x 16 x i8> %y)
  ret <vscale x 16 x i8> %tmp
}

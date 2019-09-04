(module
  (type $t0 (func (param i32) (result i32)))
  (type $t1 (func (param i32 i32) (result i32)))
  (type $t2 (func (result i32)))
  (type $t3 (func (param i32 i32 i32)))
  (type $t4 (func (param i32 i32 i32 i32)))
  (type $t5 (func (param i32 i32)))
  (type $t6 (func))
  (type $t7 (func (param i32)))
  (type $t8 (func (param i32 i32 i32) (result i32)))
  (type $t9 (func (param i32 i32 i32 i32 i32) (result i32)))
  (import "env" "ext_input_size" (func $ext_input_size (type $t2)))
  (import "env" "ext_input_copy" (func $ext_input_copy (type $t3)))
  (import "env" "ext_get_storage" (func $ext_get_storage (type $t0)))
  (import "env" "ext_scratch_size" (func $ext_scratch_size (type $t2)))
  (import "env" "ext_scratch_copy" (func $ext_scratch_copy (type $t3)))
  (import "env" "ext_set_storage" (func $ext_set_storage (type $t4)))
  (import "env" "llvm.wasm.grow.memory.i32" (func $llvm.wasm.grow.memory.i32 (type $t0)))
  (import "env" "ext_return" (func $ext_return (type $t5)))
  (func $_ZN4core6option15Option$LT$T$GT$9unwrap_or17habebdef928c7f664E (type $t3) (param $p0 i32) (param $p1 i32) (param $p2 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eqz
            (i32.load
              (local.get $p1))))
        (i64.store align=4
          (local.get $p0)
          (i64.load align=4
            (local.get $p1)))
        (i32.store
          (i32.add
            (local.get $p0)
            (i32.const 8))
          (i32.load
            (i32.add
              (local.get $p1)
              (i32.const 8))))
        (br_if $B0
          (i32.eqz
            (local.tee $p1
              (i32.load
                (i32.add
                  (local.get $p2)
                  (i32.const 4))))))
        (call $__rust_dealloc
          (i32.load
            (local.get $p2))
          (local.get $p1))
        (return))
      (i64.store align=4
        (local.get $p0)
        (i64.load align=4
          (local.get $p2)))
      (i32.store
        (i32.add
          (local.get $p0)
          (i32.const 8))
        (i32.load
          (i32.add
            (local.get $p2)
            (i32.const 8))))))
  (func $__rust_dealloc (type $t5) (param $p0 i32) (param $p1 i32)
    (call $__rg_dealloc
      (local.get $p0)
      (local.get $p1)))
  (func $rust_oom (type $t5) (param $p0 i32) (param $p1 i32)
    (unreachable)
    (unreachable))
  (func $call (export "call") (type $t6)
    (local $l0 i32) (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i64) (local $l8 i32)
    (global.set $g0
      (local.tee $l0
        (i32.sub
          (global.get $g0)
          (i32.const 48))))
    (block $B0
      (block $B1
        (br_if $B1
          (local.tee $l1
            (call $ext_input_size)))
        (local.set $l2
          (i32.const 1))
        (local.set $l1
          (i32.const 0))
        (local.set $l3
          (i32.const 0))
        (br $B0))
      (i32.store offset=40
        (local.get $l0)
        (i32.const 0))
      (i64.store offset=32
        (local.get $l0)
        (i64.const 1))
      (call $_ZN5alloc3vec12Vec$LT$T$GT$6resize17h0194f80955055f55E
        (i32.add
          (local.get $l0)
          (i32.const 32))
        (local.get $l1))
      (call $ext_input_copy
        (local.tee $l2
          (i32.load offset=32
            (local.get $l0)))
        (i32.const 0)
        (local.get $l1))
      (local.set $l1
        (i32.load offset=40
          (local.get $l0)))
      (local.set $l3
        (i32.load offset=36
          (local.get $l0))))
    (i32.store8 offset=32
      (local.get $l0)
      (i32.const 0))
    (drop
      (call $memcpy
        (i32.add
          (local.get $l0)
          (i32.const 32))
        (local.get $l2)
        (local.tee $l4
          (i32.ne
            (local.get $l1)
            (i32.const 0)))))
    (block $B2
      (block $B3
        (block $B4
          (br_if $B4
            (i32.lt_u
              (local.get $l1)
              (local.get $l4)))
          (br_if $B2
            (i32.eqz
              (local.get $l1)))
          (block $B5
            (br_if $B5
              (i32.eqz
                (local.tee $l5
                  (i32.load8_u offset=32
                    (local.get $l0)))))
            (br_if $B2
              (i32.ne
                (local.get $l5)
                (i32.const 1)))
            (call $_ZN25substrate_contracts_adder3ext11get_storage17hcedfa79e44d8d20eE
              (i32.add
                (local.get $l0)
                (i32.const 16)))
            (i32.store offset=40
              (local.get $l0)
              (i32.const 0))
            (i64.store offset=32
              (local.get $l0)
              (i64.const 1))
            (call $_ZN4core6option15Option$LT$T$GT$9unwrap_or17habebdef928c7f664E
              (local.get $l0)
              (i32.add
                (local.get $l0)
                (i32.const 16))
              (i32.add
                (local.get $l0)
                (i32.const 32)))
            (call $_ZN25substrate_contracts_adder3ext7return_17hb06b3dd5414755d4E
              (i32.load
                (local.get $l0))
              (i32.load offset=8
                (local.get $l0)))
            (unreachable))
          (i32.store offset=32
            (local.get $l0)
            (i32.const 0))
          (drop
            (call $memcpy
              (i32.add
                (local.get $l0)
                (i32.const 32))
              (i32.add
                (local.get $l2)
                (local.get $l4))
              (select
                (local.tee $l1
                  (i32.sub
                    (local.get $l1)
                    (local.get $l4)))
                (i32.const 4)
                (i32.lt_u
                  (local.get $l1)
                  (i32.const 4)))))
          (br_if $B2
            (i32.le_u
              (local.get $l1)
              (i32.const 3)))
          (local.set $l5
            (i32.load offset=32
              (local.get $l0)))
          (block $B6
            (block $B7
              (br_if $B7
                (call $ext_get_storage
                  (i32.const 65624)))
              (local.set $l1
                (call $ext_scratch_size))
              (i32.store offset=40
                (local.get $l0)
                (i32.const 0))
              (i64.store offset=32
                (local.get $l0)
                (i64.const 1))
              (block $B8
                (block $B9
                  (br_if $B9
                    (local.get $l1))
                  (local.set $l6
                    (i32.const 1))
                  (br $B8))
                (call $_ZN5alloc3vec12Vec$LT$T$GT$6resize17h0194f80955055f55E
                  (i32.add
                    (local.get $l0)
                    (i32.const 32))
                  (local.get $l1))
                (call $ext_scratch_copy
                  (local.tee $l6
                    (i32.load offset=32
                      (local.get $l0)))
                  (i32.const 0)
                  (local.get $l1)))
              (local.set $l7
                (i64.load offset=36 align=4
                  (local.get $l0)))
              (i32.store offset=32
                (local.get $l0)
                (i32.const 0))
              (drop
                (call $memcpy
                  (i32.add
                    (local.get $l0)
                    (i32.const 32))
                  (local.get $l6)
                  (select
                    (local.tee $l1
                      (i32.wrap_i64
                        (i64.shr_u
                          (local.get $l7)
                          (i64.const 32))))
                    (i32.const 4)
                    (i32.lt_u
                      (local.get $l1)
                      (i32.const 4)))))
              (local.set $l4
                (i32.load offset=32
                  (local.get $l0)))
              (block $B10
                (br_if $B10
                  (i32.eqz
                    (local.tee $l8
                      (i32.wrap_i64
                        (local.get $l7)))))
                (call $__rust_dealloc
                  (local.get $l6)
                  (local.get $l8)))
              (br_if $B6
                (i32.gt_u
                  (local.get $l1)
                  (i32.const 3))))
            (local.set $l4
              (i32.const 0)))
          (br_if $B3
            (i32.eqz
              (local.tee $l1
                (call $__rust_alloc
                  (i32.const 4)))))
          (i32.store align=1
            (local.get $l1)
            (i32.add
              (local.get $l4)
              (local.get $l5)))
          (call $ext_set_storage
            (i32.const 65624)
            (i32.const 1)
            (local.get $l1)
            (i32.const 4))
          (call $__rust_dealloc
            (local.get $l1)
            (i32.const 4))
          (block $B11
            (br_if $B11
              (i32.eqz
                (local.get $l3)))
            (call $__rust_dealloc
              (local.get $l2)
              (local.get $l3)))
          (global.set $g0
            (i32.add
              (local.get $l0)
              (i32.const 48)))
          (return))
        (call $_ZN4core5slice22slice_index_order_fail17h9230fde0b378c506E
          (local.get $l4)
          (local.get $l1))
        (unreachable))
      (call $rust_oom
        (i32.const 4)
        (i32.const 1))
      (unreachable))
    (call $_ZN4core9panicking5panic17hf39d891790cd9f1dE
      (i32.const 65600))
    (unreachable))
  (func $_ZN5alloc3vec12Vec$LT$T$GT$6resize17h0194f80955055f55E (type $t5) (param $p0 i32) (param $p1 i32)
    (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.lt_u
              (local.tee $l2
                (i32.load
                  (i32.add
                    (local.get $p0)
                    (i32.const 8))))
              (local.get $p1)))
          (br_if $B1
            (i32.le_u
              (local.get $l2)
              (local.get $p1)))
          (loop $L3
            (br_if $L3
              (i32.ne
                (local.get $p1)
                (local.tee $l2
                  (i32.add
                    (local.get $l2)
                    (i32.const -1)))))
            (br $B1)))
        (block $B4
          (block $B5
            (block $B6
              (block $B7
                (br_if $B7
                  (i32.lt_u
                    (i32.sub
                      (local.tee $l3
                        (i32.load
                          (i32.add
                            (local.get $p0)
                            (i32.const 4))))
                      (local.get $l2))
                    (local.tee $l4
                      (i32.sub
                        (local.get $p1)
                        (local.get $l2)))))
                (local.set $l5
                  (i32.load
                    (local.get $p0)))
                (local.set $l3
                  (local.get $l2))
                (br $B6))
              (block $B8
                (br_if $B8
                  (i32.ge_u
                    (local.tee $l5
                      (i32.add
                        (local.get $l2)
                        (local.get $l4)))
                    (local.get $l2)))
                (local.set $l6
                  (i32.const 0))
                (br $B0))
              (local.set $l6
                (i32.const 0))
              (br_if $B0
                (i32.lt_s
                  (local.tee $l7
                    (select
                      (local.tee $l7
                        (i32.shl
                          (local.get $l3)
                          (i32.const 1)))
                      (local.get $l5)
                      (i32.lt_u
                        (local.get $l5)
                        (local.get $l7))))
                  (i32.const 0)))
              (block $B9
                (block $B10
                  (br_if $B10
                    (local.get $l3))
                  (local.set $l5
                    (call $__rust_alloc
                      (local.get $l7)))
                  (br $B9))
                (local.set $l5
                  (call $__rust_realloc
                    (i32.load
                      (local.get $p0))
                    (local.get $l3)
                    (local.get $l7))))
              (br_if $B5
                (i32.eqz
                  (local.get $l5)))
              (i32.store
                (local.get $p0)
                (local.get $l5))
              (i32.store
                (i32.add
                  (local.get $p0)
                  (i32.const 4))
                (local.get $l7))
              (local.set $l3
                (i32.load
                  (i32.add
                    (local.get $p0)
                    (i32.const 8)))))
            (block $B11
              (br_if $B11
                (i32.lt_u
                  (local.get $l4)
                  (i32.const 2)))
              (local.set $l2
                (i32.add
                  (i32.xor
                    (local.get $l2)
                    (i32.const -1))
                  (local.get $p1)))
              (loop $L12
                (i32.store8
                  (i32.add
                    (local.get $l5)
                    (local.get $l3))
                  (i32.const 0))
                (local.set $l3
                  (i32.add
                    (local.get $l3)
                    (i32.const 1)))
                (br_if $L12
                  (local.tee $l2
                    (i32.add
                      (local.get $l2)
                      (i32.const -1))))
                (br $B4)))
            (br_if $B4
              (local.get $l4))
            (local.set $l2
              (local.get $l3))
            (br $B1))
          (call $rust_oom
            (local.get $l7)
            (i32.const 1))
          (unreachable))
        (i32.store8
          (i32.add
            (local.get $l5)
            (local.get $l3))
          (i32.const 0))
        (local.set $l2
          (i32.add
            (local.get $l3)
            (i32.const 1))))
      (i32.store
        (i32.add
          (local.get $p0)
          (i32.const 8))
        (local.get $l2))
      (return))
    (block $B13
      (br_if $B13
        (local.get $l6))
      (call $_ZN5alloc7raw_vec17capacity_overflow17h1985a4e869ed33afE)
      (unreachable))
    (call $_ZN4core9panicking5panic17hf39d891790cd9f1dE
      (i32.const 65772))
    (unreachable))
  (func $_ZN25substrate_contracts_adder3ext11get_storage17hcedfa79e44d8d20eE (type $t7) (param $p0 i32)
    (local $l1 i32) (local $l2 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eqz
            (call $ext_get_storage
              (i32.const 65624))))
        (i32.store
          (local.get $p0)
          (i32.const 0))
        (br $B0))
      (local.set $l2
        (call $ext_scratch_size))
      (i32.store offset=8
        (local.get $l1)
        (i32.const 0))
      (i64.store
        (local.get $l1)
        (i64.const 1))
      (block $B2
        (br_if $B2
          (i32.eqz
            (local.get $l2)))
        (call $_ZN5alloc3vec12Vec$LT$T$GT$6resize17h0194f80955055f55E
          (local.get $l1)
          (local.get $l2))
        (call $ext_scratch_copy
          (i32.load
            (local.get $l1))
          (i32.const 0)
          (local.get $l2)))
      (i64.store align=4
        (local.get $p0)
        (i64.load
          (local.get $l1)))
      (i32.store
        (i32.add
          (local.get $p0)
          (i32.const 8))
        (i32.load
          (i32.add
            (local.get $l1)
            (i32.const 8)))))
    (global.set $g0
      (i32.add
        (local.get $l1)
        (i32.const 16))))
  (func $_ZN25substrate_contracts_adder3ext7return_17hb06b3dd5414755d4E (type $t5) (param $p0 i32) (param $p1 i32)
    (call $ext_return
      (local.get $p0)
      (local.get $p1))
    (unreachable))
  (func $__rust_alloc (type $t0) (param $p0 i32) (result i32)
    (call $__rg_alloc
      (local.get $p0)))
  (func $_ZN4core5slice22slice_index_order_fail17h9230fde0b378c506E (type $t5) (param $p0 i32) (param $p1 i32)
    (call $_ZN4core9panicking9panic_fmt17hbf47faeb15c12ec4E)
    (unreachable))
  (func $_ZN4core9panicking5panic17hf39d891790cd9f1dE (type $t7) (param $p0 i32)
    (call $_ZN4core9panicking9panic_fmt17hbf47faeb15c12ec4E)
    (unreachable))
  (func $deploy (export "deploy") (type $t6))
  (func $__rg_alloc (type $t0) (param $p0 i32) (result i32)
    (call $_ZN64_$LT$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..GlobalAlloc$GT$5alloc17h10143dfc8a7c1edfE
      (local.get $p0)))
  (func $_ZN64_$LT$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..GlobalAlloc$GT$5alloc17h10143dfc8a7c1edfE (type $t0) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (global.set $g0
      (local.tee $l1
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (block $B1
        (br_if $B1
          (local.get $p0))
        (local.set $p0
          (i32.const 1))
        (br $B0))
      (block $B2
        (br_if $B2
          (i32.gt_u
            (local.tee $p0
              (i32.add
                (local.tee $l3
                  (i32.shr_u
                    (local.tee $l2
                      (i32.add
                        (local.get $p0)
                        (i32.const 3)))
                    (i32.const 2)))
                (i32.const -1)))
            (i32.const 255)))
        (i32.store offset=4
          (local.get $l1)
          (i32.const 65860))
        (i32.store offset=8
          (local.get $l1)
          (i32.load
            (local.tee $l2
              (i32.add
                (i32.shl
                  (local.get $p0)
                  (i32.const 2))
                (i32.const 65864)))))
        (block $B3
          (br_if $B3
            (local.tee $p0
              (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
                (local.get $l3)
                (i32.const 1)
                (i32.add
                  (local.get $l1)
                  (i32.const 8))
                (i32.add
                  (local.get $l1)
                  (i32.const 4))
                (i32.const 65656))))
          (i32.store offset=12
            (local.get $l1)
            (i32.load
              (local.tee $l4
                (i32.load offset=4
                  (local.get $l1)))))
          (block $B4
            (block $B5
              (br_if $B5
                (i32.eqz
                  (local.tee $l6
                    (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
                      (local.tee $l5
                        (select
                          (local.tee $p0
                            (i32.mul
                              (local.tee $p0
                                (i32.add
                                  (local.get $l3)
                                  (i32.const 2)))
                              (local.get $p0)))
                          (i32.const 2048)
                          (i32.gt_u
                            (local.get $p0)
                            (i32.const 2048))))
                      (i32.const 4)
                      (i32.add
                        (local.get $l1)
                        (i32.const 12))
                      (i32.const 1)
                      (i32.const 65704)))))
              (i32.store
                (local.get $l4)
                (i32.load offset=12
                  (local.get $l1)))
              (local.set $l7
                (i32.shl
                  (local.get $l5)
                  (i32.const 2)))
              (br $B4))
            (block $B6
              (br_if $B6
                (i32.ne
                  (local.tee $l6
                    (call $llvm.wasm.grow.memory.i32
                      (i32.shr_u
                        (local.tee $p0
                          (i32.add
                            (select
                              (local.tee $l7
                                (i32.shl
                                  (local.get $l5)
                                  (i32.const 2)))
                              (i32.const 16416)
                              (i32.gt_u
                                (local.get $l7)
                                (i32.const 16416)))
                            (i32.const 65543)))
                        (i32.const 16))))
                  (i32.const -1)))
              (i32.store
                (local.get $l4)
                (i32.load offset=12
                  (local.get $l1)))
              (local.set $p0
                (i32.const 0))
              (br $B3))
            (i32.store
              (local.tee $l6
                (i32.shl
                  (local.get $l6)
                  (i32.const 16)))
              (i32.or
                (i32.add
                  (local.get $l6)
                  (i32.and
                    (local.get $p0)
                    (i32.const -65536)))
                (i32.const 2)))
            (local.set $p0
              (i32.const 0))
            (i32.store offset=4
              (local.get $l6)
              (i32.const 0))
            (i32.store offset=8
              (local.get $l6)
              (i32.load offset=12
                (local.get $l1)))
            (i32.store offset=12
              (local.get $l1)
              (local.get $l6))
            (local.set $l6
              (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
                (local.get $l5)
                (i32.const 4)
                (i32.add
                  (local.get $l1)
                  (i32.const 12))
                (i32.const 1)
                (i32.const 65704)))
            (i32.store
              (local.get $l4)
              (i32.load offset=12
                (local.get $l1)))
            (br_if $B3
              (i32.eqz
                (local.get $l6))))
          (i32.store offset=4
            (local.get $l6)
            (i32.const 0))
          (i32.store offset=8
            (local.get $l6)
            (i32.load offset=8
              (local.get $l1)))
          (i32.store
            (local.get $l6)
            (i32.or
              (i32.add
                (local.get $l6)
                (local.get $l7))
              (i32.const 2)))
          (i32.store offset=8
            (local.get $l1)
            (local.get $l6))
          (local.set $p0
            (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
              (local.get $l3)
              (i32.const 1)
              (i32.add
                (local.get $l1)
                (i32.const 8))
              (i32.add
                (local.get $l1)
                (i32.const 4))
              (i32.const 65656))))
        (i32.store
          (local.get $l2)
          (i32.load offset=8
            (local.get $l1)))
        (br $B0))
      (i32.store offset=12
        (local.get $l1)
        (i32.load offset=65860
          (i32.const 0)))
      (block $B7
        (br_if $B7
          (local.tee $p0
            (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
              (local.get $l3)
              (i32.const 1)
              (i32.add
                (local.get $l1)
                (i32.const 12))
              (i32.const 65769)
              (i32.const 65680))))
        (local.set $p0
          (i32.const 0))
        (br_if $B7
          (i32.eq
            (local.tee $l6
              (call $llvm.wasm.grow.memory.i32
                (i32.shr_u
                  (local.tee $l2
                    (i32.add
                      (select
                        (local.tee $l2
                          (i32.and
                            (local.get $l2)
                            (i32.const -4)))
                        (i32.const 16392)
                        (i32.gt_u
                          (local.get $l2)
                          (i32.const 16392)))
                      (i32.const 65543)))
                  (i32.const 16))))
            (i32.const -1)))
        (i32.store
          (local.tee $p0
            (i32.shl
              (local.get $l6)
              (i32.const 16)))
          (i32.or
            (i32.add
              (local.get $p0)
              (i32.and
                (local.get $l2)
                (i32.const -65536)))
            (i32.const 2)))
        (i32.store offset=4
          (local.get $p0)
          (i32.const 0))
        (i32.store offset=8
          (local.get $p0)
          (i32.load offset=12
            (local.get $l1)))
        (i32.store offset=12
          (local.get $l1)
          (local.get $p0))
        (local.set $p0
          (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
            (local.get $l3)
            (i32.const 1)
            (i32.add
              (local.get $l1)
              (i32.const 12))
            (i32.const 65769)
            (i32.const 65680))))
      (i32.store offset=65860
        (i32.const 0)
        (i32.load offset=12
          (local.get $l1))))
    (global.set $g0
      (i32.add
        (local.get $l1)
        (i32.const 16)))
    (local.get $p0))
  (func $__rg_dealloc (type $t5) (param $p0 i32) (param $p1 i32)
    (local $l2 i32)
    (global.set $g0
      (local.tee $l2
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p0)))
      (i32.store offset=4
        (local.get $l2)
        (local.get $p0))
      (br_if $B0
        (i32.eqz
          (local.get $p1)))
      (block $B1
        (br_if $B1
          (i32.gt_u
            (local.tee $p0
              (i32.add
                (i32.shr_u
                  (i32.add
                    (local.get $p1)
                    (i32.const 3))
                  (i32.const 2))
                (i32.const -1)))
            (i32.const 255)))
        (i32.store offset=8
          (local.get $l2)
          (i32.const 65860))
        (i32.store offset=12
          (local.get $l2)
          (i32.load
            (local.tee $p0
              (i32.add
                (i32.shl
                  (local.get $p0)
                  (i32.const 2))
                (i32.const 65864)))))
        (call $_ZN62_$LT$$RF$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..Alloc$GT$7dealloc28_$u7b$$u7b$closure$u7d$$u7d$17h5ddeb4858ad80e6fE
          (i32.add
            (local.get $l2)
            (i32.const 4))
          (i32.add
            (local.get $l2)
            (i32.const 12))
          (i32.add
            (local.get $l2)
            (i32.const 8))
          (i32.const 65656))
        (i32.store
          (local.get $p0)
          (i32.load offset=12
            (local.get $l2)))
        (br $B0))
      (i32.store offset=12
        (local.get $l2)
        (i32.load offset=65860
          (i32.const 0)))
      (call $_ZN62_$LT$$RF$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..Alloc$GT$7dealloc28_$u7b$$u7b$closure$u7d$$u7d$17h5ddeb4858ad80e6fE
        (i32.add
          (local.get $l2)
          (i32.const 4))
        (i32.add
          (local.get $l2)
          (i32.const 12))
        (i32.const 65769)
        (i32.const 65680))
      (i32.store offset=65860
        (i32.const 0)
        (i32.load offset=12
          (local.get $l2))))
    (global.set $g0
      (i32.add
        (local.get $l2)
        (i32.const 16))))
  (func $_ZN62_$LT$$RF$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..Alloc$GT$7dealloc28_$u7b$$u7b$closure$u7d$$u7d$17h5ddeb4858ad80e6fE (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32)
    (i32.store
      (local.tee $l4
        (i32.load
          (local.get $p0)))
      (i32.const 0))
    (i32.store
      (local.tee $p0
        (i32.add
          (local.get $l4)
          (i32.const -8)))
      (i32.and
        (i32.load
          (local.get $p0))
        (i32.const -2)))
    (block $B0
      (br_if $B0
        (i32.eqz
          (call_indirect (type $t0) $T0
            (local.get $p2)
            (i32.load offset=20
              (local.get $p3)))))
      (block $B1
        (block $B2
          (br_if $B2
            (i32.eqz
              (local.tee $p2
                (i32.and
                  (i32.load
                    (local.tee $p3
                      (i32.add
                        (local.get $l4)
                        (i32.const -4))))
                  (i32.const -4)))))
          (br_if $B1
            (i32.eqz
              (i32.and
                (local.tee $l5
                  (i32.load
                    (local.get $p2)))
                (i32.const 1)))))
        (br_if $B0
          (i32.eqz
            (local.tee $p3
              (i32.and
                (local.tee $p2
                  (i32.load
                    (local.get $p0)))
                (i32.const -4)))))
        (br_if $B0
          (i32.and
            (local.get $p2)
            (i32.const 2)))
        (br_if $B0
          (i32.and
            (i32.load8_u
              (local.get $p3))
            (i32.const 1)))
        (i32.store
          (local.get $l4)
          (i32.and
            (i32.load offset=8
              (local.get $p3))
            (i32.const -4)))
        (i32.store offset=8
          (local.get $p3)
          (i32.or
            (local.get $p0)
            (i32.const 1)))
        (return))
      (block $B3
        (block $B4
          (block $B5
            (br_if $B5
              (local.tee $l4
                (i32.and
                  (local.tee $p1
                    (i32.load
                      (local.get $p0)))
                  (i32.const -4))))
            (local.set $p1
              (local.get $p2))
            (br $B4))
          (block $B6
            (br_if $B6
              (i32.eqz
                (i32.and
                  (local.get $p1)
                  (i32.const 2))))
            (local.set $p1
              (local.get $p2))
            (br $B4))
          (i32.store offset=4
            (local.get $l4)
            (i32.or
              (i32.and
                (i32.load offset=4
                  (local.get $l4))
                (i32.const 3))
              (local.get $p2)))
          (br_if $B3
            (i32.eqz
              (local.tee $p1
                (i32.and
                  (local.tee $l4
                    (i32.load
                      (local.get $p3)))
                  (i32.const -4)))))
          (local.set $l4
            (i32.and
              (i32.load
                (local.get $p0))
              (i32.const -4)))
          (local.set $l5
            (i32.load
              (local.get $p1))))
        (i32.store
          (local.get $p1)
          (i32.or
            (i32.and
              (local.get $l5)
              (i32.const 3))
            (local.get $l4)))
        (local.set $l4
          (i32.load
            (local.get $p3))))
      (i32.store
        (local.get $p3)
        (i32.and
          (local.get $l4)
          (i32.const 3)))
      (i32.store
        (local.get $p0)
        (i32.and
          (local.tee $l4
            (i32.load
              (local.get $p0)))
          (i32.const 3)))
      (block $B7
        (br_if $B7
          (i32.eqz
            (i32.and
              (local.get $l4)
              (i32.const 2))))
        (i32.store
          (local.get $p2)
          (i32.or
            (i32.load
              (local.get $p2))
            (i32.const 2))))
      (return))
    (i32.store
      (local.get $l4)
      (i32.load
        (local.get $p1)))
    (i32.store
      (local.get $p1)
      (local.get $p0)))
  (func $__rg_realloc (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32) (local $l4 i32)
    (global.set $g0
      (local.tee $l3
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.tee $l4
            (call $_ZN64_$LT$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..GlobalAlloc$GT$5alloc17h10143dfc8a7c1edfE
              (local.get $p2)))))
      (drop
        (call $memcpy
          (local.get $l4)
          (local.get $p0)
          (select
            (local.get $p2)
            (local.get $p1)
            (i32.gt_u
              (local.get $p1)
              (local.get $p2)))))
      (br_if $B0
        (i32.eqz
          (local.get $p0)))
      (i32.store offset=4
        (local.get $l3)
        (local.get $p0))
      (br_if $B0
        (i32.eqz
          (local.get $p1)))
      (block $B1
        (br_if $B1
          (i32.gt_u
            (local.tee $p2
              (i32.add
                (i32.shr_u
                  (i32.add
                    (local.get $p1)
                    (i32.const 3))
                  (i32.const 2))
                (i32.const -1)))
            (i32.const 255)))
        (i32.store offset=8
          (local.get $l3)
          (i32.const 65860))
        (i32.store offset=12
          (local.get $l3)
          (i32.load
            (local.tee $p2
              (i32.add
                (i32.shl
                  (local.get $p2)
                  (i32.const 2))
                (i32.const 65864)))))
        (call $_ZN62_$LT$$RF$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..Alloc$GT$7dealloc28_$u7b$$u7b$closure$u7d$$u7d$17h5ddeb4858ad80e6fE
          (i32.add
            (local.get $l3)
            (i32.const 4))
          (i32.add
            (local.get $l3)
            (i32.const 12))
          (i32.add
            (local.get $l3)
            (i32.const 8))
          (i32.const 65656))
        (i32.store
          (local.get $p2)
          (i32.load offset=12
            (local.get $l3)))
        (br $B0))
      (i32.store offset=12
        (local.get $l3)
        (i32.load offset=65860
          (i32.const 0)))
      (call $_ZN62_$LT$$RF$wee_alloc..WeeAlloc$u20$as$u20$core..alloc..Alloc$GT$7dealloc28_$u7b$$u7b$closure$u7d$$u7d$17h5ddeb4858ad80e6fE
        (i32.add
          (local.get $l3)
          (i32.const 4))
        (i32.add
          (local.get $l3)
          (i32.const 12))
        (i32.const 65769)
        (i32.const 65680))
      (i32.store offset=65860
        (i32.const 0)
        (i32.load offset=12
          (local.get $l3))))
    (global.set $g0
      (i32.add
        (local.get $l3)
        (i32.const 16)))
    (local.get $l4))
  (func $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17h7a1cb2d825c5e2c5E (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.ne
            (local.tee $p3
              (call $llvm.wasm.grow.memory.i32
                (i32.shr_u
                  (local.tee $l4
                    (i32.add
                      (select
                        (local.tee $p2
                          (i32.shl
                            (local.get $p2)
                            (i32.const 2)))
                        (local.tee $p3
                          (i32.add
                            (i32.shl
                              (local.get $p3)
                              (i32.const 3))
                            (i32.const 16384)))
                        (i32.lt_u
                          (local.get $p3)
                          (local.get $p2)))
                      (i32.const 65543)))
                  (i32.const 16))))
            (i32.const -1)))
        (local.set $p2
          (i32.const 1))
        (local.set $p3
          (i32.const 0))
        (br $B0))
      (i64.store
        (local.tee $p3
          (i32.shl
            (local.get $p3)
            (i32.const 16)))
        (i64.const 0))
      (local.set $p2
        (i32.const 0))
      (i32.store offset=8
        (local.get $p3)
        (i32.const 0))
      (i32.store
        (local.get $p3)
        (i32.or
          (i32.add
            (local.get $p3)
            (i32.and
              (local.get $l4)
              (i32.const -65536)))
          (i32.const 2))))
    (i32.store offset=4
      (local.get $p0)
      (local.get $p3))
    (i32.store
      (local.get $p0)
      (local.get $p2)))
  (func $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17hc8984e5289c5e601E (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (i32.const 512))
  (func $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$32should_merge_adjacent_free_cells17hcfc2a06c15f6b6f2E (type $t0) (param $p0 i32) (result i32)
    (i32.const 1))
  (func $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875 (type $t9) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32) (param $p4 i32) (result i32)
    (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32)
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eqz
            (local.tee $l5
              (i32.load
                (local.get $p2)))))
        (local.set $l6
          (i32.add
            (local.get $p1)
            (i32.const -1)))
        (local.set $l7
          (i32.sub
            (i32.const 0)
            (local.get $p1)))
        (local.set $l8
          (i32.shl
            (local.get $p0)
            (i32.const 2)))
        (loop $L2
          (local.set $l9
            (i32.add
              (local.get $l5)
              (i32.const 8)))
          (block $B3
            (br_if $B3
              (i32.eqz
                (i32.and
                  (local.tee $l10
                    (i32.load offset=8
                      (local.get $l5)))
                  (i32.const 1))))
            (loop $L4
              (i32.store
                (local.get $l9)
                (i32.and
                  (local.get $l10)
                  (i32.const -2)))
              (block $B5
                (block $B6
                  (br_if $B6
                    (local.tee $l9
                      (i32.and
                        (local.tee $l10
                          (i32.load offset=4
                            (local.get $l5)))
                        (i32.const -4))))
                  (local.set $p1
                    (i32.const 0))
                  (br $B5))
                (local.set $p1
                  (select
                    (i32.const 0)
                    (local.get $l9)
                    (i32.and
                      (i32.load8_u
                        (local.get $l9))
                      (i32.const 1)))))
              (block $B7
                (br_if $B7
                  (i32.eqz
                    (local.tee $l12
                      (i32.and
                        (local.tee $l11
                          (i32.load
                            (local.get $l5)))
                        (i32.const -4)))))
                (br_if $B7
                  (i32.and
                    (local.get $l11)
                    (i32.const 2)))
                (i32.store offset=4
                  (local.get $l12)
                  (i32.or
                    (i32.and
                      (i32.load offset=4
                        (local.get $l12))
                      (i32.const 3))
                    (local.get $l9)))
                (local.set $l9
                  (i32.and
                    (local.tee $l10
                      (i32.load offset=4
                        (local.get $l5)))
                    (i32.const -4))))
              (block $B8
                (br_if $B8
                  (i32.eqz
                    (local.get $l9)))
                (i32.store
                  (local.get $l9)
                  (i32.or
                    (i32.and
                      (i32.load
                        (local.get $l9))
                      (i32.const 3))
                    (i32.and
                      (i32.load
                        (local.get $l5))
                      (i32.const -4))))
                (local.set $l10
                  (i32.load offset=4
                    (local.get $l5))))
              (i32.store offset=4
                (local.get $l5)
                (i32.and
                  (local.get $l10)
                  (i32.const 3)))
              (i32.store
                (local.get $l5)
                (i32.and
                  (local.tee $l9
                    (i32.load
                      (local.get $l5)))
                  (i32.const 3)))
              (block $B9
                (br_if $B9
                  (i32.eqz
                    (i32.and
                      (local.get $l9)
                      (i32.const 2))))
                (i32.store
                  (local.get $p1)
                  (i32.or
                    (i32.load
                      (local.get $p1))
                    (i32.const 2))))
              (i32.store
                (local.get $p2)
                (local.get $p1))
              (local.set $l9
                (i32.add
                  (local.get $p1)
                  (i32.const 8)))
              (local.set $l5
                (local.get $p1))
              (br_if $L4
                (i32.and
                  (local.tee $l10
                    (i32.load offset=8
                      (local.get $p1)))
                  (i32.const 1))))
            (local.set $l5
              (local.get $p1)))
          (block $B10
            (br_if $B10
              (i32.lt_u
                (i32.sub
                  (local.tee $p1
                    (i32.and
                      (i32.load
                        (local.get $l5))
                      (i32.const -4)))
                  (local.get $l9))
                (local.get $l8)))
            (block $B11
              (br_if $B11
                (i32.le_u
                  (i32.add
                    (i32.add
                      (local.get $l9)
                      (i32.shl
                        (call_indirect (type $t1) $T0
                          (local.get $p3)
                          (local.get $p0)
                          (i32.load offset=16
                            (local.get $p4)))
                        (i32.const 2)))
                    (i32.const 8))
                  (local.tee $p1
                    (i32.and
                      (i32.sub
                        (local.get $p1)
                        (local.get $l8))
                      (local.get $l7)))))
              (br_if $B10
                (i32.and
                  (local.get $l6)
                  (local.get $l9)))
              (i32.store
                (local.get $p2)
                (i32.and
                  (i32.load
                    (local.get $l9))
                  (i32.const -4)))
              (local.set $p1
                (local.get $l5))
              (br $B0))
            (i32.store
              (local.get $p1)
              (i32.const 0))
            (i64.store align=4
              (local.tee $p1
                (i32.add
                  (local.get $p1)
                  (i32.const -8)))
              (i64.const 0))
            (i32.store
              (local.get $p1)
              (i32.and
                (i32.load
                  (local.get $l5))
                (i32.const -4)))
            (block $B12
              (br_if $B12
                (i32.eqz
                  (local.tee $l10
                    (i32.and
                      (local.tee $l12
                        (i32.load
                          (local.get $l5)))
                      (i32.const -4)))))
              (br_if $B12
                (i32.and
                  (local.get $l12)
                  (i32.const 2)))
              (i32.store offset=4
                (local.get $l10)
                (i32.or
                  (i32.and
                    (i32.load offset=4
                      (local.get $l10))
                    (i32.const 3))
                  (local.get $p1))))
            (i32.store offset=4
              (local.get $p1)
              (i32.or
                (i32.and
                  (i32.load offset=4
                    (local.get $p1))
                  (i32.const 3))
                (local.get $l5)))
            (i32.store
              (local.get $l5)
              (i32.or
                (i32.and
                  (i32.load
                    (local.get $l5))
                  (i32.const 3))
                (local.get $p1)))
            (i32.store
              (local.get $l9)
              (i32.and
                (i32.load
                  (local.get $l9))
                (i32.const -2)))
            (br_if $B0
              (i32.eqz
                (i32.and
                  (local.tee $l9
                    (i32.load
                      (local.get $l5)))
                  (i32.const 2))))
            (i32.store
              (local.get $l5)
              (i32.and
                (local.get $l9)
                (i32.const -3)))
            (i32.store
              (local.get $p1)
              (i32.or
                (i32.load
                  (local.get $p1))
                (i32.const 2)))
            (br $B0))
          (i32.store
            (local.get $p2)
            (local.tee $l5
              (i32.load offset=8
                (local.get $l5))))
          (br_if $L2
            (local.get $l5))))
      (return
        (i32.const 0)))
    (i32.store
      (local.get $p1)
      (i32.or
        (i32.load
          (local.get $p1))
        (i32.const 1)))
    (i32.add
      (local.get $p1)
      (i32.const 8)))
  (func $_ZN4core3ptr18real_drop_in_place17hddd7d506dded488bE (type $t7) (param $p0 i32))
  (func $_ZN4core3ptr18real_drop_in_place17h0e7d6e529579a697E (type $t7) (param $p0 i32))
  (func $_ZN88_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17he830981602c8367cE (type $t4) (param $p0 i32) (param $p1 i32) (param $p2 i32) (param $p3 i32)
    (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32)
    (global.set $g0
      (local.tee $l4
        (i32.sub
          (global.get $g0)
          (i32.const 16))))
    (i32.store offset=12
      (local.get $l4)
      (i32.load
        (local.tee $l5
          (i32.load
            (local.get $p1)))))
    (block $B0
      (block $B1
        (block $B2
          (br_if $B2
            (i32.eqz
              (local.tee $p2
                (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
                  (local.tee $p1
                    (select
                      (local.tee $p2
                        (i32.mul
                          (local.tee $p2
                            (i32.add
                              (local.get $p2)
                              (i32.const 2)))
                          (local.get $p2)))
                      (i32.const 2048)
                      (i32.gt_u
                        (local.get $p2)
                        (i32.const 2048))))
                  (i32.const 4)
                  (i32.add
                    (local.get $l4)
                    (i32.const 12))
                  (i32.const 1)
                  (i32.const 65704)))))
          (i32.store
            (local.get $l5)
            (i32.load offset=12
              (local.get $l4)))
          (local.set $l6
            (i32.shl
              (local.get $p1)
              (i32.const 2)))
          (br $B1))
        (block $B3
          (block $B4
            (br_if $B4
              (i32.ne
                (local.tee $p2
                  (call $llvm.wasm.grow.memory.i32
                    (i32.shr_u
                      (local.tee $l7
                        (i32.add
                          (select
                            (local.tee $l6
                              (i32.shl
                                (local.get $p1)
                                (i32.const 2)))
                            (i32.const 16416)
                            (i32.gt_u
                              (local.get $l6)
                              (i32.const 16416)))
                          (i32.const 65543)))
                      (i32.const 16))))
                (i32.const -1)))
            (i32.store
              (local.get $l5)
              (i32.load offset=12
                (local.get $l4)))
            (local.set $l7
              (i32.const 1))
            (br $B3))
          (i32.store
            (local.tee $p2
              (i32.shl
                (local.get $p2)
                (i32.const 16)))
            (i32.or
              (i32.add
                (local.get $p2)
                (i32.and
                  (local.get $l7)
                  (i32.const -65536)))
              (i32.const 2)))
          (i32.store offset=4
            (local.get $p2)
            (i32.const 0))
          (i32.store offset=8
            (local.get $p2)
            (i32.load offset=12
              (local.get $l4)))
          (i32.store offset=12
            (local.get $l4)
            (local.get $p2))
          (local.set $l7
            (i32.const 1))
          (local.set $p2
            (call $_ZN9wee_alloc15alloc_first_fit17hdac23067e4fc0d95E.llvm.4550436637031095875
              (local.get $p1)
              (i32.const 4)
              (i32.add
                (local.get $l4)
                (i32.const 12))
              (i32.const 1)
              (i32.const 65704)))
          (i32.store
            (local.get $l5)
            (i32.load offset=12
              (local.get $l4)))
          (br_if $B1
            (local.get $p2)))
        (br $B0))
      (i64.store offset=4 align=4
        (local.get $p2)
        (i64.const 0))
      (i32.store
        (local.get $p2)
        (i32.or
          (i32.add
            (local.get $p2)
            (local.get $l6))
          (i32.const 2)))
      (local.set $l7
        (i32.const 0)))
    (i32.store offset=4
      (local.get $p0)
      (local.get $p2))
    (i32.store
      (local.get $p0)
      (local.get $l7))
    (global.set $g0
      (i32.add
        (local.get $l4)
        (i32.const 16))))
  (func $_ZN88_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17h5d304c5bbf084297E (type $t1) (param $p0 i32) (param $p1 i32) (result i32)
    (local.get $p1))
  (func $_ZN88_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$32should_merge_adjacent_free_cells17hc3049364ec5ce1feE (type $t0) (param $p0 i32) (result i32)
    (i32.const 0))
  (func $_ZN5alloc7raw_vec17capacity_overflow17h1985a4e869ed33afE (type $t6)
    (call $_ZN4core9panicking5panic17hf39d891790cd9f1dE
      (i32.const 65728))
    (unreachable))
  (func $_ZN4core9panicking9panic_fmt17hbf47faeb15c12ec4E (type $t6)
    (unreachable)
    (unreachable))
  (func $__rust_realloc (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (call $__rg_realloc
      (local.get $p0)
      (local.get $p1)
      (local.get $p2)))
  (func $memcpy (type $t8) (param $p0 i32) (param $p1 i32) (param $p2 i32) (result i32)
    (local $l3 i32)
    (block $B0
      (br_if $B0
        (i32.eqz
          (local.get $p2)))
      (local.set $l3
        (local.get $p0))
      (loop $L1
        (i32.store8
          (local.get $l3)
          (i32.load8_u
            (local.get $p1)))
        (local.set $l3
          (i32.add
            (local.get $l3)
            (i32.const 1)))
        (local.set $p1
          (i32.add
            (local.get $p1)
            (i32.const 1)))
        (br_if $L1
          (local.tee $p2
            (i32.add
              (local.get $p2)
              (i32.const -1))))))
    (local.get $p0))
  (table $T0 9 9 funcref)
  (memory $memory (export "memory") 2)
  (global $g0 (mut i32) (i32.const 65536))
  (global $__data_end (export "__data_end") i32 (i32.const 66888))
  (global $__heap_base (export "__heap_base") i32 (i32.const 66888))
  (elem $e0 (i32.const 1) $_ZN4core3ptr18real_drop_in_place17h0e7d6e529579a697E $_ZN88_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17he830981602c8367cE $_ZN88_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17h5d304c5bbf084297E $_ZN88_$LT$wee_alloc..size_classes..SizeClassAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$32should_merge_adjacent_free_cells17hc3049364ec5ce1feE $_ZN4core3ptr18real_drop_in_place17hddd7d506dded488bE $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$22new_cell_for_free_list17h7a1cb2d825c5e2c5E $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$13min_cell_size17hc8984e5289c5e601E $_ZN70_$LT$wee_alloc..LargeAllocPolicy$u20$as$u20$wee_alloc..AllocPolicy$GT$32should_merge_adjacent_free_cells17hcfc2a06c15f6b6f2E)
  (data $d0 (i32.const 65536) "called `Option::unwrap()` on a `None` valuesrc/libcore/option.rs\00\00\01\00+\00\00\00+\00\01\00\15\00\00\00z\01\00\00\15\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\00\00\00\00\01\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\05\00\00\00\00\00\00\00\01\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\d8\00\01\00\11\00\00\00,\01\01\00\17\00\00\00\f2\02\00\00\05\00\00\00capacity overflow\00\00\00\04\01\01\00(\00\00\00,\01\01\00\17\00\00\00\f1\01\00\00'\00\00\00internal error: entered unreachable codesrc/liballoc/raw_vec.rs")
  (data $d1 (i32.const 65860) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"))

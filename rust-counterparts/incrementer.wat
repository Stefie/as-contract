(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (result i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32 i32 i32 i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func))
  (type (;8;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32) (result i32)))
  (import "env" "memory" (memory (;0;) 2 16))
  (import "env" "ext_scratch_size" (func (;0;) (type 2)))
  (import "env" "ext_scratch_read" (func (;1;) (type 3)))
  (import "env" "ext_println" (func (;2;) (type 4)))
  (import "env" "ext_set_rent_allowance" (func (;3;) (type 4)))
  (import "env" "ext_set_storage" (func (;4;) (type 5)))
  (import "env" "ext_scratch_write" (func (;5;) (type 4)))
  (import "env" "ext_get_storage" (func (;6;) (type 1)))
  (func (;7;) (type 4) (param i32 i32)
    unreachable
    unreachable)
  (func (;8;) (type 2) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          call 0
                          local.tee 1
                          br_if 0 (;@11;)
                          i32.const 1
                          local.set 2
                          i32.const 0
                          local.set 3
                          i32.const 0
                          local.set 1
                          br 1 (;@10;)
                        end
                        local.get 1
                        i32.const 0
                        i32.lt_s
                        br_if 2 (;@8;)
                        local.get 1
                        call 9
                        local.tee 2
                        i32.eqz
                        br_if 1 (;@9;)
                        i32.const 0
                        local.set 4
                        local.get 2
                        local.set 3
                        block  ;; label = @11
                          local.get 1
                          i32.const 1
                          i32.le_u
                          br_if 0 (;@11;)
                          local.get 1
                          i32.const -1
                          i32.add
                          local.set 3
                          i32.const 0
                          local.set 4
                          loop  ;; label = @12
                            local.get 2
                            local.get 4
                            i32.add
                            i32.const 0
                            i32.store8
                            local.get 3
                            local.get 4
                            i32.const 1
                            i32.add
                            local.tee 4
                            i32.ne
                            br_if 0 (;@12;)
                          end
                          local.get 2
                          local.get 4
                          i32.add
                          local.set 3
                        end
                        local.get 3
                        i32.const 0
                        i32.store8
                        local.get 2
                        i32.const 0
                        local.get 1
                        call 1
                        local.get 4
                        i32.const 1
                        i32.add
                        local.set 3
                      end
                      local.get 0
                      i32.const 0
                      i32.store8
                      local.get 0
                      local.get 2
                      local.get 3
                      i32.const 0
                      i32.ne
                      local.tee 5
                      call 31
                      local.set 4
                      local.get 3
                      local.get 5
                      i32.lt_u
                      br_if 2 (;@7;)
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 3
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 4
                              i32.load8_u
                              local.tee 0
                              i32.const 2
                              i32.gt_u
                              br_if 0 (;@13;)
                              block  ;; label = @14
                                local.get 0
                                br_table 0 (;@14;) 4 (;@10;) 2 (;@12;) 0 (;@14;)
                              end
                              local.get 4
                              i32.const 0
                              i32.store
                              local.get 4
                              local.get 2
                              local.get 5
                              i32.add
                              local.get 3
                              local.get 5
                              i32.sub
                              local.tee 0
                              i32.const 4
                              local.get 0
                              i32.const 4
                              i32.lt_u
                              select
                              call 31
                              local.set 3
                              local.get 0
                              i32.const 3
                              i32.gt_u
                              br_if 2 (;@11;)
                            end
                            i32.const 66748
                            call 10
                            unreachable
                          end
                          i32.const 66596
                          i32.const 10
                          call 2
                          i32.const 16
                          call 9
                          local.tee 3
                          i32.eqz
                          br_if 5 (;@6;)
                          local.get 3
                          i64.const 0
                          i64.store offset=8 align=1
                          local.get 3
                          i64.const 0
                          i64.store align=1
                          local.get 3
                          i32.const 16
                          call 3
                          local.get 3
                          i32.const 16
                          call 11
                          br 9 (;@2;)
                        end
                        local.get 3
                        i32.load
                        local.set 6
                        i32.const 66609
                        i32.const 3
                        call 2
                        local.get 3
                        call 12
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 3
                            i32.load
                            local.tee 7
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 8
                            i32.add
                            i32.load
                            local.set 0
                            local.get 3
                            i32.load offset=4
                            local.set 8
                            local.get 3
                            i32.const 0
                            i32.store offset=12
                            local.get 3
                            i32.const 12
                            i32.add
                            local.get 7
                            local.get 0
                            i32.const 4
                            local.get 0
                            i32.const 4
                            i32.lt_u
                            select
                            call 31
                            drop
                            local.get 3
                            i32.load offset=12
                            local.set 5
                            block  ;; label = @13
                              local.get 8
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 7
                              local.get 8
                              call 11
                            end
                            local.get 0
                            i32.const 3
                            i32.gt_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.set 5
                        end
                        i32.const 4
                        call 9
                        local.tee 3
                        i32.eqz
                        br_if 5 (;@5;)
                        local.get 3
                        local.get 5
                        local.get 6
                        i32.add
                        i32.store align=1
                        i32.const 66564
                        i32.const 1
                        local.get 3
                        i32.const 4
                        call 4
                        local.get 3
                        i32.const 4
                        call 11
                        br 8 (;@2;)
                      end
                      i32.const 66606
                      i32.const 3
                      call 2
                      local.get 4
                      call 12
                      local.get 4
                      i32.const 8
                      i32.add
                      i32.load
                      i32.const 0
                      local.get 4
                      i32.load
                      local.tee 0
                      select
                      local.tee 3
                      i32.const -1
                      i32.le_s
                      br_if 5 (;@4;)
                      local.get 4
                      i32.load offset=4
                      local.set 7
                      i32.const 1
                      local.set 5
                      block  ;; label = @10
                        local.get 3
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 3
                        call 9
                        local.tee 5
                        i32.eqz
                        br_if 7 (;@3;)
                      end
                      local.get 5
                      local.get 0
                      i32.const 1
                      local.get 0
                      select
                      local.tee 6
                      local.get 3
                      call 31
                      local.set 5
                      block  ;; label = @10
                        local.get 7
                        i32.const 0
                        local.get 0
                        select
                        local.tee 0
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 6
                        local.get 0
                        call 11
                      end
                      local.get 5
                      local.get 3
                      call 5
                      local.get 3
                      i32.eqz
                      br_if 8 (;@1;)
                      local.get 5
                      local.get 3
                      call 11
                      br 8 (;@1;)
                    end
                    local.get 1
                    i32.const 1
                    call 7
                    unreachable
                  end
                  call 13
                  unreachable
                end
                local.get 5
                local.get 3
                call 14
                unreachable
              end
              i32.const 16
              i32.const 1
              call 7
              unreachable
            end
            i32.const 4
            i32.const 1
            call 7
            unreachable
          end
          call 15
          unreachable
        end
        local.get 3
        i32.const 1
        call 7
        unreachable
      end
      i32.const 1
      i32.const 0
      call 5
    end
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      call 11
    end
    local.get 4
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func (;9;) (type 1) (param i32) (result i32)
    local.get 0
    call 29)
  (func (;10;) (type 6) (param i32)
    call 28
    unreachable)
  (func (;11;) (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call 30)
  (func (;12;) (type 6) (param i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      i32.const 66564
      call 6
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 0
            local.tee 1
            br_if 0 (;@4;)
            i32.const 1
            local.set 2
            i32.const 0
            local.set 3
            i32.const 0
            local.set 1
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.lt_s
          br_if 2 (;@1;)
          local.get 1
          call 9
          local.tee 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          local.set 4
          i32.const 0
          local.set 3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.le_u
            br_if 0 (;@4;)
            local.get 1
            i32.const -1
            i32.add
            local.set 4
            i32.const 0
            local.set 3
            loop  ;; label = @5
              local.get 2
              local.get 3
              i32.add
              i32.const 0
              i32.store8
              local.get 4
              local.get 3
              i32.const 1
              i32.add
              local.tee 3
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 2
            local.get 3
            i32.add
            local.set 4
          end
          local.get 4
          i32.const 0
          i32.store8
          local.get 2
          i32.const 0
          local.get 1
          call 1
          local.get 3
          i32.const 1
          i32.add
          local.set 3
        end
        local.get 0
        local.get 1
        i32.store offset=4
        local.get 0
        local.get 2
        i32.store
        local.get 0
        i32.const 8
        i32.add
        local.get 3
        i32.store
        return
      end
      local.get 1
      i32.const 1
      call 7
      unreachable
    end
    call 13
    unreachable)
  (func (;13;) (type 7)
    i32.const 66684
    call 10
    unreachable)
  (func (;14;) (type 4) (param i32 i32)
    call 28
    unreachable)
  (func (;15;) (type 7)
    call 13
    unreachable)
  (func (;16;) (type 2) (result i32)
    i32.const 0)
  (func (;17;) (type 5) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    local.get 1
    i32.load
    local.tee 5
    i32.load
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 2
          i32.add
          local.tee 2
          local.get 2
          i32.mul
          local.tee 2
          i32.const 2048
          local.get 2
          i32.const 2048
          i32.gt_u
          select
          local.tee 1
          i32.const 4
          local.get 4
          i32.const 12
          i32.add
          i32.const 66836
          i32.const 66612
          call 18
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          i32.load offset=12
          i32.store
          local.get 1
          i32.const 2
          i32.shl
          local.set 6
          br 1 (;@2;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 2
            i32.shl
            local.tee 6
            i32.const 16416
            local.get 6
            i32.const 16416
            i32.gt_u
            select
            i32.const 65543
            i32.add
            local.tee 7
            i32.const 16
            i32.shr_u
            memory.grow
            local.tee 2
            i32.const -1
            i32.ne
            br_if 0 (;@4;)
            local.get 5
            local.get 4
            i32.load offset=12
            i32.store
            br 1 (;@3;)
          end
          local.get 2
          i32.const 16
          i32.shl
          local.tee 2
          local.get 2
          local.get 7
          i32.const -65536
          i32.and
          i32.add
          i32.const 2
          i32.or
          i32.store
          local.get 2
          i32.const 0
          i32.store offset=4
          local.get 2
          local.get 4
          i32.load offset=12
          i32.store offset=8
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 1
          i32.const 4
          local.get 4
          i32.const 12
          i32.add
          i32.const 66836
          i32.const 66612
          call 18
          local.set 2
          local.get 5
          local.get 4
          i32.load offset=12
          i32.store
          local.get 2
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      i64.const 0
      i64.store offset=4 align=4
      local.get 2
      local.get 2
      local.get 6
      i32.add
      i32.const 2
      i32.or
      i32.store
      i32.const 0
      local.set 1
    end
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;18;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load
        local.tee 5
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const -1
        i32.add
        local.set 6
        local.get 0
        i32.const 2
        i32.shl
        local.set 7
        i32.const 0
        local.get 1
        i32.sub
        local.set 8
        loop  ;; label = @3
          local.get 5
          i32.const 8
          i32.add
          local.set 9
          block  ;; label = @4
            local.get 5
            i32.load offset=8
            local.tee 10
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 9
              local.get 10
              i32.const -2
              i32.and
              i32.store
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.load offset=4
                  local.tee 10
                  i32.const -4
                  i32.and
                  local.tee 9
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 1
                  br 1 (;@6;)
                end
                i32.const 0
                local.get 9
                local.get 9
                i32.load8_u
                i32.const 1
                i32.and
                select
                local.set 1
              end
              block  ;; label = @6
                local.get 5
                i32.load
                local.tee 11
                i32.const -4
                i32.and
                local.tee 12
                i32.eqz
                br_if 0 (;@6;)
                local.get 11
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                local.get 12
                local.get 12
                i32.load offset=4
                i32.const 3
                i32.and
                local.get 9
                i32.or
                i32.store offset=4
                local.get 5
                i32.load offset=4
                local.tee 10
                i32.const -4
                i32.and
                local.set 9
              end
              block  ;; label = @6
                local.get 9
                i32.eqz
                br_if 0 (;@6;)
                local.get 9
                local.get 9
                i32.load
                i32.const 3
                i32.and
                local.get 5
                i32.load
                i32.const -4
                i32.and
                i32.or
                i32.store
                local.get 5
                i32.load offset=4
                local.set 10
              end
              local.get 5
              local.get 10
              i32.const 3
              i32.and
              i32.store offset=4
              local.get 5
              local.get 5
              i32.load
              local.tee 9
              i32.const 3
              i32.and
              i32.store
              block  ;; label = @6
                local.get 9
                i32.const 2
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                local.get 1
                i32.load
                i32.const 2
                i32.or
                i32.store
              end
              local.get 2
              local.get 1
              i32.store
              local.get 1
              i32.const 8
              i32.add
              local.set 9
              local.get 1
              local.set 5
              local.get 1
              i32.load offset=8
              local.tee 10
              i32.const 1
              i32.and
              br_if 0 (;@5;)
            end
            local.get 1
            local.set 5
          end
          block  ;; label = @4
            local.get 5
            i32.load
            i32.const -4
            i32.and
            local.tee 1
            local.get 9
            i32.sub
            local.get 7
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 9
              local.get 3
              local.get 0
              local.get 4
              i32.load offset=16
              call_indirect (type 0)
              i32.const 2
              i32.shl
              i32.add
              i32.const 8
              i32.add
              local.get 1
              local.get 7
              i32.sub
              local.get 8
              i32.and
              local.tee 1
              i32.le_u
              br_if 0 (;@5;)
              local.get 6
              local.get 9
              i32.and
              br_if 1 (;@4;)
              local.get 2
              local.get 9
              i32.load
              i32.const -4
              i32.and
              i32.store
              local.get 5
              local.set 1
              br 4 (;@1;)
            end
            local.get 1
            i32.const 0
            i32.store
            local.get 1
            i32.const -8
            i32.add
            local.tee 1
            i64.const 0
            i64.store align=4
            local.get 1
            local.get 5
            i32.load
            i32.const -4
            i32.and
            i32.store
            block  ;; label = @5
              local.get 5
              i32.load
              local.tee 12
              i32.const -4
              i32.and
              local.tee 10
              i32.eqz
              br_if 0 (;@5;)
              local.get 12
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              local.get 10
              local.get 10
              i32.load offset=4
              i32.const 3
              i32.and
              local.get 1
              i32.or
              i32.store offset=4
            end
            local.get 1
            local.get 1
            i32.load offset=4
            i32.const 3
            i32.and
            local.get 5
            i32.or
            i32.store offset=4
            local.get 5
            local.get 5
            i32.load
            i32.const 3
            i32.and
            local.get 1
            i32.or
            i32.store
            local.get 9
            local.get 9
            i32.load
            i32.const -2
            i32.and
            i32.store
            local.get 5
            i32.load
            local.tee 9
            i32.const 2
            i32.and
            i32.eqz
            br_if 3 (;@1;)
            local.get 5
            local.get 9
            i32.const -3
            i32.and
            i32.store
            local.get 1
            local.get 1
            i32.load
            i32.const 2
            i32.or
            i32.store
            br 3 (;@1;)
          end
          local.get 2
          local.get 5
          i32.load offset=8
          local.tee 5
          i32.store
          local.get 5
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      return
    end
    local.get 1
    local.get 1
    i32.load
    i32.const 1
    i32.or
    i32.store
    local.get 1
    i32.const 8
    i32.add)
  (func (;19;) (type 0) (param i32 i32) (result i32)
    local.get 1)
  (func (;20;) (type 1) (param i32) (result i32)
    i32.const 0)
  (func (;21;) (type 6) (param i32))
  (func (;22;) (type 5) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 2
        i32.shl
        local.tee 2
        local.get 3
        i32.const 3
        i32.shl
        i32.const 16384
        i32.add
        local.tee 3
        local.get 3
        local.get 2
        i32.lt_u
        select
        i32.const 65543
        i32.add
        local.tee 4
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 3
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 3
      i32.const 16
      i32.shl
      local.tee 3
      i64.const 0
      i64.store
      i32.const 0
      local.set 2
      local.get 3
      i32.const 0
      i32.store offset=8
      local.get 3
      local.get 3
      local.get 4
      i32.const -65536
      i32.and
      i32.add
      i32.const 2
      i32.or
      i32.store
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;23;) (type 0) (param i32 i32) (result i32)
    i32.const 512)
  (func (;24;) (type 1) (param i32) (result i32)
    i32.const 1)
  (func (;25;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 1
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 3
        i32.add
        local.tee 2
        i32.const 2
        i32.shr_u
        local.tee 3
        i32.const -1
        i32.add
        local.tee 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 65536
        i32.store offset=4
        local.get 1
        local.get 0
        i32.const 2
        i32.shl
        i32.const 65540
        i32.add
        local.tee 2
        i32.load
        i32.store offset=8
        block  ;; label = @3
          local.get 3
          i32.const 1
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          i32.const 4
          i32.add
          i32.const 66636
          call 18
          local.tee 0
          br_if 0 (;@3;)
          local.get 1
          local.get 1
          i32.load offset=4
          local.tee 4
          i32.load
          i32.store offset=12
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.const 2
              i32.add
              local.tee 0
              local.get 0
              i32.mul
              local.tee 0
              i32.const 2048
              local.get 0
              i32.const 2048
              i32.gt_u
              select
              local.tee 5
              i32.const 4
              local.get 1
              i32.const 12
              i32.add
              i32.const 66836
              i32.const 66612
              call 18
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 4
              local.get 1
              i32.load offset=12
              i32.store
              local.get 5
              i32.const 2
              i32.shl
              local.set 7
              br 1 (;@4;)
            end
            block  ;; label = @5
              local.get 5
              i32.const 2
              i32.shl
              local.tee 7
              i32.const 16416
              local.get 7
              i32.const 16416
              i32.gt_u
              select
              i32.const 65543
              i32.add
              local.tee 0
              i32.const 16
              i32.shr_u
              memory.grow
              local.tee 6
              i32.const -1
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 1
              i32.load offset=12
              i32.store
              i32.const 0
              local.set 0
              br 2 (;@3;)
            end
            local.get 6
            i32.const 16
            i32.shl
            local.tee 6
            local.get 6
            local.get 0
            i32.const -65536
            i32.and
            i32.add
            i32.const 2
            i32.or
            i32.store
            i32.const 0
            local.set 0
            local.get 6
            i32.const 0
            i32.store offset=4
            local.get 6
            local.get 1
            i32.load offset=12
            i32.store offset=8
            local.get 1
            local.get 6
            i32.store offset=12
            local.get 5
            i32.const 4
            local.get 1
            i32.const 12
            i32.add
            i32.const 66836
            i32.const 66612
            call 18
            local.set 6
            local.get 4
            local.get 1
            i32.load offset=12
            i32.store
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          i32.const 0
          i32.store offset=4
          local.get 6
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 6
          local.get 6
          local.get 7
          i32.add
          i32.const 2
          i32.or
          i32.store
          local.get 1
          local.get 6
          i32.store offset=8
          local.get 3
          i32.const 1
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          i32.const 4
          i32.add
          i32.const 66636
          call 18
          local.set 0
        end
        local.get 2
        local.get 1
        i32.load offset=8
        i32.store
        br 1 (;@1;)
      end
      local.get 1
      i32.const 0
      i32.load offset=65536
      i32.store offset=12
      block  ;; label = @2
        local.get 3
        i32.const 1
        local.get 1
        i32.const 12
        i32.add
        i32.const 66836
        i32.const 66660
        call 18
        local.tee 0
        br_if 0 (;@2;)
        i32.const 0
        local.set 0
        local.get 2
        i32.const -4
        i32.and
        local.tee 2
        i32.const 16392
        local.get 2
        i32.const 16392
        i32.gt_u
        select
        i32.const 65543
        i32.add
        local.tee 2
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 6
        i32.const -1
        i32.eq
        br_if 0 (;@2;)
        local.get 6
        i32.const 16
        i32.shl
        local.tee 0
        local.get 0
        local.get 2
        i32.const -65536
        i32.and
        i32.add
        i32.const 2
        i32.or
        i32.store
        local.get 0
        i32.const 0
        i32.store offset=4
        local.get 0
        local.get 1
        i32.load offset=12
        i32.store offset=8
        local.get 1
        local.get 0
        i32.store offset=12
        local.get 3
        i32.const 1
        local.get 1
        i32.const 12
        i32.add
        i32.const 66836
        i32.const 66660
        call 18
        local.set 0
      end
      i32.const 0
      local.get 1
      i32.load offset=12
      i32.store offset=65536
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;26;) (type 6) (param i32))
  (func (;27;) (type 5) (param i32 i32 i32 i32)
    (local i32 i32)
    local.get 0
    i32.load
    local.tee 4
    i32.const 0
    i32.store
    local.get 4
    i32.const -8
    i32.add
    local.tee 0
    local.get 0
    i32.load
    i32.const -2
    i32.and
    i32.store
    block  ;; label = @1
      local.get 2
      local.get 3
      i32.load offset=20
      call_indirect (type 1)
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.const -4
          i32.add
          local.tee 3
          i32.load
          i32.const -4
          i32.and
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load
          local.tee 5
          i32.const 1
          i32.and
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 0
        i32.load
        local.tee 2
        i32.const -4
        i32.and
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const 2
        i32.and
        br_if 1 (;@1;)
        local.get 3
        i32.load8_u
        i32.const 1
        i32.and
        br_if 1 (;@1;)
        local.get 4
        local.get 3
        i32.load offset=8
        i32.const -4
        i32.and
        i32.store
        local.get 3
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=8
        return
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            local.tee 1
            i32.const -4
            i32.and
            local.tee 4
            br_if 0 (;@4;)
            local.get 2
            local.set 1
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 1
            i32.const 2
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.set 1
            br 1 (;@3;)
          end
          local.get 4
          local.get 4
          i32.load offset=4
          i32.const 3
          i32.and
          local.get 2
          i32.or
          i32.store offset=4
          local.get 3
          i32.load
          local.tee 4
          i32.const -4
          i32.and
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load
          i32.const -4
          i32.and
          local.set 4
          local.get 1
          i32.load
          local.set 5
        end
        local.get 1
        local.get 5
        i32.const 3
        i32.and
        local.get 4
        i32.or
        i32.store
        local.get 3
        i32.load
        local.set 4
      end
      local.get 3
      local.get 4
      i32.const 3
      i32.and
      i32.store
      local.get 0
      local.get 0
      i32.load
      local.tee 4
      i32.const 3
      i32.and
      i32.store
      block  ;; label = @2
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 2
        i32.load
        i32.const 2
        i32.or
        i32.store
      end
      return
    end
    local.get 4
    local.get 1
    i32.load
    i32.store
    local.get 1
    local.get 0
    i32.store)
  (func (;28;) (type 7)
    unreachable
    unreachable)
  (func (;29;) (type 1) (param i32) (result i32)
    local.get 0
    call 25)
  (func (;30;) (type 4) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i32.store offset=4
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 3
        i32.add
        i32.const 2
        i32.shr_u
        i32.const -1
        i32.add
        local.tee 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 65536
        i32.store offset=8
        local.get 2
        local.get 0
        i32.const 2
        i32.shl
        i32.const 65540
        i32.add
        local.tee 0
        i32.load
        i32.store offset=12
        local.get 2
        i32.const 4
        i32.add
        local.get 2
        i32.const 12
        i32.add
        local.get 2
        i32.const 8
        i32.add
        i32.const 66636
        call 27
        local.get 0
        local.get 2
        i32.load offset=12
        i32.store
        br 1 (;@1;)
      end
      local.get 2
      i32.const 0
      i32.load offset=65536
      i32.store offset=12
      local.get 2
      i32.const 4
      i32.add
      local.get 2
      i32.const 12
      i32.add
      i32.const 66836
      i32.const 66660
      call 27
      i32.const 0
      local.get 2
      i32.load offset=12
      i32.store offset=65536
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;31;) (type 9) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (table (;0;) 9 9 funcref)
  (global (;0;) (mut i32) (i32.const 65536))
  (export "call" (func 8))
  (export "deploy" (func 16))
  (elem (;0;) (i32.const 1) 21 22 23 24 26 17 19 20)
  (data (;0;) (i32.const 65536) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 66564) "\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01self-evictgetinc\01\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\04\00\00\00\04\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\00\00\94\04\01\00\11\00\00\00\a5\04\01\00\17\00\00\00\ec\02\00\00\05\00\00\00capacity overflowsrc/liballoc/raw_vec.rs\d4\04\01\00+\00\00\00\ff\04\01\00\15\00\00\00z\01\00\00\15\00\00\00called `Option::unwrap()` on a `None` valuesrc/libcore/option.rs"))

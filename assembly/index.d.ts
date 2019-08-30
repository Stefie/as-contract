declare module ASModule {
  type i8 = number;
  type i16 = number;
  type i32 = number;
  type u8 = number;
  type u16 = number;
  type u32 = number;
  type f32 = number;
  type f64 = number;
  type bool = any;
  export function __alloc(size: u32, id: u32): u32;
  export function __retain(ref: u32): u32;
  export function __release(ref: u32): void;
  export function __collect(): void;
  export var __rtti_base: u32;
  export function ext_get_storage(key_ptr: i32): i32;
  export function ext_input_size(): i32;
  export function ext_input_copy(dest_ptr: i32, offset: i32, len: i32): void;
  export function call(): void;
  export function deploy(): void;
}
export default ASModule;

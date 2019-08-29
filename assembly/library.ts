// Type  Key(pub [u8; 32]);

// declaration of imported declare functions from substrate

declare function ext_set_storage(key_ptr: i32, value_non_null: i32, value_ptr: i32, value_len: i32): void;
declare function ext_get_storage(key_ptr: i32): i32;
declare function ext_input_size(): i32;
/// dest_ptr - 
/// offset - typically 0, specifies the offset where we will start copying,
/// len - typically `ext_input_size`.
declare function ext_input_copy(dest_ptr: i32, offset: i32, len: i32): void;
declare function ext_scratch_size(): i32;
declare function ext_scratch_copy(dest_ptr: i32, offset: i32, len: i32): void;
declare function ext_return(data_ptr: i32, data_len: i32): void;


// export default class Key extends Uint8Array {
//   public constructor () {
//     super(32);
//   }
// }

export function setStorage(key: Uint8Array, value: Uint8Array): void {
  const pointer = value ? value.byteOffset : 0;
  const length = value ? value.length : 0;
  const valueNonNull = value ? 1 : 0;
  
  ext_set_storage(key.byteOffset, valueNonNull, pointer, length);
}


export function getStorage(key: Uint8Array): Uint8Array | null {
  const ERR_OK: u32 = 0;
  // ideal: pass pointer to where to put the value
  // need allocate buffer memory with correct size

  // request storage at key, will be written in the one and only scratch buffer
  let result: i32 = ext_get_storage(key.byteOffset);
  // if value is found
  if (result === ERR_OK) {
    // getting size of scratch buffer to allocate the buffer of corresponding size to fit the contents of the scratch buffer
    const size: u32= ext_scratch_size();
    // create empty array (Vec in Rust)
    let value = new Uint8Array(size);
    // if value is not null or not an empty array
    if (size > 0) {
      // call
      ext_scratch_copy(value.byteOffset, 0, size);
    }
    return value;
  } else {
    return null;
  }
}

export function getInput(): Uint8Array {
  let value = new Uint8Array(0);
  const size = ext_input_size();

  if (size > 0) {
      value = new Uint8Array(size);
      ext_input_copy(value.byteOffset, 0, size);
  }
  return value;
}

export function returnPointer(data: Uint8Array): void {
  ext_return(data.byteOffset, data.length);
}
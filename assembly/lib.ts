import { 
  ext_get_storage,
  ext_scratch_read,
  ext_scratch_size,
  ext_scratch_write,
  ext_set_rent_allowance, 
  ext_set_storage
} from './env';

import { console_log } from '.';

export function consoleLog(data: i32): void {
  console_log(data);
}

export function say(hello: string): string {
  return hello + " world"
}

export function setStorage(key: Uint8Array, value: Uint8Array): void {
  const pointer = value ? value.byteOffset : 0;
  const length = value ? value.length : 0;
  const valueNonNull = value ? 1 : 0;
  
  ext_set_storage(key.byteOffset, valueNonNull, pointer, length);
}

export function getStorage(key: Uint8Array): Uint8Array | null {
  const ERR_OK: i32 = 0;
  // ideal: pass pointer to where to put the value
  // need allocate buffer memory with correct size

  // request storage at key, will be written in the one and only scratch buffer
  let result: i32 = ext_get_storage(key.byteOffset);

  // if value is found
  if (result === ERR_OK) {
    // // getting size of scratch buffer to allocate the buffer of corresponding size to fit the contents of the scratch buffer
    const size: u32 = ext_scratch_size();
    // // create empty array (Vec in Rust)
    let value = new Uint8Array(size);
    // if value is not null or not an empty array
    if (size >  0) {
      // call
      ext_scratch_read(value.byteOffset, 0, size);
    }
    return value;
  } 
  return null;
}

export function getScratchBuffer(): Uint8Array {
  let value = new Uint8Array(0);
  const size = ext_scratch_size();

  if (size > 0) {
      value = new Uint8Array(size);
      ext_scratch_read(value.byteOffset, 0, size);
  }
  return value;
}

export function setScratchBuffer(data: Uint8Array): void {
  ext_scratch_write(data.byteOffset, data.length);
}

// value should be i128, not defined in AS, should use BN
export function setRentAllowance(value: i64): void { 
  const valueBuffer = new Uint8Array(value);
  ext_set_rent_allowance(valueBuffer.byteOffset, valueBuffer.length);
}
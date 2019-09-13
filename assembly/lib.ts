import { u128 } from "bignum";
import {
  ext_get_storage,
  ext_scratch_read,
  ext_scratch_size,
  ext_scratch_write,
  ext_set_rent_allowance, 
  ext_set_storage
} from './env';


export function setStorage(key: Uint8Array, value: Uint8Array): void {
  const pointer = value ? value.byteOffset : 0;
  const length = value ? value.length : 0;
  const valueNonNull = value ? 1 : 0;
  
  ext_set_storage(key.byteOffset, valueNonNull, pointer, length);
}

// check for length 32 bytes 
export function getStorage(key: Uint8Array): Uint8Array {
  const HAS_VALUE: u32 = 0;
  // ideal: pass pointer to where to put the value
  // need allocate buffer memory with correct size

  // request storage at key, will be written in the scratch buffer
  // If there is an entry at the given location then this function will return 0,
  // if not it will return 1 and clear the scratch buffer.
  let storage: u32 = ext_get_storage(key.byteOffset); // pointer to key 32 bytes in memory

  const defaultValue = new Uint8Array(0);

  // if value is found
  if (storage === HAS_VALUE) {
    // // getting size of scratch buffer to allocate the buffer of corresponding size to fit the contents of the scratch buffer
    const size: u32 = ext_scratch_size();
    // if value is not null or not an empty array
    if (size >  0) {
      // create empty array (Vec in Rust)
      let value = new Uint8Array(size);
      // call
      ext_scratch_read(value.byteOffset, 0, size);
      return value;
    }
  } 
  return defaultValue;
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
// @TODO include u128 from https://github.com/MaxGraey/bignum.wasm 
export function setRentAllowance(value: u128): void {
  const valueBuffer: Uint8Array = value.toUint8Array();
  ext_set_rent_allowance(valueBuffer.byteOffset, valueBuffer.length);
}
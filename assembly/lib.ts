import { 
  ext_get_storage,
  ext_input_size,
  ext_input_copy,
  ext_return,
  ext_scratch_copy,
  ext_scratch_size, 
  ext_set_storage
} from "./env";

export function setStorage(key: Uint8Array, value: Uint8Array): void {
  const pointer = value ? value.byteOffset : 0;
  const length = value ? value.length : 0;
  const valueNonNull = value ? 1 : 0;
  
  // ext_set_storage(key.byteOffset, valueNonNull, pointer, length);
}

export function getStorage(key: Uint8Array): Uint8Array | null {
  const ERR_OK: u32 = 0;
  // ideal: pass pointer to where to put the value
  // need allocate buffer memory with correct size

  // request storage at key, will be written in the one and only scratch buffer
  let result: i32 = ext_get_storage(key.byteOffset);
  // if value is found
  if (result === ERR_OK) {
    // // getting size of scratch buffer to allocate the buffer of corresponding size to fit the contents of the scratch buffer
    // const size: u32= ext_scratch_size();
    // // create empty array (Vec in Rust)
    // let value = new Uint8Array(size);
    // // if value is not null or not an empty array
    // if (size > 0) {
    //   // call
    //   ext_scratch_copy(value.byteOffset, 0, size);
    // }
    // return value;
    return null;
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
  // ext_return(data.byteOffset, data.length);
}

// Some util functions

// import { clockid, clock_time_get, random_get, errno } from "bindings/wasi";

// // Our recycled random byte pointer
// let randomBytePointer = memory.allocate(1);
// export function getRandomNumber(): i32 {
//   if (random_get(randomBytePointer, 1) != errno.SUCCESS) {
//     abort();
//   }
//   return load<u8>(randomBytePointer) as i32;
// }

// export function rotateArrayRight(data: Array<u8>): void {
//   for (let i: i32 = 0; i < data.length - 1; i++) {
//     let rightElement: u8 = data[i + 1];
//     data[i + 1] = data[i];
//     data[i] = rightElement;
//   }
// }

// export function sleep(sleepTicks: i32): void {
//   let lastTime: i32 = getTimeCounter();

//   let shouldLoop: boolean = true;

//   while (shouldLoop) {
//     let currentTime: i32 = getTimeCounter();

//     // See if it is time to update
//     if (abs(lastTime - currentTime) > sleepTicks) {
//       shouldLoop = false;
//     }
//   }
// }

// // Recycle a time pointer to save memory
// let timeCounterPointer = memory.allocate(8);
// function getTimeCounter(): i32 {
//   clock_time_get(clockid.REALTIME, 1000, timeCounterPointer);
//   let timestamp = load<u64>(timeCounterPointer);
//   // Divide by a large number here to get a reasonable counter
//   // As the timestamp is very large
//   return (timestamp / 10000000) as i32;
// }
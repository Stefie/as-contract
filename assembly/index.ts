// 1. put_code(code: bytes) -> code_hash
// 2. instantiate(..., code_hash, input_data) -> address
// 3. call(..., address, input_data)

import { get_storage, set_storage } from './library';

const a = new Uint8Array(1),
      b = new Uint8Array(4);

set_storage(a,b)

// get_storage(a)

// export const A : i32 = 2424

// export function deploy(a : i32, b: i32): i32 {
//   return privateFunction(a, b)
// }

export function call(): void {
  get_storage(a)
}

// const PRIVATE_CONST = 555

// function privateFunction(a : i32, b: i32): i32 {
//   return a + b + PRIVATE_CONST
// }

// const COUNTER_KEY: i32 = 1;
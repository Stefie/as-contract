import { u128 } from "bignum";
import {
  getScratchBuffer,
  getStorage,
  setRentAllowance,
  setScratchBuffer,
  setStorage
} from './lib';

// 1. put_code(code: bytes) -> code_hash
// 2. instantiate(..., code_hash, input_data) -> address
// 3. call(..., address, input_data)
const COUNTER_KEY: Uint8Array = new Uint8Array(32); // [1,1,1,1,1,1,1,1,1 ...] in Rust impl.

// Inc(648) => 0088020000 
// decimal: [0,136,2,0,0]
// Hex: 0x00000288

enum Action {
  Inc,
  Get,
  SelfEvict
}
// class Action with parameter value & method incBy

function handle(input: Uint8Array): Uint8Array { // vec<u8>
  const value : Uint8Array = new Uint8Array(0);
  const counter: Uint8Array = getStorage(COUNTER_KEY);

  // Get action from first byte of the input U8A
  switch (input[0]) {
    case Action.Inc:
      // read 4 bytes (u32) from storageBuffer with offset 1 
      // eg. storageBuffer = [0,136,2,0,0]
      const by: u32 = load<u32>(input.byteOffset, 1);
      const increment = new Uint8Array(by)
      setStorage(COUNTER_KEY, increment)
      break;
    case Action.Get:
      // return the counter from storage
      // eg. storageBuffer = [1]
      if (counter.length)
        return counter;
        // if counter != null return new Uint8Array with value
      break;
    case Action.SelfEvict:
      const allowance = u128.from<i32>(0);
      setRentAllowance(allowance)
      break;
  }
  return value;
}

export function call(): u32 {
  // in ink min 4 bytes
  // input -> byte array
  // decode byte array to array/ enum Action (0,1,2,3) --> SCALE CODEC

  // scratch buffer filled with initial data
  const input: Uint8Array = getScratchBuffer();
  // Handle the message
  const output: Uint8Array = handle(input);
  setScratchBuffer(output);
  return 0;
}

// deploy a new instance of the contract
export function deploy(): u32 {
  return 0
}

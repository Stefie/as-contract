import { u128 } from "bignum/integer/u128";
import {
  consoleLog,
  getScratchBuffer,
  getStorage,
  setRentAllowance,
  setScratchBuffer,
  setStorage
} from './lib';

// 1. put_code(code: bytes) -> code_hash
// 2. instantiate(..., code_hash, input_data) -> address
// 3. call(..., address, input_data)

@external("console", "console_log")
export declare function console_log(pointer: i32): void;

export function say(hello: string): string {
  return hello + " world"
}

const COUNTER_KEY: Uint8Array = new Uint8Array(32);

enum Action {
  Inc,
  Get,
  SelfEvict
}

function handle(input: Uint8Array): Uint8Array { // vec<u8>

  const input2: u8 = 0;
  let counter: Uint8Array | null, value : Uint8Array = new Uint8Array(0);
  switch (input2) {
    case Action.Inc:
      const by: u32 =  66;
      const increment = new Uint8Array(by)
      counter = getStorage(COUNTER_KEY);
      // TODO read incrementer value from storage
      setStorage(COUNTER_KEY, increment)
      break;
    case Action.Get:
      counter = getStorage(COUNTER_KEY);
      // TODO retrun counter or empty vec<u8>
      break;
    case Action.SelfEvict:
      const allowance = u128.from<i32>(0);
      setRentAllowance(allowance)
      break;
  }

  return value;
}

export function call(): u32 {
  consoleLog(2)
  // in ink min 4 bytes
  // input -> byte array
  // decode byte array to array/ enum Action (0,1,2,3) --> SCALE CODEC
  // Patternmatching in Rust, Switch case in JS

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

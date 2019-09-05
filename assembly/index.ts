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

const COUNTER_KEY: Uint8Array = new Uint8Array(32);

enum Action {
  Inc,
  Get,
  SelfEvict
}

function handle(input: Uint8Array): Uint8Array {

  const input2: u8 = 0;
  switch (input2) {
    case Action.Inc:
    consoleLog('test')
      // let counter = getStorage(COUNTER_KEY);
      break;
    case Action.Get:
      // let counter = getStorage(COUNTER_KEY);
      break;
    case Action.SelfEvict:
      // let counter = getStorage(COUNTER_KEY);
      break;
  }

  // const result = counter !== null ?  counter : new Uint8Array(32);
  // return result;

 const dummy = new Uint8Array(32);
  return dummy;
}

export function call(): Uint8Array {
  consoleLog('test')
  // in ink min 4 bytes
  // input -> byte array
  // decode byte array to array/ enum Action (0,1,2,3) --> SCALE CODEC
  // Patternmatching in Rust, Switch case in JS

  // scratch buffer filled with initial data
  const input: Uint8Array = getScratchBuffer();
  // Handle the message
  const output: Uint8Array = handle(input);
  setScratchBuffer(output);
  return input;
}

// deploy a new instance of the contract
export function deploy(): u32 {
  return 0
}

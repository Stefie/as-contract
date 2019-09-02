import { getInput, getStorage, returnPointer, setStorage } from './lib';

// 1. put_code(code: bytes) -> code_hash
// 2. instantiate(..., code_hash, input_data) -> address
// 3. call(..., address, input_data)

const COUNTER_KEY: Uint8Array = new Uint8Array(32);

export function call(): void {

  const input: Uint8Array = getInput(); /// scratch buffer filled with initial data
  const action: Uint8Array = input;

  let counter = getStorage(COUNTER_KEY);
  // const result = counter !== null ?  counter : new Uint8Array(32);
  // return result;

  // switch(action) {
  //   case 'Inc':
  //     function (by) {
  //       let counter = getStorage(COUNTER_KEY);
  //     }
  //     break;
  //   case 'Get':
  //     break;
  // }
}

// deploy a new instance of the contract
export function deploy(): void {}

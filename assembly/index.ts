// 1. put_code(code: bytes) -> code_hash
// 2. instantiate(..., code_hash, input_data) -> address
// 3. call(..., address, input_data)

import { getStorage, getInput, returnPointer, setStorage } from './library';

const a = new Uint8Array(1),
      b = new Uint8Array(4);

// setStorage(a,b)
// getStorage(a)

// const COUNTER_KEY: Uint8Array = new Uint8Array(32);

export function call(): void {

  const input: Uint8Array = getInput(); /// scratch buffer filled with initial data

}

// deploy a new instance of the contract
export function deploy(): void {}

// For more implementation details and code comments on all external host function
// (`ext_`) provided by srml-contracts read:  
// https://github.com/paritytech/substrate/blob/master/srml/contracts/src/wasm/runtime.rs


import { ASUtil, ImportsObject, instantiateStreaming } from 'assemblyscript/lib/loader'

interface Contract extends ASUtil {
  call(): void,
  deploy(): void,
  memory: WebAssembly.Memory
}

interface Env extends ImportsObject {
  env: {
    abort: (msg: number, file: number, line: number, column: number) => void,
    memory?: WebAssembly.Memory,
    trace?: (msg: number, numArgs?: number, ...args: any[]) => void,
    // ext_println?: (ptr: number, len: number) => void,
    ext_get_storage?: (key_ptr: number) => number,
    ext_scratch_read?: (dest_ptr: number, offset: number, len: number) => void,
    ext_scratch_size?: () => number,
    ext_scratch_write?: (src_ptr: number, len: number) => void,
    ext_set_rent_allowance?: (value_ptr: number, value_len: number) => void,
    ext_set_storage?: (key_ptr: number, value_non_null: number, value_ptr: number, value_len: number) => void
  }
}

// Helper function to convert u8a Keys to Hex so we can use them as storage keys
function byteToHex(arrayBuffer: Uint8Array) {
  return Array.prototype.map.call(new Uint8Array(arrayBuffer), x => ('00' + x.toString(16)).slice(-2)).join('');
}

// This is our emulation of substrate storage.
// It should be able to return the value for a specific key which is always
// a Uint8Array with 32 elements represented as a Hex value..
const storage: Record<string, Uint8Array | undefined> = {};
// storage['0000000000000000000000000000000000000000000000000000000000000000'] = new Uint8Array([23,0,0,0]);

const memory = new WebAssembly.Memory({
  initial: 2,
  maximum: 16, // Current maximum in srml-contracts module
});
let scratchBuf: Uint8Array = new Uint8Array(0);

const env: Env = {
  env: {
    abort(msg, file, line, column) {
      console.error(`abort called in ${file}:${line}:${column}: ${msg}`);
    },
    memory: memory,
    ext_get_storage: function (key_ptr: number) { // Value is written in static memory
      console.log('ext_get_storage', key_ptr )    
      // create empty StorageKey of length 32 bytes
      var mem = new Uint8Array(memory.buffer);
      // let key: Uint8Array = new Uint8Array(32);
      const key = Uint8Array.from(mem.slice(key_ptr, key_ptr+32));

      const storageKey = byteToHex(key);
      const value: Uint8Array | undefined = storage[storageKey];
      console.log(key, storageKey, value);
      // return storage['0000000000000000000000000000000000000000000000000000000000000000'] ? 0 : 1;
      if(!value) {
        scratchBuf = new Uint8Array(0);
      }
      return value ? 0 : 1;
    },
    ext_scratch_read: function(dest_ptr: number, offset: number, len: number) {
      console.log(`ext_scratch_read(${dest_ptr}, ${offset}, ${len})`);

      scratchBuf = new Uint8Array(len)
      let mem = new Uint8Array(memory.buffer)
      
      for (let i = 0; i < len; i++) {
        // console.log('mem[dest_ptr + i]', i, mem[dest_ptr + i])
        mem[dest_ptr + i] = scratchBuf[i];
      }
    },
    ext_scratch_size: function () {
      console.log('ext_scratch_size', scratchBuf.length )
      return scratchBuf.length;
    },
    ext_scratch_write: function (src_ptr: number, len: number) {
      console.log('ext_scratch_write', src_ptr, len )

      scratchBuf = new Uint8Array(len)
      var mem = new Uint8Array(memory.buffer)
      for (let i = 0; i < len; i++) {
        // console.log('mem[ptr + i]', i, mem[src_ptr + i])
        scratchBuf[i] = mem[src_ptr + i];
      }
    },
    ext_set_rent_allowance: function (value_ptr: number, value_len: number) {
      console.log('ext_return', value_ptr, value_len)
    },
    ext_set_storage: function (key_ptr: number, value_non_null: number, value_ptr: number, value_len: number) {
      console.log('ext_set_storage', key_ptr, value_non_null, value_ptr, value_len);
      // create empty StorageKey of length 32 bytes
      var mem = new Uint8Array(memory.buffer);
      // let key: Uint8Array = new Uint8Array(32);
      const key = Uint8Array.from(mem.slice(key_ptr, key_ptr+32));

      const storageKey = byteToHex(key);

      console.log("write to STORAGEKEY", storageKey)
      if(value_non_null != 0){

      }
      // const value: Uint8Array | undefined = storage[storageKey];
      // console.log(key, storageKey, value);
      // // return storage['0000000000000000000000000000000000000000000000000000000000000000'] ? 0 : 1;
      // if(!value) {
      //   scratchBuf = new Uint8Array(0);
      // }
      // return value ? 0 : 1;
    }
  }
};

async function main() {
  // rust-counterparts/incrementer.wasm build/untouched.wasm
  const module = await instantiateStreaming(fetch('./build/untouched.wasm'), env as Env) as Contract;
  console.log("instantiated", module);

  scratchBuf = new Uint8Array([ 0,136,2,0,0 ]);
  console.log('before .call with Inc(value)', scratchBuf);
  module.call();
  console.log('after .call with Inc(value)', scratchBuf);

  scratchBuf = new Uint8Array([1]);
  console.log('before .call Get()', scratchBuf);
  module.call();
  console.log('after .call Get()', scratchBuf);

  // scratchBuf = new Uint8Array([2]);
  // console.log('before .call SelfEvict()', scratchBuf);
  // module.call();
  // console.log('after .call SelfEvict()', scratchBuf);
};

main();
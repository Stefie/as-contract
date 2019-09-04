import { ASUtil, ImportsObject, instantiateStreaming, TypedArray } from 'assemblyscript/lib/loader'

interface Contract extends ASUtil {
  call(): void,
  deploy(): void,
  memory: WebAssembly.Memory
}

interface Env extends ImportsObject {
  console?: {
    console_log: (value: any) => void
  }
  env?: {
    memory?: WebAssembly.Memory,
    trace?: (msg: number, numArgs?: number, ...args: any[]) => void,
    ext_get_storage?: (key_ptr: number) => number, 
    ext_println?: (ptr: number, len: number) => void,
    ext_scratch_read?: (dest_ptr: number, offset: number, len: number) => void,
    ext_scratch_size?: () => number,
    ext_scratch_write?: (src_ptr: number, len: number) => void,
    ext_set_rent_allowance?: (value_ptr: number, value_len: number) => void,
    ext_set_storage?: (key_ptr: number, value_non_null: number, value_ptr: number, value_len: number) => void
  }
}

const memory = new WebAssembly.Memory({
  initial: 2,
  maximum: 16,
});
let scratchBuf: Uint8Array = new Uint8Array(0);

const env: Env = {
  console: {
    console_log: function (value: any) {
      console.log('console_log', value )
    }
  },
  env: {
    memory: memory,
    ext_get_storage: function (key_ptr: number) {
      console.log('ext_get_storage', key_ptr )
      return key_ptr;
    }, 
    ext_println: function (ptr: number, len: number) {
      console.log('ext_println', ptr, len )
      // let str = readString(ptr, len);
      // console.log('LOGGED: ', str);
    },
    ext_scratch_read: function(dest_ptr: number, offset: number, len: number) {
      console.log(`ext_scratch_read(dest_ptr=${dest_ptr}, offset=${offset}, len="${len})`);
      let mem = new Uint8Array(memory.buffer);
      for (let i = 0; i < len; i++) {
          mem[dest_ptr + i] = scratchBuf[i];
      }
    },
    ext_scratch_size: function () {
      console.log('ext_scratch_size', scratchBuf.length )
      return scratchBuf.length;
    },
    ext_scratch_write: function (src_ptr: number, len: number) {
      console.log('ext_scratch_write', src_ptr, len )
      var mem = new Uint8Array(memory.buffer);
      console.log('ext_scratch_write mem.values', mem.values)
      // for (let i = 0; i < len; i++) {
      //     scratchBuf.push(mem[ptr + i]);
      // }
      return scratchBuf.length;
    },
    ext_set_rent_allowance: function (value_ptr: number, value_len: number) {
      console.log('ext_return', value_ptr, value_len)
    },
    ext_set_storage: function (key_ptr: number, value_non_null: number, value_ptr: number, value_len: number) {
      console.log('ext_set_storage', key_ptr, value_non_null, value_ptr, value_len)
    }
  }
};

async function main() {
  const module = await instantiateStreaming(fetch('./build/untouched.wasm'), env as Env) as Contract;

  console.log(module)
  module.call()
  module.deploy()

  const memory = module.memory;
  // Create a Uint8Array to give us access to Wasm Memory
  const wasmByteMemoryArray = new Uint8Array(memory.buffer);
  // Let's read index zero from JS, to make sure Wasm wrote to
  // wasm memory, and JS can read the "passed" value from Wasm
  console.log(wasmByteMemoryArray[44]); // Should Log "115".
};

main();
import { ASUtil, ImportsObject, instantiateStreaming, TypedArray } from 'assemblyscript/lib/loader'

interface Contract extends ASUtil {
  call(): void,
  deploy(): void,
  memory: WebAssembly.Memory
}

interface Env extends ImportsObject {
  env?: {
    memory?: WebAssembly.Memory,
    trace?: (msg: number, numArgs?: number, ...args: any[]) => void,
    ext_get_storage?: (key_ptr: number) => number, 
    ext_input_copy?: (dest_ptr: number, offset: number, len: number) => void,
    ext_input_size?: () => number,
    ext_return?: (data_ptr: number, data_len: number) => void,
    ext_scratch_size?: () => number,
    ext_scratch_copy?: (dest_ptr: number, offset: number, len: number) => void,
    ext_set_storage?: (key_ptr: number, value_non_null: number, value_ptr: number, value_len: number) => void,

  }
}

const memory = new WebAssembly.Memory({
  initial: 2,
  maximum: 16,
});
let scratchBuf: any = [];

const env: Env = {
  env: {
    memory: memory,
    ext_get_storage: function (key_ptr: number) {
      console.log('ext_get_storage', key_ptr )
      return key_ptr;
    }, 
    ext_input_copy: function(dest_ptr: number, offset: number, len: number) {
      console.log(`ext_scratch_read(ptr=${dest_ptr}, offset=${offset}, len="${len})`);
      let mem = new Uint8Array(memory.buffer);
      for (var i = 0; i < len; i++) {
          mem[dest_ptr + i] = scratchBuf[i];
      }
    },
    ext_input_size: function() {
      console.log('ext_input_size', scratchBuf.length )
      return scratchBuf.length;
    },
    ext_return: function (data_ptr: number, data_len: number) {
      console.log('ext_return', data_ptr, data_len)
    },
    ext_scratch_size: function () {
      console.log('ext_scratch_size', scratchBuf.length )
      return scratchBuf.length;
    },
    ext_scratch_copy: function (dest_ptr: number, offset: number, len: number) {
      console.log('ext_scratch_copy', dest_ptr, offset, len)
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
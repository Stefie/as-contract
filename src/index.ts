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

const memory = new WebAssembly.Memory({
  initial: 2,
  maximum: 16, // Current maximum in srml-contracts module
});
let scratchBuf: Uint8Array = new Uint8Array(0);

const env: Env = {
  env: {
    abort(msg, file, line, column) {
      console.error("abort called at main.ts:" + line + ":" + column);
    },
    memory: memory,
    ext_get_storage: function (key_ptr: number) {
      console.log('ext_get_storage', key_ptr )
      return key_ptr;
    },
    ext_scratch_read: function(dest_ptr: number, offset: number, len: number) {
      console.log(`ext_scratch_read(dest_ptr=${dest_ptr}, offset=${offset}, len="${len})`);

      scratchBuf = new Uint8Array(len)
      var mem = new Uint8Array(memory.buffer)
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
      console.log('ext_set_storage', key_ptr, value_non_null, value_ptr, value_len)
    }
  }
};

async function main() {
  const module = await instantiateStreaming(fetch('./build/untouched.wasm'), env as Env) as Contract;
  console.log("instantiated", module);

  scratchBuf = new Uint8Array([ 0,136,2,0,0 ]);
  console.log('before .call with inc(value)', scratchBuf);
  module.call()
  console.log('after .call with inc(value)', scratchBuf);

  scratchBuf = new Uint8Array([1]);
  console.log('before call get()', scratchBuf);
  module.call();
  console.log('after call get()', scratchBuf);
};

main();